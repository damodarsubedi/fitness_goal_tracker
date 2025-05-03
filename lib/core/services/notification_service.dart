import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_goal_tracker/core/services/firebase_service.dart';

class NotificationService {
  final FirebaseMessaging _messaging;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  NotificationService(this._messaging, this._flutterLocalNotificationsPlugin);

  Future<void> init() async {
    final settings = await _messaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        showLocalNotification(message);
      });
    }
  }

  void showLocalNotification(RemoteMessage message) {
    final notification = message.notification;
    if (notification != null) {
      _flutterLocalNotificationsPlugin.show(
        0,
        notification.title,
        notification.body,
        NotificationDetails(android: AndroidNotificationDetails('default_channel', 'Gym Goals')),
      );
    }
  }
}

final notificationServiceProvider = Provider<NotificationService>((ref) {
  final messaging = ref.watch(firebaseMessagingProvider);
  final flutterLocal = FlutterLocalNotificationsPlugin();
  return NotificationService(messaging, flutterLocal);
});
