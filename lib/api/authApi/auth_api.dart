import 'package:dio/dio.dart';

import '../apiSettings/base_client.dart';
import '../apiSettings/endpoint.dart';

class AuthApi {
  AuthApi._();

  static Future<Response> login(
      {required String email, required String password}) async {
    return await BaseClient().post(EndPoints.login, data: {
      "email": email,
      "password": password,
    });
  }
}
