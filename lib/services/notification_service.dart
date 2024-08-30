import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // Initialization settings for Android
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    // Initialization settings for all platforms
    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    // Initializing the plugin with settings and handling notification response
    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        // Handle what happens when a user taps the notification
        // For example, navigate to a specific screen using the payload
        if (response.payload != null) {
          // Perform an action with the payload
          print('Notification Payload: ${response.payload}');
        }
      },
    );
  }

  Future<void> showNotification(String title, String body) async {
    // Define Android-specific notification details
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'channel_id', // Channel ID
      'channel_name', // Channel Name
      channelDescription: 'channel_description', // Channel Description
      importance: Importance.max, // Max importance for high priority notifications
      priority: Priority.high, // High priority
      showWhen: true, // Show timestamp
    );

    // Platform-specific notification details
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    // Show the notification
    await _notificationsPlugin.show(
      0, // Notification ID
      title, // Notification title
      body, // Notification body
      platformChannelSpecifics, // Notification details
      payload: 'Default_Sound', // Payload for handling actions
    );
  }
}
