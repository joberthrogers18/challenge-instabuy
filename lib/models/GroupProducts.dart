import 'package:challengeinstabuy/models/ProductItem.dart';

class GroupProduct {
  final String id;
  final String title;
  final List<ProductItem> products;

  GroupProduct({
    this.id,
    this.title,
    this.products,
  });

  factory GroupProduct.fromJson(Map<String, dynamic> json) {
    final listProducts =
        (json["items"] as List).cast<Map<String, dynamic>>()?.map((product) {
      return ProductItem.fromJson(product);
    })?.toList();

    return GroupProduct(
        id: json["id"] as String,
        title: json["title"] as String,
        products: listProducts);
  }
}
