import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/api/invoiceApi/invoiceApi.dart';
import 'package:talents_valley_hackthon/controller/models/invoice_model.dart';
import 'package:talents_valley_hackthon/controller/models/link_model.dart';

import '../../../api/apiSettings/app_exception.dart';
import '../../../utils/helper.dart';

class InvoiceProvider extends ChangeNotifier {
  bool loading = false;
  List<InvoiceModel> invoices = [];
  List<LinkModel> links = [];

  setLoading(bool loadingValue) {
    loading = loadingValue;
    notifyListeners();
  }

  getInvoicesList({
    required String token,
    String? filter,
    String? search,
    int limit = 10,
    int offset = 0,
  }) async {
    try {
      setLoading(true);
      final response = await InvoiceApi.getInvoicesList(
        token: token,
        queryParameters: filter != null
            ? {
                // "limit": limit,
                // "offset": offset,
                "sort": "-createdAt",
                "filter": filter,
                "search": search,
              }
            : {
                // "limit": limit,
                // "offset": offset,
                "sort": "-createdAt",
                "search": search,
              },
      );
      if (response.statusCode == 200) {
        final List<dynamic> invoiceList = response.data["data"]["invoices"];
        invoices = invoiceList
            .map(
              (e) => InvoiceModel.fromJson(e),
            )
            .toList();
        // print(invoiceList[4]);
        notifyListeners();
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  getLinkList({
    required String token,
    String? filter ,
    String? search,
    int limit = 10,
    int offset = 0,
  }) async {
    try {
      setLoading(true);
      print(filter != null);
      final response = await InvoiceApi.getLinkList(
        token: token,
        queryParameters: filter != null
            ? {
                // "limit": limit,
                // "offset": offset,
                "filter": filter,
                "search": search,
              }
            : {
                // "limit": limit,
                // "offset": offset,
                "search": search,
              },
      );
      if (response.statusCode == 200) {
        print(filter);
        final List<dynamic> linkList = response.data["data"]["services"];
        links = linkList
            .map(
              (e) => LinkModel.fromJson(e),
            )
            .toList();
        notifyListeners();
        print(links.length);
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }
}
