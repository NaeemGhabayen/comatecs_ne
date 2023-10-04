import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utill/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';

import '../model/body/login_model.dart';
import '../model/body/register_model.dart';
import '../model/response/base/api_response.dart';

class AuthRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({ this.dioClient,  this.sharedPreferences});


  Future<ApiResponse> registration(RegisterModel register) async {
    try {
      Response response = await dioClient.post(
        AppConstants.REGISTRATION_URI,
        data: register.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> restPassword({String email} ) async {
    try {
      Response response = await dioClient.post(
        AppConstants.ResetPassword_URI,
        data:'''{"email": "$email"}''' ,   options: Options(headers: {'accept': '*/*',
        'Content-Type': 'application/json' }),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }




  Future<ApiResponse> login(LoginModel loginBody) async {
    print(loginBody.toJson());
    print("loginBody.toJson()");
    try {
      Response response = await dioClient.post(
        AppConstants.LOGIN_URI,
        data:FormData.fromMap(loginBody.toJson()) ,
        options: Options(headers: {'accept': '*/*',
          'Content-Type': 'multipart/form-data' }),
      );
      print("response.data.toString()");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(ApiErrorHandler.getMessage(e));
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // for  user token
  Future<void> saveUserToken(String token) async {
    dioClient.updateHeader(token, null);
    try {
      await sharedPreferences.setString(AppConstants.TOKEN, token);
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveUserId(id) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_ID, id.toString());
      print('sssssssssssssssssssssssssssssssssss');
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveUserData(Map<dynamic, dynamic> map) async {
    try {
      await sharedPreferences.setString(AppConstants.TOKEN, map['token']);
      await sharedPreferences.setString(AppConstants.USER, map['user']['full_name'].toString());
      await sharedPreferences.setString(AppConstants.USER_EMAIL, map['user']['email'].toString());
      await sharedPreferences.setString(AppConstants.USER_ROLE, map['user']['role']);
      await sharedPreferences.setString(AppConstants.USER_ROLE, map['user']['role']);
      await sharedPreferences.setString(AppConstants.USER_ID, map['user']['id'].toString());
      print(map['user']['id']);
      print('ssssssssssssssssssssssssssssss');
      print(map);
    } catch (e) {
      throw e;
    }
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }
  String getUserId() {
    return sharedPreferences.getString(AppConstants.USER_ID) ?? "";
  }


  Future<void> saveAuthToken(String token) async {
    dioClient.token = token;
    dioClient.dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };

    try {
      await sharedPreferences.setString(AppConstants.TOKEN, token);
    } catch (e) {
      throw e;
    }
  }

  String getAuthToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }


  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  bool isLoggedInConsultant() {
    if(sharedPreferences.getString(AppConstants.USER_ROLE)=="ADVISER"){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> clearSharedData() async {
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.clear();
    return true;
  }








  String getUserEmail() {
    return sharedPreferences.getString(AppConstants.USER_EMAIL) ?? "";
  }



}
