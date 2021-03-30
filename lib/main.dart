import 'package:flutter/material.dart';
import 'package:if_then_card/page/top_page.dart';

// アプリ起動
void main() {
  runApp(MyApp());
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
