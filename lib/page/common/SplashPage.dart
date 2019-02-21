import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_shop/page/common/MainPage.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashState();
  }
}

class SplashState extends State<SplashPage> {

  Timer _t;

  @override
  void initState() {
    super.initState();
    _t = new Timer(const Duration(milliseconds: 3000), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
            builder: (BuildContext context) => new MainPage()), (
            Route route) => route == null);
      } catch (e) {

      }
    });
  }

  @override
  void dispose() {
    _t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black12,
      child: new Padding(
        padding: const EdgeInsets.only(
          top: 150.0,
        ),
        child: new Column(
          children: <Widget>[
            new Text("测试启动页",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}