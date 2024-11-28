
import '../../utill/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class AdvertisementRepo {
  final DioClient? dioClient;

  AdvertisementRepo({this.dioClient});
  Future<ApiResponse> getAdvertisementList() async {
    try {
      final response = await dioClient!.get(AppConstants.AdvertisementURL);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
