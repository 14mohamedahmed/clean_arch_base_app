import 'package:aqarmap/core/network/dio_interceptor.dart';
import 'package:dio/dio.dart';

class DioClient {
  DioClient() {
    _dio.interceptors.add(DioInterceptor());
    _dio.options.validateStatus = (status) {
      return true;
    };
  }
  final _dio = Dio();
  Dio get dio => _dio;
}
