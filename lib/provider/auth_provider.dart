
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../data/model/body/login_model.dart';
import '../data/model/body/register_model.dart';
import '../data/model/response/base/api_response.dart';
import '../data/model/response/base/error_response.dart';
import '../data/repository/auth_repo.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo? authRepo;

  AuthProvider({@required this.authRepo});


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isRemember = false;
  bool get isRemember => _isRemember;


  void updateRemember(bool value)async {
    final prefs = await SharedPreferences.getInstance();
    _isRemember = value;
    prefs.setBool("saveData", value);
    print(value);
    print("value");
    notifyListeners();
  }

  Future registration(RegisterModel register, Function callback) async {
    print(register.toJson());
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo!.registration(register);
    _isLoading = false;
    if (apiResponse.response!=null &&apiResponse.response!.statusCode == 200 ) {
      Map map = apiResponse.response!.data;
      String message = '';
      try {
        message = 'تم تسجيل الاشتراك بنجاح';
      } catch (e) {}

      callback(true, message);
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
      callback(false, errorMessage);
      notifyListeners();
    }
  }

  Future restPassword(String email, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo!.restPassword(email:email);
    _isLoading = false;
    if (apiResponse.response!=null &&apiResponse.response!.statusCode == 200 ) {
      Map map = apiResponse.response!.data;
      String message = '';
      try {
        message = map['message'];
      } catch (e) {}

      callback(true, message);
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
      callback(false, errorMessage);
      notifyListeners();
    }
  }
  Future changePassword({String? email,String? currentPassword , String? newPassword  , Function? callback}) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo!.
    changePassword(email:email! ,
        newPassword: newPassword!,currentPassword: currentPassword!);
    _isLoading = false;
    if (apiResponse.response!=null &&apiResponse.response!.statusCode == 200 ) {
      // Map map = apiResponse.response.data;
      String message = 'تم تغير كلمة المرور بنجاح';
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
  Future login(LoginModel loginBody, Function callback, context) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo!.login(loginBody);
    if (apiResponse.response!=null &&apiResponse.response!.statusCode == 200) {
      String message = '';
      try {
        Map map = apiResponse.response!.data;
        message = 'تم تسجيل الدخول بنجاح';
     //   authRepo.saveUserData(map);
        if (map['token'] != null) {
          authRepo!.saveUserToken(map['token']);
          notifyListeners();
        }
          _isLoading = false;
          notifyListeners();

      } catch (e) {
        print(e);
      }
      callback(true, message,);
      notifyListeners();
    } else {
      String errorMessage;
      _isLoading = false;

      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors![0].message);
        errorMessage = errorResponse.errors![0].message!;
      }
      callback(false, errorMessage);
      notifyListeners();
    }
  }

  isRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isRemember = prefs.getBool("saveData") ?? false;
    notifyListeners();
  }

  Future<bool> clearSharedData() async {
    return await authRepo!.clearSharedData();
  }
}
