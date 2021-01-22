import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
//
//     final payload = payloadFromJson(jsonString);

import 'dart:convert';

List<Payload> payloadFromJson(String str) => List<Payload>.from(
    json.decode(str)['data']['banners'].map((x) => Payload.fromJson(x)));

String payloadToJson(List<Payload> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Payload {
  String image;

  Payload({
    this.image,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image == null ? null : image,
      };
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SponsorSlider(),
    );
  }
}

class SponsorSlider extends StatefulWidget {
  @override
  _SponsorSliderState createState() => _SponsorSliderState();
}

class _SponsorSliderState extends State<SponsorSlider> {
  Future<List<Payload>> getSponsorSlide() async {
    //final response = await http.get("getdata.php");
    //return json.decode(response.body);
    http.Response response = await http.get(
        "https://api.instabuy.com.br/apiv3/layout?subdomain=bigboxdelivery");
    var payloadList = payloadFromJson(response.body);
    return payloadList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the InstaBuyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        leading: Icon(Icons.shopping_cart),
        title: Text('InstaBuy'),
      ),
      body: Container(
        child: Card(
          child: new FutureBuilder<List<Payload>>(
            future: getSponsorSlide(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? new SponsorList(
                      list: snapshot.data,
                    )
                  : new Center(child: new CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

class SponsorList extends StatefulWidget {
  final List<Payload> list;
  SponsorList({this.list});

  @override
  _SponsorListState createState() => _SponsorListState();
}

class _SponsorListState extends State<SponsorList> {
  int _current = 0;

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Seja Bem Vindo ao InstaBuy',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(57, 54, 109, 1)),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 7),
              reverse: false,
            ),
            items: widget.list.map((imageUrl) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  child: Image.network(
                    'https://assets.instabuy.com.br/ib.store.banner/bnr-${imageUrl.image}',
                    fit: BoxFit.fill,
                  ),
                );
              });
            }).toList(),
          )
        ],
      ),
    );
  }
}
