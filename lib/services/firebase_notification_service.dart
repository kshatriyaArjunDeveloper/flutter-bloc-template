import 'dart:math';

import 'package:boilerplate/data/data_source/local_data_source/user_local_data_source.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'local_notification_service.dart';

class FirebaseNotificationService {
  // Making Singleton
  FirebaseNotificationService._();

  static final FirebaseNotificationService _instance =
      FirebaseNotificationService._();

  factory FirebaseNotificationService() => _instance;

  FirebaseMessaging? _messaging;

  Future<void> setup() async {
    LocalNotificationService().setup();
    _initializeFirebaseMessaging();
    _requestPermissions();
    _listenNotificationsInForeground();
    _listenNotificationClickFromBackground();
  }

  void _initializeFirebaseMessaging() {
    _messaging ??= FirebaseMessaging.instance;
    _messaging!.getToken().then((token) {
      UserLocalDataSource().saveFcmToken(token);
      // todo @Project Setup: Write your own code to handle fcm token
      print('DEBUG: FCM Token: $token');
    });
  }

  void _requestPermissions() async {
    _messaging!.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
  }

  void _listenNotificationsInForeground() {
    FirebaseMessaging.onMessage.listen(
      (message) {
        // todo @Project Setup: Write your own code
        print('DEBUG: Notification Received : ${message.notification?.title}');
        if (message.notification != null) {
          final int randomId = Random().nextInt(100);
          LocalNotificationService().showNotification(
            id: randomId,
            title: message.notification!.title,
            body: message.notification!.body,
            payload: 'Pay Load',
          );
        }
      },
    );
  }

  /// Will work when app is in background or terminated state
  void _listenNotificationClickFromBackground() {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (event) {
        // todo @Project Setup: Write your own code
        print('DEBUG: Notification Tapped : ${event.notification?.title}');
      },
    );
  }
}
