import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:plum/utils/utils.dart';

class NotificationService {
  NotificationService._privateConstructor();

  static final NotificationService instance = NotificationService._privateConstructor();
  String? fcmToken;
  FirebaseMessaging? firebaseMessaging;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    logs('Background message Id : ${message.messageId}');
    logs('Background message Time : ${message.sentTime}');
  }

  Future<void> initializeNotification() async {
    await Firebase.initializeApp();
    await initializeLocalNotification();
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings notificationSettings = await firebaseMessaging.requestPermission(announcement: true);

    logs('Notification permission status : ${notificationSettings.authorizationStatus.name}');

    fcmToken = await firebaseMessaging.getToken();
    logs('FCM Token --> $fcmToken');
    if (notificationSettings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) async {
        // logs('Message title: ${remoteMessage.notification!.title}, body: ${remoteMessage.notification!.body}');

        AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
          'CHANNEL ID',
          'CHANNEL NAME',
          channelDescription: 'CHANNEL DESCRIPTION',
          importance: Importance.max,
          priority: Priority.max,
        );
        DarwinNotificationDetails iosNotificationDetails = const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        );
        NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails, iOS: iosNotificationDetails);

        await flutterLocalNotificationsPlugin.show(
          0,
          remoteMessage.notification!.title!,
          remoteMessage.notification!.body!,
          notificationDetails,
        );
      });
    }
  }

  initializeLocalNotification() {
    AndroidInitializationSettings android = const AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings ios = const DarwinInitializationSettings();
    InitializationSettings platform = InitializationSettings(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.initialize(platform);
  }
}
