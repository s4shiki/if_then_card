import 'package:flutter/material.dart';

// ルール追加画面
class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD RULE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RuleForm(),
      ),
    );
  }
}

// ルールフォーム
class RuleForm extends StatefulWidget {
  @override
  _RuleFormState createState() => _RuleFormState();
}

class _RuleFormState extends State<RuleForm> {
  final _formKey = GlobalKey<FormState>();

  // Submit時にフォームに値が入力されているか確認するメソッド
  String inputValid(value) {
    if (value == null || value.isEmpty) {
      return '入力してください';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    String situationText; // 条件の入力値
    String actionText; // 行動の入力値

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "条件",
              hintText: "朝起きたら",
            ),
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (text) {
              print("条件の入力値：$text");
              situationText = text;
            },
            validator: (value) => inputValid(value),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "行動",
              hintText: "水を飲む",
            ),
            textAlign: TextAlign.center,
            onChanged: (text) {
              print("行動の入力値：$text");
              actionText = text;
            },
            validator: (value) => inputValid(value),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('登録しました')));
                  print("登録したよ。条件：$situationText 行動：$actionText");
                }
              },
              child: Text("Submit"),
            ),
          )
        ],
      ),
    );
  }
}
