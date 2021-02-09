import 'package:flutter_service/core/service/api_response.dart';

extension FutureExtension on Future {
  void subscribe<T>(
      // {T Function(Map<String, dynamic> data) mapper,
      {Function(T data) onSuccess,
      Function(T err) onError,
      dynamic data}) {
    this.then(
      (response) {
        switch (response.status) {
          case Status.COMPLETED:
            // final mapped = mapper(response.data);
            return onSuccess(response.data);
          case Status.ERROR:
            return onError(response.data);
        }
      },
    ).catchError(
      (err) {
        switch (err.status) {
          default:
            return onError(err);
        }
      },
    );
  }
}
