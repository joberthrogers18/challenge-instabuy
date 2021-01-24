class BannerItem {
  final String id;
  final String image;
  final String title;
  final bool isMobile;

  BannerItem({this.id, this.image, this.title, this.isMobile});

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json["id"] as String,
      image: json["image"] as String,
      title: json["title"] as String,
      isMobile: json["is_mobile"] as bool,
    );
  }
}
