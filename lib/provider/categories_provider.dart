
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
  bool _isLoadingProductBySubCategory = false;

  bool get isLoading => _isLoading;
  bool get isLoadingProductBySubCategory => _isLoadingProductBySubCategory;

   List<CategoriesModel> _categoriesList = [];
  final List<SubCategoriesModel> _subCategoriesList = [];
  SubCategoriesModel?  _subCategoriesItems ;

  SubCategoriesModel? get subCategoriesItems => _subCategoriesItems;
  List<CategoriesModel> get categoriesList => _categoriesList;
  List<SubCategoriesModel> get subCategoriesList => _subCategoriesList;

  Future<bool> getCategoriesList(context) async {
    _categoriesList=[];
    _isLoading = true;
    notifyListeners();
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
    print('ssssssssssss');
    _subCategoriesList.clear();
    _isLoading = true;
    print(_subCategoriesList.length);
    notifyListeners();
    ApiResponse apiResponse = await categoriesRepo!.getSubCategoriesListById(id: id!);
    _isLoading = false;
    if (apiResponse.response != null &&apiResponse.response!.statusCode == 200) {
      print(apiResponse.response!.data);
      print("apiResponse.response!.data");
      for (var item in apiResponse.response!.data) {
        _subCategoriesList.add(SubCategoriesModel.fromJson(item));
        notifyListeners();
       }
      if(_subCategoriesList.isNotEmpty){
        getProductBySubCategory(context:context,id:_subCategoriesList.first.id.toString());
      }else{
        _subCategoriesItems=null;
      }

      notifyListeners();
      return true;
    } else {
      ApiChecker.checkApi(context, apiResponse);
      notifyListeners();
      return false;
    }
  }
  Future<bool> getProductBySubCategory({context , String? id}) async {
    _isLoadingProductBySubCategory = true;
    notifyListeners();
    ApiResponse apiResponse = await categoriesRepo!.getProductBySubCategory(id: id!);
    _isLoadingProductBySubCategory = false;
    if (apiResponse.response != null &&apiResponse.response!.statusCode == 200) {
        _subCategoriesItems = SubCategoriesModel.fromJson(apiResponse.response!.data);
        notifyListeners();
        return true;
    } else {
      ApiChecker.checkApi(context, apiResponse);
      notifyListeners();
      return false;
    }
  }
}
