import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void captureSentryException(dynamic error, StackTrace stackTrace) {
  if (kDebugMode) {
    print(error);
    print(stackTrace);
  }
  Sentry.captureException(error, stackTrace: stackTrace);
}
