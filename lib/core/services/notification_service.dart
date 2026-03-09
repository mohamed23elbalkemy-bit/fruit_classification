import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
  FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings =
    InitializationSettings(android: androidSettings);

    await _notifications.initialize(settings);

    /// request permission for Android 13+
    await _notifications
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidDetails =
    AndroidNotificationDetails(
      'fruit_channel',
      'Fruit Notifications',
      channelDescription: 'Notifications for fruit classification',
      importance: Importance.max,
      priority: Priority.high,
      playSound: false, // بدون صوت
      enableVibration: true,
    );

    const NotificationDetails details =
    NotificationDetails(android: androidDetails);

    await _notifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      details,
    );
  }

  /// 🍎 classification success
  static Future<void> showClassificationSuccess() async {
    await showNotification(
      title: "FruitAI 🍎",
      body: "Fruit classified successfully!",
    );
  }

  /// 📊 saved to history
  static Future<void> showHistorySaved() async {
    await showNotification(
      title: "Saved 📊",
      body: "Result added to history",
    );
  }
  static Future showHistoryDeleted() async {
    await _notifications.show(
      6,
      "History Cleared 🗑",
      "All classifications have been deleted",
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "delete_channel",
          "Delete",
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
    );
  }
  static Future scheduleReminder() async {
    await _notifications.periodicallyShow(
      5,
      "FruitAI Reminder ⏰",
      "Don't forget to scan your fruits today!",
      RepeatInterval.daily,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "reminder_channel",
          "Reminders",
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidAllowWhileIdle: true,
    );
  }
}