import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:qerp_app/core/config/app_endpoints.dart';
import 'package:qerp_app/core/injection/injection_container.dart';
import 'package:qerp_app/core/network/network_service/error_helper.dart';
import 'package:qerp_app/core/network/network_service/exceptions.dart';
import 'package:qerp_app/core/storage/storage.dart';

class ApiBaseHelper {
  ApiBaseHelper._internal();

  static final ApiBaseHelper _instance = ApiBaseHelper._internal();

  factory ApiBaseHelper({Dio? dio}){
    if(dio != null){
      _instance._dio = dio;
    }else{
      _instance._initializeDio();
    }
    return _instance;
  }

  late Dio _dio;

  static final PrettyDioLogger _logger = PrettyDioLogger(
    requestBody: true,
    responseBody: true,
    requestHeader: true,
    error: true,
    compact: true,
    maxWidth: 90,
    enabled: kDebugMode
  );


  Map<String,String> _defaultHeaders(){
    return{
      'Content-Type': 'application/json',
      'Accept' : 'Application/json',
      'Accept-Language' : sl<Storage>().getLang()
    };

  }

  void _initializeDio(){
    _dio = Dio(
      BaseOptions(
        baseUrl: AppEndpoints.baseUrl,
        headers: _defaultHeaders()
      )
    )..interceptors.add(_logger);
  }

  void updateLocaleInHeaders(String locale) {
    _dio.options.headers['Accept-Language'] = locale;
  }

  Future<T> _performRequest<T>(
    Future<Response<T>> Function() request,
  )async{
    try{
      final String token = '747|uLkQacxK1uFroP4kVCSB9nAv1AEt9d60XVEPEYdje2ab095d';
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await request();
      return response.data!;
    }on DioException catch(e){
      throw await ErrorHelper.handleDioError(e);
    }on SocketException{
      throw NetworkException('No Internet Connection');
    }catch (e){
      throw AppException('Unecpected Exception');
    }
  }


  Future<T> get<T>({
    required String url,
    Options? options,
    Map<String,dynamic>? body,
    Map<String,dynamic>? queryParameters,
  })async{
    return _performRequest(
      () => _dio.get(url,queryParameters: queryParameters,options: options,data: body)
    );
  }
}