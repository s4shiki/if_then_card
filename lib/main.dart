import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:if_then_card/model/rules.dart';
import 'package:if_then_card/page/top_page.dart';

final rulesProvider = ChangeNotifierProvider(
  (ref) => Rules(), // Rulesのインスタンスが生成される
);

// 起動
void main() {
  runApp(ProviderScope(child: MyApp()));
}

// アプリの設定
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // シミュレーターの右上にdebugというラベルが表示されなくなります
      title: 'IF THEN CARD',
      home: TopPage(), // 起動時に表示される画面
    );
  }
}
