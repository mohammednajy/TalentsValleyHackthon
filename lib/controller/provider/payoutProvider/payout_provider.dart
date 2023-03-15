import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/api/payoutapi/payout_api.dart';
import 'package:talents_valley_hackthon/controller/models/bank_model.dart';
import 'package:talents_valley_hackthon/controller/models/withdraw_model.dart';
import 'package:talents_valley_hackthon/controller/models/withdraw_model_list.dart';

import '../../../api/apiSettings/app_exception.dart';
import '../../../utils/helper.dart';

class PayoutProvider extends ChangeNotifier {
  Future<List<Withdraws>> getWithdrawalList({required String token}) async {
    try {
      final response = await PayoutApi.getWithdrawalList(token: token);
      if (response.statusCode == 200) {
        Data data = Data.fromJson(response.data["data"]);
        return data.withdraws!;
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
    return [];
  }

  Future<List<BankModel>> getBankList({required String token}) async {
    try {
      final response = await PayoutApi.getBankList(token: token);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data["data"]["banks"];

        final List<BankModel> banks =
            jsonList.map((value) => BankModel.fromJson(value)).toList();
        return banks;
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
    return [];
  }
}
