import 'package:comatecs/data/model/response/product_model.dart';

class FavoriteProductModel {
  int? id;
  var appUser;
  ProductModel? product;

  FavoriteProductModel({this.id, this.appUser, this.product});

  FavoriteProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appUser = json['appUser'];
    product =
    json['product'] != null ? new ProductModel.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appUser'] = this.appUser;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}
