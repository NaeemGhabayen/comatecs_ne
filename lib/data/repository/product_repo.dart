import '../../utill/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class ProductRepo {
  final DioClient? dioClient;

  ProductRepo({this.dioClient});

  Future<ApiResponse> getMostPopularProductList() async {
    try {
      final response =
          await dioClient!.get(AppConstants.GetMostPopularProductURL);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getFavoriteProductList({userId}) async {
    try {
      final response =
          await dioClient!.get('${AppConstants.AddProductToFavoriteURL}/$userId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> addProductToFavoriteAPI({userId, productId}) async {
    try {
      final response = await dioClient!.post(
          AppConstants.AddProductToFavoriteURL,
          data: {"appUserId": userId, "productId": productId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> removeProductFromFavoriteAPI({productId}) async {
    try {
      final response = await dioClient!.delete(
        '${AppConstants.AddProductToFavoriteURL}/$productId',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
