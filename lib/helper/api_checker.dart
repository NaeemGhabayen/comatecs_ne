import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../data/model/response/base/api_response.dart';
import '../provider/auth_provider.dart';


class ApiChecker {
  static void checkApi(BuildContext context, ApiResponse apiResponse) {

    if(apiResponse.error is! String && apiResponse.error.errors[0].message == 'unauthorized.') {

    }else if( apiResponse.error == 'block user'){
     print('ssssssssssssssssssssssssssssssssss');

      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (_) =>  LoginScreen()),
      //         (route) => false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(' تم تعطيل هذا المستخدم', style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));

    }

    else{
      String _errorMessage;
      if (apiResponse.error is String) {
        _errorMessage = apiResponse.error.toString();
      } else {
        _errorMessage = apiResponse.error.errors[0].message;
      }
      print(_errorMessage);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_errorMessage, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));
    }
  }
}