class BaseResponseDto<T> {
  final bool success;
  final int code;
  final T? data;
  final String? message;
  final Map<String, List<String>>? errors;

  BaseResponseDto._({
    required this.success,
    required this.code,
    this.data,
    this.message,
    this.errors,
  });

  factory BaseResponseDto.fromSuccessJson(
    Map<String, dynamic> json,
    T Function(dynamic) pareDataJson,
  ) {
    final String? message = json['message'] != null ? json['message'] : null;
    final int? code = json['code'] != null ? json['code'] : null;
    final int status = code ?? (json['status'] != null ? json['status'] : null);
    return BaseResponseDto._(
      success: json['success'],
      code: code ?? status,
      data: pareDataJson(json['data']),
      message: message,
    );
  }

  factory BaseResponseDto.fromErrorJson(Map<String, dynamic> json) {
    final String? message = json['message'] != null ? json['message'] : null;
    final Map<String, List<String>>? errors = json['errors'] == null
        ? null
        : Map<String, List<String>>.from(
            json['errors'].map(
              (key, value) => MapEntry(
                key,
                List<String>.from(value),
              ),
            ),
          );

    return BaseResponseDto._(
      success: json['success'],
      code: json['code'],
      message: message,
      errors: errors,
    );
  }

  factory BaseResponseDto.fromModel({
    required BaseResponseDto baseResponseDto,
    required T data,
  }) {
    return BaseResponseDto._(
      success: baseResponseDto.success,
      code: baseResponseDto.code,
      data: data,
      message: baseResponseDto.message,
      errors: baseResponseDto.errors,
    );
  }
}
