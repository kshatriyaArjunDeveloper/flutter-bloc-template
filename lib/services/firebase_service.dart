import 'package:boilerplate/firebase_options.dart';
import 'package:boilerplate/services/firebase_notification_service.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  // Making Singleton
  FirebaseService._();

  static final FirebaseService _instance = FirebaseService._();

  factory FirebaseService() => _instance;

  Future<void> setup() async {
    await _initializeFirebaseApp();
    FirebaseNotificationService().setup();
  }

  Future<void> _initializeFirebaseApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
