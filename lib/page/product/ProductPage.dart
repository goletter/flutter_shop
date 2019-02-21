import 'package:flutter/material.dart';
import 'package:flutter_app/page/product/ProductDetailPage.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class ProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    
    return new ProductState();
  }
}

class ProductState extends State<ProductPage> {

  var products = [];
  ScrollController _scrollController = ScrollController(); //listview的控制器
  int page = 1;
  bool isLoading = false; //是否正在加载数据

  @override
  void initState() {
    super.initState();
    getData();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        setState(() {
          page++;
        });
        getData();
        print("滑动到了最底部:${this.page}");
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("商品"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: buildCustomScrollView()
      ),
    );
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('refresh');
    });
  }

  Widget buildCustomScrollView() {
    return new ListView.builder(
      itemCount: products.length,
      itemBuilder: itemView,
      controller: _scrollController,
    );
  }

  Widget itemView(BuildContext context, int index) {
    var product = this.products[index];
    // new Image.network("${product['thumb']}")

    return new GestureDetector(
      onTap: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new ProductDetailPage(id: product['id'])));
      },
      child: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text("${product['name']}"),
            )
          ],
        ),
      ),
    );
  }

  getData () async {
    var pageSize = this.page * 15;
    var url = "http://shop.goletter.cn/api/product?"+"pageSize=${pageSize}";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var productData = jsonResponse['data'];

      setState(() {
        products = productData;
      });
      // print("Number of books about http: $productData.");
    } else {
      // print("Request failed with status: ${response.statusCode}.");
    }
  }
}