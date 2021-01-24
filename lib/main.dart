import 'package:carousel_slider/carousel_slider.dart';
import 'package:challengeinstabuy/components/bannerCollections.dart';
import 'package:challengeinstabuy/models/BannerResult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:challengeinstabuy/blocs/search_bloc.dart';
import 'package:challengeinstabuy/details/DetailsWidget.dart';
import 'package:challengeinstabuy/services/data/instaBuyService.dart';

import 'models/BannerItem.dart';

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

  @override
  Widget build(BuildContext context) {
    InstaBuyService _service = InstaBuyService();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.shopping_cart
        ),
        title: Text("InstaBuy"),
      ),
      body: ListView(
        children: <Widget>[
          // _textField(),
          FutureBuilder<BannerResult>(
            future: _service.search(''),
            builder:
                (BuildContext context, AsyncSnapshot<BannerResult> snapshot) {
              return snapshot.hasData
                  ? CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 7),
                  reverse: false,
                ),
                items: snapshot.data.items.map<Widget>((item) {
                  return new ListTile(
                    title: new Image.network(
                        'https://assets.instabuy.com.br/ib.store.banner/bnr-${item.image}'
                    ),
                    subtitle: new Text("Class"),
                  );
                }).toList(),

              )
                  : Center(child: CircularProgressIndicator());
            },
          ),
          FutureBuilder<BannerResult>(
            future: _service.search(''),
            builder:
                (BuildContext context, AsyncSnapshot<BannerResult> snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        BannerItem item = snapshot.data.items[index];
                        return bannerCollections(context, item);
                      },
                    )
                  : Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}
