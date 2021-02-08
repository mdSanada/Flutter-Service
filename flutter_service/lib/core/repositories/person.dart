import 'package:flutter_service/core/models/person.dart';
import 'package:flutter_service/core/service/api_response.dart';
import 'package:flutter_service/core/service/dio.dart';
import 'package:flutter_service/core/service/service.dart';

class PersonRepository {
  Future<ApiResponse<Person>> getData(String person) {
    var dio = CustomDio.withAuthentication().instance;
    ApiResponse.loading("message");
    return dio.get(person + '/').then((res) {
      return ApiResponse.completed(Person.fromMap(res.data));
    }).catchError((err) => ApiResponse.error(err.toString()));
  }
}
