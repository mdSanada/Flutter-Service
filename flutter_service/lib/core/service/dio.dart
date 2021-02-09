import 'package:dio/dio.dart';
import 'package:flutter_service/core/service/custom_interceptors.dart';
import 'package:flutter_service/core/service/service.dart';

class CustomDio {
  var _dio;
  Dio get instance => _dio;

  CustomDio() {
    _dio = Dio();
    _dio.options.baseUrl = Service.baseUrl;
  }

  CustomDio.withAuthentication() {
    _dio = Dio();
    _dio.options.baseUrl = Service.baseUrl;
    _dio.interceptors.add(CustomInterceptors());
    _dio.options.connectTimeout = 5000;
  }

  CustomDio.pexels() {
    _dio = Dio();
    _dio.options.baseUrl = Service.baseUrlPexel;
    _dio.interceptors.add(CustomInterceptors());
    _dio.options.connectTimeout = 5000;
  }
}
