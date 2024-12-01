
import 'package:comatecs/data/model/response/about_us_model.dart';
import 'package:flutter/material.dart';


import '../data/model/response/base/api_response.dart';
import '../data/model/response/base/error_response.dart';
import '../data/model/response/categories_model.dart';
import '../data/repository/constants_repo.dart';
import '../helper/api_checker.dart';

class ConstantsProvider with ChangeNotifier {
  final ConstantsRepo? constantsRepo;

  ConstantsProvider({this.constantsRepo});


  bool _isLoading = false;

  bool get isLoading => _isLoading;

   List<AboutUsModel> _aboutUsList = [];

  List<AboutUsModel> get aboutUsList => _aboutUsList;

   List<CategoriesModel> _workNatureList = [];
   List<String> _workTypeList = [];

  List<CategoriesModel> get workNatureList => _workNatureList;
  List<String> get workTypeList => _workTypeList;

  Future<bool> getWorkNatureList(context) async {
    _workNatureList = [];
    _isLoading = true;
    ApiResponse apiResponse = await constantsRepo!.getWorkNatureList();
    _isLoading = false;
    print('apiResponse.response.data');
    if (apiResponse.response != null &&apiResponse.response!.statusCode == 200) {
      for (var item in apiResponse.response!.data) {
        _workNatureList.add(CategoriesModel.fromJson(item));
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

  Future<bool> getWorkTypeList(context) async {
    _workTypeList = [];
    _isLoading = true;
    ApiResponse apiResponse = await constantsRepo!.getWorkTypeList();
    _isLoading = false;
    print('apiResponse.response.data');
    if (apiResponse.response != null &&apiResponse.response!.statusCode == 200) {
      for (var item in apiResponse.response!.data) {
        _workTypeList.add(CategoriesModel.fromJson(item).name!);
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

  Future<bool> getAboutUsList({context, bool? isAbout}) async {
    _aboutUsList = [];
    _isLoading = true;
    ApiResponse apiResponse ;
    if(isAbout!){
       apiResponse = await constantsRepo!.getAboutUsModel();

    }else{
       apiResponse = await constantsRepo!.getTermPolicy();

    }
    _isLoading = false;
    print('apiResponse.response.data');
    if (apiResponse.response != null &&apiResponse.response!.statusCode == 200) {
      for (var item in apiResponse.response!.data) {
        _aboutUsList.add(AboutUsModel.fromJson(item));
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


  Future technicalSupport({String? fullName , String? email , String? phoneNumber,
    String? message, Function? callback}) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await constantsRepo!.technicalSupport(fullName: fullName!,email: email!,phoneNumber: phoneNumber!
        ,message: message!);
    _isLoading = false;
    if (apiResponse.response != null &&apiResponse.response!.statusCode == 200 ) {
      // Map map = apiResponse.response.data;
      String message = 'شكراً لتوصلك بفريق الدعم الفني. سنعمل على الرد على استفسارك في أقرب وقت ممكن. نشكرك على صبرك وتفهمك.';
      try {
        // message = map['message'];
      } catch (e) {}

      callback!(true, message);
      notifyListeners();
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        //print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors![0].message);
        errorMessage = errorResponse.errors![0].message!;
      }
      callback!(false, errorMessage);
      notifyListeners();
    }
  }

}
