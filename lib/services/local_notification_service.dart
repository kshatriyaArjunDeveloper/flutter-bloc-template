import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  late final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  late final AndroidNotificationDetails _androidPlatformChannelSpecifics;
  late final NotificationDetails _platformChannelSpecifics;

  // Making Singleton
  LocalNotificationService._();

  static final LocalNotificationService _instance =
      LocalNotificationService._();

  factory LocalNotificationService() {
    return _instance;
  }

  void setup() async {
    await _initLocalNotificationChannel();
    await _createAndroidNotificationChannel();
    _makeNotificationDetails();
  }

  Future<void> _initLocalNotificationChannel() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIos =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIos,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _localNotificationTap,
    );
  }

  Future<void> _createAndroidNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  void _makeNotificationDetails() {
    _androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'This channel is for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    _platformChannelSpecifics =
        NotificationDetails(android: _androidPlatformChannelSpecifics);
  }

  Future<void> _localNotificationTap(
    NotificationResponse notificationResponse,
  ) async {
    // todo @Project Setup: Write your own code to handle on click of local notification
    print(
        'DEBUG: Local Notification was tapped with payload: ${notificationResponse.payload.toString()}');
  }

  // todo @Project Setup: Write your own code to show local notification
  /// Shows notification made locally
  Future<void> showNotification({
    required int id,
    String? title,
    String? body,
    String? payload,
  }) async {
    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      _platformChannelSpecifics,
      payload: payload,
    );
  }
}
