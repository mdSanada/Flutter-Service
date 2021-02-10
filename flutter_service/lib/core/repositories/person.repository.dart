import 'package:flutter_service/core/service/api_response.dart';
import 'package:flutter_service/core/service/dio.dart';
import 'package:flutter_service/core/service/future_extension.dart';

class PersonRepository {
  Future<ApiResponse<dynamic>> getData(String person) async {
    var dio = CustomDio.withAuthentication().instance;
    return await dio.get(person + '/').request();
  }

  Future<ApiResponse<dynamic>> getImage(String person) async {
    var dio = CustomDio.pexels().instance;
    final url = Uri.encodeFull(
        'search?query=' + person.replaceAll(new RegExp(r"\s+"), "") + '/');
    return await dio.get(url).request();
  }
}
