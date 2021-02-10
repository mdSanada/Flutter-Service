import 'package:dio/dio.dart';
import 'package:flutter_service/core/service/api_response.dart';

extension FutureExtension on Future {
  Future<void> subscribe<T>(
      {T Function(Map<String, dynamic> data) mapper,
      Function(T data) onSuccess,
      Function(dynamic err) onError}) async {
    try {
      var response = await this;
      final mapped = mapper(response.data);
      return onSuccess(mapped);
    } catch (err) {
      return onError(err.error);
    }
  }

  Future<ApiResponse<dynamic>> request<T>() async {
    try {
      var response = await this;
      return ApiResponse.completed(response.data);
    } catch (err) {
      throw ApiResponse.error(err as DioError);
    }
  }
}
