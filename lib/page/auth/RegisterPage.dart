import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RegisterState();
  }
}

class RegisterState extends State<RegisterPage> {


  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("注册")),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new Container(
              height: 55.0,
              margin: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 15.0),
              child: new TextFormField(
                decoration: new InputDecoration(
                    labelText: '请输入邮箱：'
                ),
              ),
            ),
            new Container(
              height: 55.0,
              margin: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 15.0),
              child: new TextFormField(
                decoration: new InputDecoration(
                    labelText: '请输入密码：'
                ),
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.height-40.0,
              margin: const EdgeInsets.only(left: 30.0,right: 30.0,top: 30.0,bottom: 15.0),
              height: 47.0,
              child: new RaisedButton(onPressed: (){},child: new Text("注册",style: new TextStyle(color: Colors.white,fontSize: 16.0),),color: Colors.blue,elevation: 8.0,),
            ),
          ],
        ),
      ),
    );
  }
}