import 'package:dio/dio.dart';

import 'log_interceptors.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    options.headers = {"Authorization": "token"};
    LogHttp.logRequest(options);
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    LogHttp.logResponse(response);
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    LogHttp.logError(err);

    return super.onError(err);
  }
}
