import 'package:flutter/material.dart';
import 'package:banner_view/banner_view.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<HomePage> {

  List bannerList = [];
  List indexList = [];

  @override
  void initState() {
    super.initState();
    getBanner();
    getIndex();
  }

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("首页"),
        centerTitle: true,
      ),
      body: new Column(
          children: <Widget>[
            buildBanner(),
          ]
      )
    );
  }

  Widget buildBanner() {
    return new Container(
        alignment: Alignment.center,
        height: 200.0,
        child: bannerList.length > 0 ?
          new BannerView(
            bannerList.map((item) {
                return new GestureDetector(
                    child: new Image.network(item['thumb'], fit: BoxFit.cover),
                );
            }).toList(),
            cycleRolling: false,
            autoRolling: true,
            indicatorMargin: 8.0,
        ) : new Container(),
    );
  }

  Widget buildIndex() {
    return new Container(
      child: new Column(
        children: <Widget>[

        ],
      ),
    );
  }

  getBanner () async {
    var url = "http://shop.goletter.cn/api/banner";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var bannerData = jsonResponse;

      setState(() {
        bannerList = bannerData;
      });
    }
  }

  getIndex () async {
    var url = "http://shop.goletter.cn/api/index";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var indexData = jsonResponse;

      setState(() {
        indexList = indexData;
      });
    }
  }
}