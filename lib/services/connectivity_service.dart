import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  // Making Singleton
  ConnectivityService._();

  static final ConnectivityService _instance = ConnectivityService._();

  factory ConnectivityService() => _instance;

  Future<bool> isNetworkAvailable() async {
    final connectivity = await _connectivity.checkConnectivity();
    return connectivity != ConnectivityResult.none;
  }
}
