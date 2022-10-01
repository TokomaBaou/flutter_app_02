import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

// TODO: Hook機能を使ってないのでStatelessで良い。
// 使ってないのにHookやConsumerを定義してしまうと、可読性が下がってしまいます。
class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Change Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyAppPage(title: 'Change Background Color'),
    );
  }
}

class MyAppPage extends HookWidget {
  const MyAppPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    //インスタンスを作成
    // TODO: 変数で管理しているのは色のため、changeって命名は適切ではない
    final change = useState(Colors.green);

    // TODO:下で指摘した用の関数の土台
    Color changeColor() {
      return Colors.pink;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        backgroundColor: change.value,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ボタンを押すと背景の色が変わります',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                // TODO: onPressedの中身が長いので、関数に切り出す
                onPressed: () {
                  if (change.value == Colors.green) {
                    change.value = Colors.red;
                  } else if (change.value == Colors.red) {
                    change.value = Colors.blue;
                  } else {
                    change.value = Colors.green;
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: change.value,
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  "Change Color",
                ),
              ),
            ),
          ],
          // TODO: カンマを入れて改行を整えましょう
        )));
  }
}
