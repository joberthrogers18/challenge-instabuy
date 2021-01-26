import 'package:challengeinstabuy/models/BannerItem.dart';

class BannerResult {
  final List<BannerItem> items;

  BannerResult(this.items);

  factory BannerResult.fromJson(Map<String, dynamic> json) {
    final listItems = (json["data"]["banners"] as List)
        .cast<Map<String, dynamic>>()
        ?.map(
          (item) {
            return BannerItem.fromJson(item);
          },
        )
        ?.where((i) => i.isMobile == true)
        ?.toList();

    return BannerResult(listItems);
  }
}
