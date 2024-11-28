
import '../../utill/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class ProductRepo {
  final DioClient? dioClient;

  ProductRepo({this.dioClient});
  Future<ApiResponse> getMostPopularProductList() async {
    try {
      final response = await dioClient!.get(AppConstants.GetMostPopularProductURL);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
