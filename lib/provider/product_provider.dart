
import 'package:flutter/material.dart';


import '../data/model/response/base/api_response.dart';
import '../data/model/response/product_model.dart';
import '../data/repository/product_repo.dart';
import '../helper/api_checker.dart';

class ProductProvider with ChangeNotifier {
  final ProductRepo? productRepo;

  ProductProvider({this.productRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final List<ProductModel> _mostPopularProductList = [];

  List<ProductModel> get mostPopularProductList => _mostPopularProductList;

  Future<bool> getMostPopularProductList( context) async {
    _isLoading = true;
    ApiResponse apiResponse = await productRepo!.getMostPopularProductList();
    _isLoading = false;
    if (apiResponse.response != null &&apiResponse.response!.statusCode == 200) {
      print(apiResponse.response!.data);
      print("apiResponse.response!.data");
      for (var item in apiResponse.response!.data) {
        _mostPopularProductList.add(ProductModel.fromJson(item));
      }
      notifyListeners();
      return true;
    } else {
      ApiChecker.checkApi(context, apiResponse);
      notifyListeners();
      return false;
    }
  }
}
