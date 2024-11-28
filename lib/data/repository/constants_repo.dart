import 'package:dio/dio.dart';

import '../../utill/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class ConstantsRepo {
  final DioClient? dioClient;

  ConstantsRepo({this.dioClient});


  Future<ApiResponse> getTermPolicy() async {
    try {
      final response = await dioClient!.get(AppConstants.TermPolicyURL);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> getAboutUsModel() async {
    try {
      final response = await dioClient!.get(AppConstants.AboutUsURL);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getWorkNatureList() async {
    try {
      final response = await dioClient!.get(AppConstants.WorkNatureListURL);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> technicalSupport({String? fullName ,
    String? email , String? phoneNumber,String? message,} ) async {
    try {
      Response response = await dioClient!.post(
        AppConstants.TechnicalSupportURL,
        data:'{"fullName": "$fullName","email": "$email","phoneNumber": "$phoneNumber","message": "$message"}'
        ,   options: Options(headers: {'accept': '*/*',
        'Content-Type': 'application/json' }),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}
