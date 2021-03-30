import 'rule.dart';
import 'package:flutter/foundation.dart';

// ルールリストモデル
class Rules extends ChangeNotifier {
  List<Rule> rules = [];

  // ルールの追加
  void add({String situation, String action}) {
    rules.add(Rule(situation: situation, action: action));
    notifyListeners();
  }

  // ルールの削除
  void delete(Rule target) {
    rules.remove(target);
    notifyListeners();
  }
}
