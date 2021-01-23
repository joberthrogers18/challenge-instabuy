import 'package:challengeinstabuy/details/DetailsWidget.dart';
import 'package:challengeinstabuy/models/SearchItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget items(BuildContext context, SearchItem item) {

  return ListTile(
    leading: Hero(
      tag: item.url,
      child: CircleAvatar(
        backgroundImage: NetworkImage(item?.avatarUrl ??
            "https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/VCHXZQKsxil3lhgr4/animation-loading-circle-icon-on-white-background-with-alpha-channel-4k-video_sjujffkcde_thumbnail-full01.png"),
      ),
    ),
    title: Text(item?.fullName ?? "title"),
    subtitle: Text(item?.url ?? "url"),
    onTap: () => Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => DetailsWidget(
          item: item,
        ),
      ),
    ),
  );
}