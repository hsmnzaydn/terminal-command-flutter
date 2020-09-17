import 'package:dio/dio.dart';
import 'package:terminal_commands_flutter/services/DioInterceptor.dart';

class DioClient {
  static Dio getDioClient() {
    Dio _dio = Dio();
    _dio.interceptors.add(DioInterceptor());
    return _dio;
  }
}
