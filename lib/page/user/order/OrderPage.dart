import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new OrderState();
  }
}

class OrderState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("我的订单"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text('我的订单'),
      ),
    );
  }
}