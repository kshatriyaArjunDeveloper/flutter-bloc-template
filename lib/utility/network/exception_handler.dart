import 'package:boilerplate/data/dto/response_dto/base_response_dto.dart';
import 'package:boilerplate/services/connectivity_service.dart';
import 'package:boilerplate/utility/logs/sentry_log_utility.dart';
import 'package:boilerplate/utility/network/result.dart';
import 'package:boilerplate/values/app_strings.dart';
import 'package:dio/dio.dart';

Future<Result<T>> handleDioException<T>(
  Object error,
  StackTrace stackTrace,
) async {
  try {
    captureSentryException(error, stackTrace);

    final bool isDioException = error is DioException;
    if (!isDioException) {
      return Result.noResponse(
        statusCode: 0,
        noResponseErrorMessage: AppStrings.somethingWentWrong,
        isNoInternet: false,
      );
    }

    if (error.response?.data != null) {
      final BaseResponseDto<T> data = BaseResponseDto.fromErrorJson(
        error.response!.data,
      );
      return Result.error(
        statusCode: error.response!.statusCode!,
        data: data,
      );
    } else {
      final isInternetAvailable =
          await ConnectivityService().isNetworkAvailable();
      if (!isInternetAvailable) {
        return Result.noResponse(
          statusCode: 0,
          noResponseErrorMessage: AppStrings.noInternet,
          isNoInternet: true,
        );
      }

      switch (error.response?.statusCode ?? 0) {
        case 403:
          return Result.noResponse(
            statusCode: 403,
            noResponseErrorMessage: AppStrings.error_403,
            isNoInternet: false,
          );
        case 404:
          return Result.noResponse(
            statusCode: 404,
            noResponseErrorMessage: AppStrings.error_404,
            isNoInternet: false,
          );
        case 500:
          return Result.noResponse(
            statusCode: 500,
            noResponseErrorMessage: AppStrings.error_500,
            isNoInternet: false,
          );
        default:
          return Result.noResponse(
            statusCode: error.response?.statusCode ?? 0,
            noResponseErrorMessage: AppStrings.somethingWentWrong,
            isNoInternet: false,
          );
      }
    }
  } catch (error, stackTrace) {
    captureSentryException(error, stackTrace);
    return Result.noResponse(
      statusCode: 0,
      noResponseErrorMessage: AppStrings.somethingWentWrong,
      isNoInternet: false,
    );
  }
}
