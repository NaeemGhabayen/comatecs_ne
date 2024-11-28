
import 'package:comatecs/data/model/response/sub_categories_model.dart';
import 'package:flutter/material.dart';


import '../data/model/response/base/api_response.dart';
import '../data/model/response/categories_model.dart';
import '../data/repository/categories_repo.dart';
import '../helper/api_checker.dart';

class CategoriesProvider with ChangeNotifier {
  final CategoriesRepo? categoriesRepo;

  CategoriesProvider({this.categoriesRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final List<CategoriesModel> _categoriesList = [];
  final List<SubCategoriesModel> _subCategoriesList = [];

  List<CategoriesModel> get categoriesList => _categoriesList;
  List<SubCategoriesModel> get subCategoriesList => _subCategoriesList;

  Future<bool> getCategoriesList(context) async {
    _isLoading = true;
    ApiResponse apiResponse = await categoriesRepo!.getCategoriesList();
    _isLoading = false;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      for (var item in apiResponse.response!.data) {
        _categoriesList.add(CategoriesModel.fromJson(item));
        notifyListeners();
      }

      notifyListeners();
      return true;
    } else {
      ApiChecker.checkApi(context, apiResponse);
      notifyListeners();
      return false;
    }
  }


  Future<bool> getSunCategoriesList({context , String? id}) async {
    _isLoading = true;
    _subCategoriesList.clear();
    ApiResponse apiResponse = await categoriesRepo!.getSubCategoriesListById(id: id!);
    _isLoading = false;
    if (apiResponse.response != null &&apiResponse.response!.statusCode == 200) {
      for (var item in apiResponse.response!.data) {
        _subCategoriesList.add(SubCategoriesModel.fromJson(item));
        notifyListeners();
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
