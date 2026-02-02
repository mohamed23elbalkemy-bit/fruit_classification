import '../../result/model/fruit_result_model.dart';

class HistoryStorage {
  static final List<FruitResult> history = [];
  /// add item
  static void add(FruitResult result) {
    history.insert(0, result);
  }
  /// delete single item
  static void removeAt(int index) {
    history.removeAt(index);
  }

  /// delete all
  static void clear() {
    history.clear();
  }
}
