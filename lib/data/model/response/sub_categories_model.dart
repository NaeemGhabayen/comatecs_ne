import 'package:comatecs/data/model/response/categories_model.dart';
import 'package:comatecs/data/model/response/product_model.dart';

class SubCategoriesModel {
  SubCategoriesModel({
    this.id,
    this.name,
    this.imageUrl,
    this.category,
    this.products,
  });

  final int? id;
  final String? name;
  final String? imageUrl;
  final CategoriesModel? category;
  List<ProductModel>? products;

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    return SubCategoriesModel(
      id: json["id"],
      name: json["name"],
      imageUrl: json["imageUrl"],
      products: json["products"] == null
          ? []
          : List<ProductModel>.from(json["products"]
              .map((x) => ProductModel.fromJson(x))),
      category: json["category"] == null
          ? null
          : CategoriesModel.fromJson(json["category"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "name": name,
        "category": category!.toJson(),
        "products": products!.map((x) => x.toJson()).toList(),
      };
}
