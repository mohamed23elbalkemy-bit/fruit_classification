import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.init();
  // await NotificationService.scheduleReminder();

  runApp(const FruitClassificationApp());
}