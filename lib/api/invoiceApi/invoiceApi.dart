import 'package:dio/dio.dart';
import 'package:talents_valley_hackthon/api/apiSettings/base_client.dart';
import 'package:talents_valley_hackthon/api/apiSettings/endpoint.dart';

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
}