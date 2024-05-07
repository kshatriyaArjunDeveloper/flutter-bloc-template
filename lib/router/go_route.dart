import 'package:boilerplate/presentation/dashboard_module/home_screen/bloc/home_screen_cubit.dart';
import 'package:boilerplate/presentation/dashboard_module/home_screen/home_screen.dart';
import 'package:boilerplate/presentation/delete_module/select_language_screen/bloc/select_language_cubit.dart';
import 'package:boilerplate/presentation/delete_module/select_language_screen/select_language_screen.dart';
import 'package:boilerplate/presentation/miscellaneous_module/widget_screen/widget_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app_routes.dart';

final GoRouter goRouter = GoRouter(
  observers: [
    SentryNavigatorObserver(),
  ],
  initialLocation: AppRoutes.homeScreen,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: AppRoutes.widgetScreen,
      builder: (context, state) => const WidgetScreen(),
    ),
    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) => BlocProvider(
        create: (BuildContext context) {
          return HomeScreenCubit();
        },
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
        path: AppRoutes.selectLanguageScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) {
              return SelectLanguageCubit();
            },
            child: const SelectLanguageScreen(),
          );
        }),
  ],
);
