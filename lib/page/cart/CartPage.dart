import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new CartState();
  }
}

class CartState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("购物车"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text('购物车'),
      ),
    );
  }
}