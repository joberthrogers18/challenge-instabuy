import 'package:flutter/material.dart';
import 'package:challengeinstabuy/models/SearchItem.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsProduct extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  final String description;

  DetailsProduct({ this.image, this.name, this.price, this.description });

  @override
  _DetailsProduct createState() => _DetailsProduct();
}

class _DetailsProduct extends State<DetailsProduct> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 80,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  child: Image.network(
                    'https://assets.instabuy.com.br/ib.item.image.medium/m-${widget.image}'
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          'R\$: ${widget.price}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0071CE)
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
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
                        height: 150,
                        padding: EdgeInsets.all(10),
                        child: Wrap(
                          children: <Widget>[
                            Container(
                              child: Text(
                                'Descrição:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                                ),
                              ),
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(bottom: 10),
                            ),
                            Html(
                                data: widget.description != '' ? (widget.description.split('\">')[1]) : 'Sem Descrição',
                            ),
                          ],
                        )
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
