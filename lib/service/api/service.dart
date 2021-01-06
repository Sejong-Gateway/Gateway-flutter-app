import 'package:dio/dio.dart';

abstract class ApiService {
  Dio get dio {
    var _dio = Dio(BaseOptions(baseUrl: "http://14.39.255.83"));

    return _dio;
  }
}