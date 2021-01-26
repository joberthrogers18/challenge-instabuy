import 'package:challengeinstabuy/components/ListProducts.dart';
import 'package:challengeinstabuy/models/GroupProducts.dart';
import 'package:challengeinstabuy/models/ProductItem.dart';
import 'package:challengeinstabuy/models/ProductsResults.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:challengeinstabuy/blocs/search_bloc.dart';
import 'package:challengeinstabuy/components/DetailsProduct.dart';
import 'package:challengeinstabuy/services/data/instaBuyService.dart';
import 'package:challengeinstabuy/components/Caroseul.dart';
import 'package:challengeinstabuy/components/DetailsProduct.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaBuy',
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

  @override
  Widget build(BuildContext context) {
    InstaBuyService _service = InstaBuyService();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.shopping_cart),
        title: Text("InstaBuy"),
        backgroundColor: Color(0xFF0071CE),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat_bubble),
        backgroundColor: Color(0xFF0071CE),
      ),
      body: ListView(
        children: <Widget>[
          // _textField(),
          Container(
            child: Text(
              'Bem vindo ao InstaBuy',
              style: TextStyle(
                  color: Color(0xFF041E42),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20.0),
          ),
          carousel(),
          listProducts()
        ],
      ),
    );
  }
}
