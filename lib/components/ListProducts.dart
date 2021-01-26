

import 'package:challengeinstabuy/components/DetailsProduct.dart';
import 'package:challengeinstabuy/models/GroupProducts.dart';
import 'package:challengeinstabuy/models/ProductItem.dart';
import 'package:challengeinstabuy/models/ProductsResults.dart';
import 'package:challengeinstabuy/services/data/instaBuyService.dart';
import 'package:challengeinstabuy/utils/TextManipulation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget listProducts() {
  InstaBuyService _service = InstaBuyService();

  return FutureBuilder<ProductResults>(
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
                      color: Color(0xFF041E42),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                    top: 20, left: 10, right: 10, bottom: 0),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 250.0,
                child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: group.products.length,
                  itemBuilder:
                      (BuildContext context, int indexProduct) {
                    ProductItem product =
                    group.products[indexProduct];
                    return Container(
                      width: 220,
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
                      child: new InkWell(child: Column(
                        children: <Widget>[
                          Image.network(
                              'https://assets.instabuy.com.br/ib.item.image.small/s-${product.image}'),
                          Container(
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 5),
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                TextManipulation.textFormat(product.name),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                'R\$: ${product.price.toStringAsFixed(2)}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0071CE),
                                    fontSize: 20),
                              )),
                        ],
                      ),onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailsProduct(
                              name: product.name,
                              image: product.image,
                              price: product.price,
                              description: product.description
                          )),
                        );
                      }) ,
                    );
                  },
                ),
              ),
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
  );
}