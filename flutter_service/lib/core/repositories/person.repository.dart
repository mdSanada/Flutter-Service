import 'package:flutter_service/core/models/imagePexels.dart';
import 'package:flutter_service/core/models/person.dart';
import 'package:flutter_service/core/service/api_response.dart';
import 'package:flutter_service/core/service/dio.dart';

class PersonRepository {
  Future<ApiResponse<dynamic>> getData(String person) {
    var dio = CustomDio.withAuthentication().instance;
    return dio.get(person + '/').then((res) {
      return ApiResponse.completed(Person.fromJson(res.data));
    }).catchError((onError) {
      throw ApiResponse.error(onError.toString());
    });
  }

  Future<ApiResponse<dynamic>> getImage(String person) {
    var dio = CustomDio.pexels().instance;
    final url = Uri.encodeFull(
        'search?query=' + person.replaceAll(new RegExp(r"\s+"), "") + '/');
    return dio.get(url).then((res) {
      return ApiResponse.completed(ImagePexels.fromJson(res.data));
    }).catchError((onError) {
      throw ApiResponse.error(onError.toString());
    });
  }
}
