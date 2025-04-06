
import '../../utill/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class CategoriesRepo {
  final DioClient? dioClient;

  CategoriesRepo({this.dioClient});
  Future<ApiResponse> getCategoriesList() async {
    try {
      final response = await dioClient!.get(AppConstants.CategoriesListURL);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getSubCategoriesListById({String? id}) async {
    try {
      final response = await dioClient!.get(AppConstants.SubCategoriesListURL+id!);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> getProductBySubCategory({String? id}) async {
    try {
      final response = await dioClient!.get(AppConstants.SubCategoryItemURL+id!);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
