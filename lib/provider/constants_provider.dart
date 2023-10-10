
import 'package:comatecs/data/model/response/about_us_model.dart';
import 'package:flutter/material.dart';


import '../data/model/response/base/api_response.dart';
import '../data/repository/constants_repo.dart';
import '../helper/api_checker.dart';

class ConstantsProvider with ChangeNotifier {
  final ConstantsRepo constantsRepo;

  ConstantsProvider({this.constantsRepo});


  bool _isLoading = false;

  bool get isLoading => _isLoading;

   List<AboutUsModel> _aboutUsList = [];

  List<AboutUsModel> get aboutUsList => _aboutUsList;

  Future<bool> getAboutUsList(context) async {
    _aboutUsList = [];
    _isLoading = true;
    ApiResponse apiResponse = await constantsRepo.getAboutUsModel();
    _isLoading = false;
    print('apiResponse.response.data');
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      for (var item in apiResponse.response.data) {
        var isExiset = _aboutUsList
            .firstWhere((element) => element.id == AboutUsModel.fromJson(item).id, orElse: () => null);
        if (isExiset == null) {
          _aboutUsList.add(AboutUsModel.fromJson(item));
          notifyListeners();
        }
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
