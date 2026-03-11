import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../result/model/fruit_result_model.dart';

class HistoryStorage {

  static List<FruitResult> history = [];

  static Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString('history');

    if (data != null) {
      List decoded = jsonDecode(data);

      history = decoded
          .map((e) => FruitResult.fromJson(e))
          .toList();
    }
  }

  static Future<void> add(FruitResult result) async {
    history.insert(0, result);
    await _save();
  }

  static Future<void> removeAt(int index) async {
    history.removeAt(index);
    await _save();
  }

  static Future<void> clear() async {
    history.clear();
    await _save();
  }

  static Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();

    final encoded = jsonEncode(
      history.map((e) => e.toJson()).toList(),
    );

    await prefs.setString('history', encoded);
  }
}