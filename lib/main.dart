import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';

class Banner {
  final String image;

  Banner({this.image});

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(image: json['image']);
  }
}

List<Banner> parseBanners(String responseBody) {
  final parsed = jsonDecode(responseBody);

  return parsed['data']['banners']
      .map<Banner>((json) => Banner.fromJson(json))
      .toList();
}

Future<List<Banner>> fetchBanners() async {
  final response = await http
      .get('https://api.instabuy.com.br/apiv3/layout?subdomain=bigboxdelivery');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return parseBanners(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load banners');
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaBuy',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InstaBuyHomePage(title: 'InstaBuy'),
    );
  }
}

class InstaBuyHomePage extends StatefulWidget {
  InstaBuyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InstaBuyHomePageState createState() => _InstaBuyHomePageState();
}

class _InstaBuyHomePageState extends State<InstaBuyHomePage> {
  Future<List<Banner>> futureBanner;

  Function(Banner e) get banner => null;

  @override
  void initState() {
    super.initState();
    futureBanner = fetchBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the InstaBuyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        leading: Icon(Icons.shopping_cart),
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
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
            // CarouselSlider(
            //   options: CarouselOptions(
            //     height: 200.0,
            //     enableInfiniteScroll: true,
            //     autoPlay: true,
            //     autoPlayInterval: Duration(seconds: 7),
            //   ),
            //   items: [1, 2, 3, 4, 5].map((i) {
            //     return Builder(
            //       builder: (BuildContext context) {
            //         return Container(
            //             width: MediaQuery.of(context).size.width,
            //             margin:
            //                 EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            //             decoration: BoxDecoration(color: Colors.grey[300]),
            //             child: Image(
            //               image: NetworkImage(
            //                   'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            //             ));
            //       },
            //     );
            //   }).toList(),
            // ),
            FutureBuilder<List<Banner>>(
              future: fetchBanners(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return Container(
                      child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Column(
                        children: <Widget>[
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(snapshot.data[index].image),
                              );
                            },
                            itemCount: snapshot.data.length,
                          )
                        ],
                      ))
                    ],
                  ));
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: null,
    );
  }
}
