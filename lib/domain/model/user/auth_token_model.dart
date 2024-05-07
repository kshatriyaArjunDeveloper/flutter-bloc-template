import 'package:isar/isar.dart';

part 'auth_token_model.g.dart';

@collection
@Name('AuthenticationToken')
// todo @Project Setup: Change the class according to your API response
class AuthTokenModel {
  final Id id = 0;
  final String accessToken;
  final String refreshToken;

  AuthTokenModel({
    required this.accessToken,
    required this.refreshToken,
  });
}
