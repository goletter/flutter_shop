import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class ProductDetailPage extends StatefulWidget {

  final int id;

  ProductDetailPage({ Key key, this.id }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ProductDetailState(id);
  }
}

class ProductDetailState extends State<ProductDetailPage> {

  var product = {};

  final int id;

  ProductDetailState(this.id);

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("商品详情"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text("${product['name']}"),
      ),
    );
  }

  getData () async {
    var url = "http://shop.goletter.cn/api/product/${this.id}";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var productData = jsonResponse['data'];
      setState(() {
        product = productData;
      });
    }
  }
}