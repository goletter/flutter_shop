import 'package:flutter/material.dart';
import 'package:flutter_shop/page/auth/LoginPage.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new CategoryState();
  }
}

class CategoryState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("分类"),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoginPage()));
              }
          )
        ],
      ),
      body: new Center(
        child: new Text('分类'),
      ),
    );
  }
}