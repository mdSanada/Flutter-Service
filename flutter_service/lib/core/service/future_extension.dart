import 'package:flutter_service/core/service/api_response.dart';

extension FutureExtension on Future {
  Future<void> subscribe<T>(
      {T Function(Map<String, dynamic> data) mapper,
      Function(T data) onSuccess,
      Function(T err) onError}) async {
    try {
      var response = await this;
      print(response.data);
      return onSuccess(response.data);
    } catch (err) {
      print(err);
      return onError(err);
    }
  }
}
