import 'package:comatecs/data/model/response/categories_model.dart';

class SubCategoriesModel {
  SubCategoriesModel({
     this.id,
     this.name,
     this.category,
  });

  final int id;
  final String name;
  final CategoriesModel category;

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json){
    return SubCategoriesModel(
      id: json["id"],
      name: json["name"],
      category: json["category"] == null ? null : CategoriesModel.fromJson(json["category"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category": category?.toJson(),
  };

}

