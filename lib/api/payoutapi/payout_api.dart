import 'package:dio/dio.dart';
import 'package:talents_valley_hackthon/api/apiSettings/base_client.dart';
import 'package:talents_valley_hackthon/api/apiSettings/endpoint.dart';
import 'package:talents_valley_hackthon/controller/models/withdraw_model.dart';

class PayoutApi {
  static Future<Response> getWithdrawalList({
    required String token,
  }) async {
    return await BaseClient().get(
      EndPoints.withdrawList,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }

  static Future<Response> getBankList({
    required String token,
  }) async {
    return await BaseClient().get(
      EndPoints.bankAccountList,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }
}
