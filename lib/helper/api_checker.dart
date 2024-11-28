import 'package:flutter/material.dart';


import '../data/model/response/base/api_response.dart';


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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(' تم تعطيل هذا المستخدم', style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));

    }

    else{
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      print(errorMessage);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage, style: const TextStyle(color: Colors.white)), backgroundColor: Colors.red));
    }
  }
}