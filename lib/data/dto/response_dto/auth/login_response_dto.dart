// todo @Project Setup: Change the class according to your API response
class LogInResponseDto {
  String accessToken;
  String refreshToken;

  LogInResponseDto({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LogInResponseDto.fromJson(Map<String, dynamic> json) =>
      LogInResponseDto(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
