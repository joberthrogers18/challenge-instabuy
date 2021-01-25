import 'package:challengeinstabuy/models/ProductItem.dart';

class GroupProduct {
  final String id;
  final String name;
  final List<ProductItem> products;

  GroupProduct({
    this.id,
    this.name,
    this.products,
  });

  factory GroupProduct.fromJson(Map<String, dynamic> json) {
    final listProducts =
        (json["items"] as List).cast<Map<String, dynamic>>()?.map((product) {
      return ProductItem.fromJson(product);
    }).toList();

    return GroupProduct(
        id: json["id"] as String,
        name: json["name"] as String,
        products: listProducts);
  }
}
