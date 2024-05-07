import 'package:boilerplate/data/dto/response_dto/base_response_dto.dart';
import 'package:boilerplate/data/dto/response_dto/delete_dto/language_response_dto.dart';
import 'package:boilerplate/services/network_service.dart';
import 'package:boilerplate/utility/network/exception_handler.dart';
import 'package:boilerplate/utility/network/result.dart';
import 'package:boilerplate/values/network_constants.dart';
import 'package:dio/dio.dart';

class MiscellaneousRemoteDataSource {
  final Dio _dio = NetworkService.unAuthenticated().dio;
  final Dio _authenticatedDio = NetworkService.authenticated().dio;

  // Making Singleton
  MiscellaneousRemoteDataSource._();

  static MiscellaneousRemoteDataSource? _instance;

  factory MiscellaneousRemoteDataSource() {
    _instance ??= MiscellaneousRemoteDataSource._();
    return _instance!;
  }

  Future<Result<List<LanguageResponseDto>>> fetchAllLanguages() async {
    try {
      final response = await _dio.get(
        ApiEndpoints.getAllLanguages,
      );
      final BaseResponseDto<List<LanguageResponseDto>> data =
          BaseResponseDto.fromSuccessJson(
        response.data,
        (jsonList) => LanguageResponseDto.fromListJson(
          listDynamic: jsonList as List<dynamic>,
        ),
      );
      return Result.success(data: data);
    } catch (error, stackTrace) {
      return await handleDioException<List<LanguageResponseDto>>(
        error,
        stackTrace,
      );
    }
  }
}
