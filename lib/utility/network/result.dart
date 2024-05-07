import 'package:boilerplate/data/dto/response_dto/base_response_dto.dart';

class Result<T> {
  final int statusCode;
  final BaseResponseDto<T>? baseResponse;
  final String? noResponseError;
  final bool isNoInternet;

  Result._({
    required this.statusCode,
    this.baseResponse,
    this.noResponseError,
    this.isNoInternet = false,
  });

  factory Result.success({
    required BaseResponseDto<T> data,
  }) {
    return Result._(
      statusCode: data.code,
      baseResponse: data,
    );
  }

  factory Result.error({
    required int statusCode,
    required BaseResponseDto<T> data,
  }) {
    return Result._(
      statusCode: statusCode,
      baseResponse: data,
    );
  }

  factory Result.noResponse({
    required int statusCode,
    required String noResponseErrorMessage,
    required bool isNoInternet,
  }) {
    return Result._(
      statusCode: statusCode,
      noResponseError: noResponseErrorMessage,
      isNoInternet: isNoInternet,
    );
  }

  factory Result.fromModel({
    required Result result,
    required T? model,
  }) {
    return Result._(
      statusCode: result.statusCode,
      isNoInternet: result.isNoInternet,
      noResponseError: result.noResponseError,
      baseResponse: result.baseResponse != null
          ? BaseResponseDto<T>.fromModel(
              baseResponseDto: result.baseResponse!,
              data: model as T,
            )
          : null,
    );
  }

  hasNoBackendResponse() => noResponseError != null;

  hasData() => baseResponse != null && baseResponse!.success;

  hasBackendErrorMessage() =>
      !(baseResponse?.success ?? false) && (baseResponse?.message != null);

  hasBackendSuccessMessage() =>
      (baseResponse!.success) && (baseResponse?.message != null);

  hasBackendValidationError() =>
      !(baseResponse?.success ?? false) && (baseResponse?.errors != null);
}
