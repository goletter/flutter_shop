import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<LoginPage> {
  var leftRightPadding = 30.0;
  var topBottomPadding = 2.0;
  var textTips = new TextStyle(fontSize: 16.0, color: Colors.black);
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);
  static const LOGO = "images/oschina.png";

  var _userPassController = new TextEditingController();
  var _userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("登录"),
        centerTitle: true,
      ),
      body: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Padding(
              padding: new EdgeInsets.fromLTRB(leftRightPadding, 50.0, leftRightPadding, 10.0),
              child: new Image.asset(LOGO),
          ),
          new Padding(
              padding: new EdgeInsets.fromLTRB(leftRightPadding, 50.0, leftRightPadding, topBottomPadding),
              child: new TextField(
                style: hintTips,
                controller: _userNameController,
                decoration: new InputDecoration(hintText: "请输入用户名"),
              ),
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(leftRightPadding, 30.0, leftRightPadding, topBottomPadding),
            child: new TextField(
              style: hintTips,
              controller: _userPassController,
              decoration: new InputDecoration(hintText: "请输入用户密码"),
              obscureText: true,
            ),
          ),
          new Container(
            width: 360.0,
            margin: new EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
            padding: new EdgeInsets.fromLTRB(leftRightPadding, topBottomPadding, leftRightPadding, topBottomPadding),
            child: new Card(
              color: Colors.green,
              elevation: 6.0,
              child: new FlatButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: "用户名不能为空", toastLength: Toast.LENGTH_SHORT);
                    print("the pass is" + _userNameController.text);
                  },
                  child: new Padding(
                      padding: new EdgeInsets.all(10.0),
                      child: new Text(
                        '马上登录',
                        style: new TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                  )),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(leftRightPadding, 30.0, leftRightPadding, topBottomPadding),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //子组件的排列方式为主轴两端对齐
              children: <Widget>[
                new Text("注册", style: new TextStyle(fontSize: 14.0, color: Colors.blue)),
                new Text("忘记密码", style: new TextStyle(fontSize: 14.0, color: Colors.blue)),
              ],
            ),
          ),
        ],
      )
    );
  }
}