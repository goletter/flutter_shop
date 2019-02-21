import 'package:flutter/material.dart';
import 'package:flutter_app/page/common/MainPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.red,
      ),
      home: MainPage(),//启动MainPage
    );
  }
}