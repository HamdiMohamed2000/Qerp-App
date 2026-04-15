import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qerp_app/core/network/network_service/api_base_helper.dart';

void initNetworkService(GetIt sl){
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiBaseHelper>(() => ApiBaseHelper());
}