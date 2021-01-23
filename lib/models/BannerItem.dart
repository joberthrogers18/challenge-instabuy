class BannerItem {
  final String id;
  final String image;
  final String title;

  BannerItem({this.id, this.image, this.title});

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json["id"] as String,
      image: json["image"] as String,
      title: json["title"] as String,
    );
  }
}