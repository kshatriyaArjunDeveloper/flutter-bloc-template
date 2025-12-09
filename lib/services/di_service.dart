import 'package:boilerplate/data/data_source/local_data_source/user_local_data_source.dart';
import 'package:boilerplate/data/data_source/remote_data_source/miscellaneous_remote_data_source.dart';
import 'package:boilerplate/data/repository/miscellaneous_repository.dart';
import 'package:boilerplate/presentation/dashboard_module/home_screen/bloc/home_screen_cubit.dart';
import 'package:boilerplate/services/local_db_service.dart';
import 'package:boilerplate/services/network_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  _configureBaseServices();
  _configureRemoteDataSources();
  _configureRepositories();
}

void _configureBaseServices() {
  // Register base services
  getIt.registerSingleton<LocalDbService>(LocalDbService.instance);
  getIt.registerSingleton<NetworkService>(
    NetworkService.unAuthenticated(),
    instanceName: 'unauthenticated',
  );

  // Register UserLocalDataSource
  getIt.registerSingleton<UserLocalDataSource>(
    UserLocalDataSource(
      localDbService: getIt<LocalDbService>(),
    ),
  );

  // Register authenticated NetworkService
  // because _TokenInterceptor depends on UserLocalDataSource
  getIt.registerSingleton<NetworkService>(
    NetworkService.authenticated(),
    instanceName: 'authenticated',
  );

  // Register payment processors
  getIt.registerFactory<PaymentProcessor>(
    () => StripePaymentProcessor(),
    instanceName: 'stripe',
  );
  getIt.registerFactory<PaymentProcessor>(
    () => PayPalPaymentProcessor(),
    instanceName: 'paypal',
  );
}

void _configureRemoteDataSources() {
  getIt.registerSingleton<MiscellaneousRemoteDataSource>(
    MiscellaneousRemoteDataSource(
      dio: getIt<NetworkService>(instanceName: 'unauthenticated').dio,
    ),
  );
}

void _configureRepositories() {
  getIt.registerSingleton<MiscellaneousRepository>(
    MiscellaneousRepository(
      remoteDataSource: getIt<MiscellaneousRemoteDataSource>(),
    ),
  );
}
