import 'package:challengeinstabuy/models/BannerItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bannerCollections(BuildContext context, BannerItem item) {

  return ListTile(
    title: Text(item?.image ?? ""),
    subtitle: Text(item?.id ?? ""),
    // onTap: () => Navigator.push(
    //   context,
    //   CupertinoPageRoute(
    //     builder: (context) => DetailsWidget(
    //       item: item,
    //     ),
    //   ),
    // ),
  );
}