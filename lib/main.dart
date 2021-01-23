import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:challengeinstabuy/blocs/search_bloc.dart';
import 'package:challengeinstabuy/details/DetailsWidget.dart';
import 'package:challengeinstabuy/models/SearchItem.dart';
import 'package:challengeinstabuy/models/SearchResult.dart';
import 'package:challengeinstabuy/components/item.dart';
import 'package:challengeinstabuy/services/data/github_service.dart';

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
  SearchBloc _searchBloc;

  @override
  void initState() {
    _searchBloc = SearchBloc();
    super.initState();
  }

  @override
  void dispose() {
    _searchBloc?.dispose();
    super.dispose();
  }

  Widget _textField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: _searchBloc.searchEvent.add,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Digite o nome do repositório",
          labelText: "Pesquisa",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    GitHubService _service = GitHubService();

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
          FutureBuilder<SearchResult>(
            future: _service.search('teste'),
            builder:
                (BuildContext context, AsyncSnapshot<SearchResult> snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        SearchItem item = snapshot.data.items[index];
                        return items(context, item);
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
