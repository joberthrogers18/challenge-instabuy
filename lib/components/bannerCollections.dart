import 'package:challengeinstabuy/models/BannerItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bannerCollections(BuildContext context, BannerItem item) {
  return ListTile(
    title: Image.network(
      'https://assets.instabuy.com.br/ib.store.banner/bnr-${item.image}',
      height: 300,
    ),
    subtitle: Text(item?.id ?? ""),
  );
}
