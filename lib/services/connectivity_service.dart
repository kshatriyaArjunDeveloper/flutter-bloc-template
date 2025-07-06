import 'package:boilerplate/utility/logs/sentry_log_utility.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  // Making Singleton
  ConnectivityService._();

  static final ConnectivityService _instance = ConnectivityService._();

  factory ConnectivityService() => _instance;

  Future<bool> isNetworkAvailable() async {
    try {
      final connectivity = await Connectivity().checkConnectivity();
      return connectivity.isNotEmpty &&
          connectivity.any((result) => result != ConnectivityResult.none);
    } catch (error, stackTrace) {
      captureSentryException(error, stackTrace);
      return true;
    }
  }
}
