import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:if_then_card/main.dart';
import 'package:if_then_card/model/rule.dart';
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
class RuleListWidget extends ConsumerWidget {
  // カード上部の背景色リスト
  final List<Color> colors = [
    Colors.blueAccent,
    Colors.orangeAccent,
    Colors.greenAccent,
    Colors.redAccent
  ];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // カードに表示するルールリスト
    final rules = watch(rulesProvider).rules;

    return ListView.builder(
      itemCount: rules.length,
      itemBuilder: (context, index) {
        // リスト生成
        return RuleWidget(
          rule: rules[index],
          conditionColor: colors[index % colors.length],
        );
      },
    );
  }
}

// ルールカード
class RuleWidget extends StatelessWidget {
  final Rule rule;
  final Color conditionColor;

  RuleWidget({this.rule, this.conditionColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onLongPress: () => context.read(rulesProvider).delete(rule),
        child: Column(
          children: [
            ListTile(
              title: Text(
                rule.situation,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              tileColor: conditionColor,
            ),
            ListTile(
              leading: Icon(Icons.subdirectory_arrow_right),
              title: Text(rule.action),
            ),
          ],
        ),
      ),
    );
  }
}
