
import 'package:comatecs/data/model/response/favorite_product_model.dart';
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

  final List<FavoriteProductModel> _favoriteProductList = [];

  List<FavoriteProductModel> get favoriteProductList  => _favoriteProductList ;


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

  Future<bool> getFavoriteProductList( context , userId) async {
    _isLoading = true;
    ApiResponse apiResponse = await productRepo!.getFavoriteProductList(userId:userId);
    _isLoading = false;
    if (apiResponse.response != null &&apiResponse.response!.statusCode == 200) {
      print(apiResponse.response!.data);
      print("apiResponse.response!.data");
      for (var item in apiResponse.response!.data) {
        _favoriteProductList.add(FavoriteProductModel.fromJson(item));
      }
      notifyListeners();
      return true;
    } else {
      ApiChecker.checkApi(context, apiResponse);
      notifyListeners();
      return false;
    }
  }

  Future<bool> addProductToFavoriteAPI( context , String userId, productId) async {
    _isLoading = true;
    ApiResponse apiResponse = await productRepo!.addProductToFavoriteAPI(userId:userId , productId:productId);
    _isLoading = false;
    if (apiResponse.response != null &&apiResponse.response!.statusCode == 200) {
      notifyListeners();
      return true;
    } else {
      ApiChecker.checkApi(context, apiResponse);
      notifyListeners();
      return false;
    }
  }

  Future<bool> removeProductFromFavoriteAPI( context , productId) async {
    ApiResponse apiResponse = await productRepo!.removeProductFromFavoriteAPI( productId:productId);
    if (apiResponse.response != null &&apiResponse.response!.statusCode == 200) {
      notifyListeners();
      return true;
    } else {
      ApiChecker.checkApi(context, apiResponse);
      notifyListeners();
      return false;
    }
  }
}
