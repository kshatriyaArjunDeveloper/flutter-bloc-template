import 'dart:async';

import 'package:boilerplate/router/app_routes.dart';
import 'package:boilerplate/router/go_route.dart';
import 'package:boilerplate/services/local_db_service.dart';
import 'package:boilerplate/theme/app_fonts.dart';
import 'package:boilerplate/utility/logs/sentry_log_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: "asset/.env");
    await LocalDbService.instance.initializeDb();
    await SentryFlutter.init(
      (options) {
        options.dsn = dotenv.env['SENTRY_DSN'];
        options.tracesSampleRate = 1.0;
      },
      appRunner: () {
        _setCustomErrorWidget();
        runApp(const MyApp());
      },
    );
  }, (error, stack) {
    captureSentryException(error, stack);
  });
}

void _setCustomErrorWidget() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    captureSentryException(details.exception, details.stack!);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Error!\n${details.exception}',
          style: const TextStyle(color: Colors.black38),
          textAlign: TextAlign.center,
        ),
      ),
    );
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      return _addOptionToOpenAllWidgetsScreen(_buildMaterialApp());
    } else {
      return _buildMaterialApp();
    }
  }

  Widget _buildMaterialApp() {
    return ScreenUtilInit(
      // todo @Project Setup: Add your screen design size
      designSize: const Size(390, 844),
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            // todo @Project Setup: Add your app default font
            fontFamily: AppFonts.proxima,
          ),
          routerConfig: goRouter,
        );
      },
    );
  }

  Widget _addOptionToOpenAllWidgetsScreen(Widget child) {
    return GestureDetector(
      onLongPress: () {
        goRouter.push(
          AppRoutes.widgetScreen,
        );
      },
      child: child,
    );
  }
}
