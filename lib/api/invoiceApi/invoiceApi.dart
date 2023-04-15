import 'package:dio/dio.dart';
import 'package:talents_valley_hackthon/api/apiSettings/base_client.dart';
import 'package:talents_valley_hackthon/api/apiSettings/endpoint.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';

class InvoiceApi {
  static Future<Response> getInvoicesList({
    required String token,
    required Map<String, dynamic>? queryParameters,
  }) async {
    return await BaseClient().get(
      EndPoints.invoiceList,
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
      queryParameters: queryParameters,
    );
  }

  static Future<Response> getLinkList({
    required String token,
    required Map<String, dynamic>? queryParameters,
  }) async {
    return await BaseClient().get(
      EndPoints.linkList,
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
      queryParameters: queryParameters,
    );
  }

  static Future<Response> createInvoice({
    required String token,
    required dynamic data,
  }) async {
    return await BaseClient().post(
      EndPoints.createInvoice,
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
      data: data,
    );
  }

  static Future<Response> createLink({
    required String token,
    required dynamic data,
  }) async {
    return await BaseClient().post(
      EndPoints.createLink,
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
      data: data,
    );
  }

  static Future<Response> editInvoice({
    required String id,
    required dynamic data,
  }) async {
    return await BaseClient().put(
      EndPoints.editInvoice+id,
      options: Options(headers: {
        "Authorization":
            "Bearer ${SharedPrefController().getUser().accessToken}",
      }),
      data: data,
    );
  }
}
