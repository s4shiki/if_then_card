import 'package:flutter/material.dart';
import 'package:if_then_card/page/add_page.dart';

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
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPage()),
            ),
          )
        ],
      ),
      body: RuleListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddPage()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ルール一覧
class RuleListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // カードに表示するルールリスト
    final List<Map<String, String>> rules = [
      {'situation': 'ビールが欲しくなったら', 'action': '炭酸水を飲む'},
      {'situation': '食べたくなったら', 'action': 'ナッツを食べる'},
      {'situation': 'タバコが吸いたくなったら', 'action': '二コレスを吸う'},
    ];
    // カード上部の背景色リスト
    final List<Color> colors = [
      Colors.blueAccent,
      Colors.orangeAccent,
      Colors.greenAccent,
      Colors.redAccent
    ];

    return ListView.builder(
      itemCount: rules.length,
      itemBuilder: (context, index) {
        // リスト生成
        return RuleWidget(
          situation: rules[index]['situation'],
          action: rules[index]['action'],
          conditionColor: colors[index % colors.length],
        );
      },
    );
  }
}

// ルールカード
class RuleWidget extends StatelessWidget {
  final String situation;
  final String action;
  final Color conditionColor;

  RuleWidget({this.situation, this.action, this.conditionColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onLongPress: () => {print('長押しで削除するよ')},
        child: Column(
          children: [
            ListTile(
              title: Text(
                situation,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              tileColor: conditionColor,
            ),
            ListTile(
              leading: Icon(Icons.subdirectory_arrow_right),
              title: Text(action),
            ),
          ],
        ),
      ),
    );
  }
}
