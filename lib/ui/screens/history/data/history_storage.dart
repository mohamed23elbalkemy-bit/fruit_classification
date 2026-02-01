import '../../result/model/fruit_result_model.dart';

class HistoryStorage {
  static final List<FruitResult> history = [];

  static void add(FruitResult result) {
    history.insert(0, result);
  }
}
