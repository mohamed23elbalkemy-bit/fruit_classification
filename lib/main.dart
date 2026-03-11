import 'package:flutter/material.dart';
import 'package:fruit_classification/ui/screens/history/data/history_storage.dart';
import 'app/app.dart';
import 'core/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.init();
  await HistoryStorage.load();

  runApp(const FruitClassificationApp());
}