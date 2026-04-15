import 'package:qerp_app/core/network/network_service/api_errors.dart';

class ApiResponse<T> {
  final T? data;
  final ApiErrors? error;

  const ApiResponse({this.data, this.error});

  factory ApiResponse.fromJson(Map<String,dynamic> json) => ApiResponse(
    data: json['data'], 
    error: json['error'] != null? ApiErrors(message: json['error']) : null);
}