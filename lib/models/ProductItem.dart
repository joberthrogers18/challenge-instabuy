class ProductItem {
  final String id;
  final String name;
  final double price;
  final String description;
  final String image;

  ProductItem({
    this.id,
    this.name,
    this.price,
    this.description,
    this.image,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      id: json["id"] as String,
      name: json["name"] as String,
      price: json["prices"][0]["price"] as double,
      description: json["description"] as String,
      image: json["images"][0] as String,
    );
  }
}
