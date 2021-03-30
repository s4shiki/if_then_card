import 'package:flutter/material.dart';

// トップ画面
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
      // body: Center(child: Text('ルールを一覧表示するよ')),
      body: RuleListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('ルール追加画面に遷移するよ'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ルール一覧
class RuleListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> rules = [
      'ビールが欲しくなったら => 炭酸水を飲む',
      '食べたくなったら => ナッツを食べる',
      'タバコが吸いたくなったら => ニコレスを吸う'
    ];

    return ListView.builder(
      itemCount: rules.length, // リスト数を与える
      itemBuilder: (context, index) {
        // 表示内容を返す。itemCount分だけ繰り返される。indexは0からカウントアップする
        return Text(rules[index]);
      },
    );
  }
}
