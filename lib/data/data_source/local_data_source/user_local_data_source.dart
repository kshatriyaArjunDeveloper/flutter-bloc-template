import 'package:boilerplate/domain/model/user/auth_token_model.dart';
import 'package:boilerplate/services/local_db_service.dart';
import 'package:isar/isar.dart';

class UserLocalDataSource {
  final IsarCollection _isarAuth = LocalDbService.instance.isar.authTokenModels;

  // Making Singleton
  UserLocalDataSource._();

  static UserLocalDataSource? _instance;

  factory UserLocalDataSource() {
    _instance ??= UserLocalDataSource._();
    return _instance!;
  }

  Future<void> saveAuthToken(AuthTokenModel authTokenModel) async {
    await _isarAuth.isar.writeTxn(() async {
      await _isarAuth.put(authTokenModel);
    });
  }

  Future<AuthTokenModel?> getAuthToken() async {
    final AuthTokenModel? authTokenModel = await _isarAuth.get(0);
    return authTokenModel;
  }

  Future<void> clearAuthDb() async {
    await _isarAuth.isar.writeTxn(() async {
      await _isarAuth.clear();
    });
  }

  // todo @Project Setup: Add code to clear all saved data
  Future<void> clearDataBase() async {
    await clearAuthDb();
  }
}
