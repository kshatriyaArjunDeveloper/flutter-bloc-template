import 'package:boilerplate/data/data_source/local_data_source/user_local_data_source.dart';
import 'package:boilerplate/data/data_source/remote_data_source/miscellaneous_remote_data_source.dart';
import 'package:boilerplate/data/dto/response_dto/delete_dto/language_response_dto.dart';
import 'package:boilerplate/utility/network/result.dart';

class MiscellaneousRepository {
  final MiscellaneousRemoteDataSource remoteDataSource =
      MiscellaneousRemoteDataSource();
  final UserLocalDataSource _localDataSource = UserLocalDataSource();

  // Making Singleton
  MiscellaneousRepository._();

  static MiscellaneousRepository? _instance;

  factory MiscellaneousRepository() {
    _instance ??= MiscellaneousRepository._();
    return _instance!;
  }

  Future<Result<List<LanguageResponseDto>>> getAllLanguages() async =>
      await remoteDataSource.fetchAllLanguages();
}
