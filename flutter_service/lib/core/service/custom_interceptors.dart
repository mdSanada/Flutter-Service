import 'package:dio/dio.dart';
import 'package:flutter_service/core/service/service.dart';

import 'log_interceptors.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    if (options.baseUrl == Service.baseUrlPexel) {
      options.headers = {
        "Authorization":
            "563492ad6f91700001000001998408b0eabc4221a99350d81ccfbe11"
      };
    }
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
