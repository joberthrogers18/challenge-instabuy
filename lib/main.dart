import 'package:carousel_slider/carousel_slider.dart';
import 'package:challengeinstabuy/components/bannerCollections.dart';
import 'package:challengeinstabuy/models/BannerResult.dart';
import 'package:challengeinstabuy/models/GroupProducts.dart';
import 'package:challengeinstabuy/models/ProductItem.dart';
import 'package:challengeinstabuy/models/ProductsResults.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:challengeinstabuy/blocs/search_bloc.dart';
import 'package:challengeinstabuy/details/DetailsWidget.dart';
import 'package:challengeinstabuy/services/data/instaBuyService.dart';
import 'package:challengeinstabuy/components/Caroseul.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaBuy',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // SearchBloc _searchBloc;

  @override
  void initState() {
    // _searchBloc = SearchBloc();
    super.initState();
  }

  @override
  void dispose() {
    // _searchBloc?.dispose();
    super.dispose();
  }

  // Widget _textField() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: TextField(
  //       onChanged: _searchBloc.searchEvent.add,
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(),
  //         hintText: "Digite o nome do repositório",
  //         labelText: "Pesquisa",
  //       ),
  //     ),
  //   );
  // }

  String _textFormat(String value) {
    if (value.length > 20) {
      return value.substring(0, 18);
    }

    return value;
  }

  @override
  Widget build(BuildContext context) {
    InstaBuyService _service = InstaBuyService();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.shopping_cart),
        title: Text("InstaBuy"),
      ),
      body: ListView(
        children: <Widget>[
          // _textField(),
          Container(
            child: Text(
              'Bem vindo ao InstaBuy',
              style: TextStyle(
                  color: Colors.grey[700],
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20.0),
          ),
          carousel(),
          FutureBuilder<ProductResults>(
            future: _service.searchProducts(),
            builder:
                (BuildContext context, AsyncSnapshot<ProductResults> snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data.groupsProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        GroupProduct group =
                            snapshot.data.groupsProducts[index];

                        return Column(
                          children: <Widget>[
                            Container(
                              child: Text(
                                group.title,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(20.0),
                            ),
                            new Container(
                              margin: EdgeInsets.symmetric(vertical: 20.0),
                              height: 220.0,
                              child: new ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: group.products.length,
                                itemBuilder:
                                    (BuildContext context, int indexProduct) {
                                  ProductItem product =
                                      group.products[indexProduct];
                                  return Container(
                                    width: 150,
                                    padding: EdgeInsets.only(top: 10),
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Image.network(
                                            'https://assets.instabuy.com.br/ib.item.image.small/s-${product.image}'),
                                        Text(
                                          _textFormat(product.name),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          'R\$: ${product.price}',
                                          textAlign: TextAlign.left,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      },
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 6, // 60% of space => (6/(6 + 4))
                            child: Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ],
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}
