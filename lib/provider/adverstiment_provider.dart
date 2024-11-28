
import 'package:comatecs/data/repository/advertisement_repo.dart';
import 'package:flutter/material.dart';


import '../data/model/response/advertisement_model.dart';
import '../data/model/response/base/api_response.dart';
import '../helper/api_checker.dart';

class AdvertisementProvider with ChangeNotifier {
  final AdvertisementRepo? advertisementRepo;

  AdvertisementProvider({this.advertisementRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final List<AdvertisementModel> _advertisementList = [];

  List<AdvertisementModel> get advertisementList => _advertisementList;

  Future<bool> getAdvertisementList( context) async {
    _isLoading = true;
    ApiResponse apiResponse = await advertisementRepo!.getAdvertisementList();
    _isLoading = false;
    if (apiResponse.response != null &&apiResponse.response!.statusCode == 200) {
      for (var item in apiResponse.response!.data) {
        _advertisementList.add(AdvertisementModel.fromJson(item));
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
