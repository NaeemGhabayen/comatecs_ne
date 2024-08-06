import 'package:comatecs/data/repository/advertisement_repo.dart';
import 'package:comatecs/data/repository/categories_repo.dart';
import 'package:comatecs/data/repository/product_repo.dart';
import 'package:comatecs/provider/categories_provider.dart';
import 'package:comatecs/provider/product_provider.dart';
import 'package:connectivity/connectivity.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repository/auth_repo.dart';
import 'data/repository/constants_repo.dart';

import 'helper/network_info.dart';
import 'provider/adverstiment_provider.dart';
import 'provider/auth_provider.dart';
import 'provider/constants_provider.dart';
import 'utill/app_constants.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(
      () => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => ConstantsRepo(dioClient: sl()));
  sl.registerLazySingleton(() => AdvertisementRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CategoriesRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ProductRepo(dioClient: sl()));

  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => ConstantsProvider(constantsRepo: sl()));
  sl.registerFactory(() => CategoriesProvider(categoriesRepo: sl()));
  sl.registerFactory(() => AdvertisementProvider(advertisementRepo: sl()));
  sl.registerFactory(() => ProductProvider(productRepo: sl()));


  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}
