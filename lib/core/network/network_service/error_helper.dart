import 'package:dio/dio.dart';
import 'package:qerp_app/core/network/network_service/exceptions.dart';

class ErrorHelper {
  static Future<AppException> handleDioError(DioException e) async{
    switch(e.type){
      case DioExceptionType.connectionError:
      return NetworkException('No Internet Connection');
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      return NetworkException("Connection Time Out");
      case DioExceptionType.badResponse:
      if(e.response?.statusCode == 401){
        return UnauthorizedException("session Expired");
      }
      final errorData = e.response?.data as Map<String,dynamic>?;
      return ValidationException(errorData?['message'] ?? "Unknown Server Error",validationError: errorData);
      default:
      return ServerException(message: "Unexpected server error");
    }
  }
}