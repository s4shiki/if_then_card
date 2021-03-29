import 'package:flutter/material.dart';

// トップ画面（ルール一覧）
class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CARD LIST'),
        actions: [
          Tooltip(message: 'アイコンボタンをホバーしたときに表示されるテキスト'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => print('ルール追加画面に遷移するよ'),
          )
        ],
      ),
      body: Center(child: Text('ルールを一覧表示するよ')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('ルール追加画面に遷移するよ'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
