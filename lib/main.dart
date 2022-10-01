import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
    final color = useState(Colors.green);

    Color changeColor() {
      if (color.value == Colors.green) {
        return color.value = Colors.red;
      } else if (color.value == Colors.red) {
        return color.value = Colors.blue;
      } else {
        return color.value = Colors.green;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: color.value,
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
                onPressed: () {
                  changeColor();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: color.value,
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  "Change Color",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
