import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/api/invoiceApi/invoiceApi.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/controller/models/invoice_model.dart';
import 'package:talents_valley_hackthon/controller/models/link_model.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/bnb_provider.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';

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
    String? filter,
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

  createInvoice({required String token, required dynamic data}) async {
    setLoading(true);
    try {
      final response = await InvoiceApi.createInvoice(token: token, data: data);
      if (response.statusCode == 200) {
        UtilsConfig.showSnackBarMessage(
          message: 'invoice send successfully',
          status: true,
        );
        Provider.of<BNBProvider>(AppRouter.navigationKey.currentContext!,
                listen: false)
            .setSelectedPage(1);
        AppRouter.popUntil(screenName: ScreenName.homeScreen);
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  createLink({required String token, required dynamic data}) async {
    setLoading(true);
    try {
      final response = await InvoiceApi.createLink(token: token, data: data);
      if (response.statusCode == 201) {
        UtilsConfig.showSnackBarMessage(
          message: 'link send successfully',
          status: true,
        );
        AppRouter.popUntil(screenName: ScreenName.homeScreen);
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  editInvoice({required String id, required dynamic data}) async {
    setLoading(true);
    try {
      final response = await InvoiceApi.editInvoice(id: id, data: data);
      if (response.statusCode == 200) {
        getInvoicesList(token: SharedPrefController().getUser().accessToken);
        UtilsConfig.showSnackBarMessage(
          message: 'invoice edited successfully',
          status: true,
        );
        Provider.of<BNBProvider>(AppRouter.navigationKey.currentContext!,
                listen: false)
            .setSelectedPage(1);
        AppRouter.popUntil(screenName: ScreenName.homeScreen);
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }
}
