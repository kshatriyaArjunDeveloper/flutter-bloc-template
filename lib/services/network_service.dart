import 'package:boilerplate/data/data_source/local_data_source/user_local_data_source.dart';
import 'package:boilerplate/data/dto/response_dto/auth/login_response_dto.dart';
import 'package:boilerplate/data/dto/response_dto/base_response_dto.dart';
import 'package:boilerplate/domain/model/user/auth_token_model.dart';
import 'package:boilerplate/router/app_routes.dart';
import 'package:boilerplate/router/go_route.dart';
import 'package:boilerplate/utility/network/exception_handler.dart';
import 'package:boilerplate/utility/network/result.dart';
import 'package:boilerplate/values/network_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkService {
  late final Dio dio;
  final bool needAuthorization;

  // Making Singleton
  static NetworkService? _unAuthenticatedInstance;

  factory NetworkService.unAuthenticated() {
    _unAuthenticatedInstance ??= NetworkService._(
      needAuthorization: false,
    );
    return _unAuthenticatedInstance!;
  }

  static NetworkService? _authenticatedInstance;

  factory NetworkService.authenticated() {
    _authenticatedInstance ??= NetworkService._(
      needAuthorization: true,
    );
    return _authenticatedInstance!;
  }

  NetworkService._({
    required this.needAuthorization,
  }) {
    final baseOptions = BaseOptions(
      baseUrl: NetworkConstants.baseURL,
      connectTimeout:
          const Duration(seconds: NetworkConstants.connectTimeoutSeconds),
      receiveTimeout:
          const Duration(seconds: NetworkConstants.receiveTimeoutSeconds),
    );

    dio = Dio(baseOptions);
    if (kDebugMode) {
      final logInterceptor = PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      );
      dio.interceptors.add(logInterceptor);
    }
    if (needAuthorization) {
      dio.interceptors.add(_TokenInterceptor());
    }
  }
}

class _TokenInterceptor extends Interceptor {
  final UserLocalDataSource _userLocalDataSource = UserLocalDataSource();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final AuthTokenModel? tokens = await _userLocalDataSource.getAuthToken();
    if (tokens == null) {
      _logoutAndClearData();
    } else {
      final String accessToken = tokens.accessToken;
      options.headers.addAll({
        'Authorization': 'Bearer $accessToken',
      });
    }

    super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshAccessTokenResponse = await _fetchNewAccessToken();
      if (refreshAccessTokenResponse.hasData()) {
        final LogInResponseDto newAccessToken =
            refreshAccessTokenResponse.baseResponse!.data!;
        await _userLocalDataSource.saveAuthToken(
          AuthTokenModel(
            accessToken: newAccessToken.accessToken,
            refreshToken: newAccessToken.refreshToken,
          ),
        );
        final response = await _retry(err.requestOptions);
        handler.resolve(response);
      } else {
        await _logoutAndClearData();
      }
    }
    super.onError(err, handler);
  }

  Future<Result<LogInResponseDto>> _fetchNewAccessToken() async {
    final AuthTokenModel? token = await _userLocalDataSource.getAuthToken();
    final Dio _dio = NetworkService.unAuthenticated().dio;
    _dio.options.headers = {
      'Authorization': 'Bearer ${token!.refreshToken}',
    };
    try {
      final response = await _dio.post(
        ApiEndpoints.refreshToken,
      );
      final BaseResponseDto<LogInResponseDto> data =
          BaseResponseDto.fromSuccessJson(
        response.data,
        (json) => LogInResponseDto.fromJson(json),
      );
      return Result.success(data: data);
    } catch (error, stackTrace) {
      return await handleDioException<LogInResponseDto>(
        error,
        stackTrace,
      );
    } finally {
      _dio.options.headers = null;
    }
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final Dio _dio = NetworkService.authenticated().dio;
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    final response = await _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );

    return response;
  }

  Future<void> _logoutAndClearData() async {
    await _userLocalDataSource.clearDataBase();
    // todo @Project Setup: Add your screen when user gets log out
    goRouter.go(AppRoutes.homeScreen);
  }
}
