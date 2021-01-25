import 'package:carousel_slider/carousel_slider.dart';
import 'package:challengeinstabuy/models/BannerResult.dart';
import 'package:challengeinstabuy/services/data/instaBuyService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget carousel() {
  InstaBuyService _service = InstaBuyService();

  return FutureBuilder<BannerResult>(
    future: _service.search(''),
    builder: (BuildContext context, AsyncSnapshot<BannerResult> snapshot) {
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
                    'https://assets.instabuy.com.br/ib.store.banner/bnr-${item.image}',
                  ),
                );
              }).toList(),
            )
          : Center(child: CircularProgressIndicator());
    },
  );
}
