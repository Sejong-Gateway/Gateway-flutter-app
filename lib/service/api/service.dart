import 'package:dio/dio.dart';

abstract class ApiService {
  Dio get dio {
    var _dio = Dio(BaseOptions(baseUrl: "http://sju-gateway.com:3000/v1"));

    return _dio;
  }
}