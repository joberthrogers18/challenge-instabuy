import 'package:challengeinstabuy/models/GroupProducts.dart';

class ProductResults {
  final List<GroupProduct> groupsProducts;

  ProductResults(this.groupsProducts);

  factory ProductResults.fromJson(Map<String, dynamic> json) {
    final groups = (json["data"]["collection_items"] as List)
        .cast<Map<String, dynamic>>()
        ?.map(
      (item) {
        return GroupProduct.fromJson(item);
      },
    ).toList();

    return ProductResults(groups);
  }
}
