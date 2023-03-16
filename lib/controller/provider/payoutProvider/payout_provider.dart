// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:talents_valley_hackthon/api/payoutapi/payout_api.dart';
import 'package:talents_valley_hackthon/controller/models/bank_model.dart';
import 'package:talents_valley_hackthon/controller/models/office_model.dart';
import 'package:talents_valley_hackthon/controller/models/withdraw_model_list.dart';

import '../../../api/apiSettings/app_exception.dart';
import '../../../utils/helper.dart';
import '../../../view/router/app_router.dart';
import '../../../view/router/router_name.dart';
import '../../models/recipient_model.dart';

class PayoutProvider extends ChangeNotifier {
  List<BankModel> banks = [];
  List<Withdraws> withdraw = [];
  bool loading = false;
  setLoading(bool loadingValue) {
    loading = loadingValue;
    notifyListeners();
  }

  getWithdrawalList({required String token}) async {
    try {
      setLoading(true);
      final response = await PayoutApi.getWithdrawalList(token: token);
      if (response.statusCode == 200) {
        withdraw = Data.fromJson(response.data["data"]).withdraws!;
        //  = ;
        print(withdraw.length);
        notifyListeners();
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  deleteBank({
    required String token,
    required BankModel bankModel,
  }) async {
    setLoading(true);
    try {
      final response = await PayoutApi.deleteBank(
        token: token,
        id: bankModel.sId,
      );
      if (response.statusCode == 200) {
        banks.remove(bankModel);
        UtilsConfig.showSnackBarMessage(
          message: "Bank account has been deleted.",
          status: true,
        );
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  getBankList({required String token}) async {
    try {
      setLoading(true);
      final response = await PayoutApi.getBankList(token: token);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data["data"]["banks"];

        banks = jsonList.map((value) => BankModel.fromJson(value)).toList();
        notifyListeners();
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  sendVerificationCodeToAdd({
    required String token,
    required String accountName,
    required String accountNumber,
    required String bankBranch,
    required String ledger,
  }) async {
    try {
      setLoading(true);
      final response = await PayoutApi.sendVerificationCodeToAddBank(
          token: token,
          accountName: accountName,
          accountNumber: accountNumber,
          bankBranch: bankBranch,
          ledger: ledger);
      if (response.statusCode == 200) {
        UtilsConfig.showSnackBarMessage(
          message: "verification sends successfully",
          status: true,
        );
        AppRouter.goTo(
          ScreenName.otpBankScreen,
          object: BankInfo(
            accountName: accountName,
            accountNumber: accountNumber,
            bankBranch: bankBranch,
            ledger: ledger,
          ),
        );
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  addBankAccount({
    required String token,
    required String accountName,
    required String accountNumber,
    required String bankBranch,
    required String ledger,
    required String code,
  }) async {
    try {
      setLoading(true);
      final response = await PayoutApi.addBankAccount(
          token: token,
          accountName: accountName,
          accountNumber: accountNumber,
          bankBranch: bankBranch,
          ledger: ledger,
          code: code);
      if (response.statusCode == 201) {
        getBankList(token: token);
        UtilsConfig.showSnackBarMessage(
          message: "Add bank successfully",
          status: true,
        );

        AppRouter.popUntil(
          screenName: ScreenName.selectAddBankScreen,
        );
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  Future<BankModel> getBankDetails({
    required String token,
    required String id,
  }) async {
    final response = await PayoutApi.getBankDetails(token: token, id: id);
    print(response.data);
    return BankModel.fromJson(response.data["data"]);
  }

  confirmBankWithdrawal({
    required String token,
    required String bankId,
    required double amount,
  }) async {
    try {
      setLoading(true);
      final response = await PayoutApi.confirmBankWithdrawal(
          token: token, bankId: bankId, amount: amount);
      if (response.statusCode == 200) {
        getWithdrawalList(token: token);
        AppRouter.goAndRemove(ScreenName.payoutScreen);
        UtilsConfig.showSnackBarMessage(
          message: "Bank Withdrawal successfully",
          status: true,
        );
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  /// cash method start from here

  List<RecipientModel> recipientList = [];

  sendVerificationCodeToRecipient({
    required String token,
    required String mobile,
    required String idNumber,
    required String name,
    required bool edit,
    required String recipientId,
  }) async {
    try {
      setLoading(true);
      final response = await PayoutApi.sendVerificationCodeToRecipient(
          edit: edit,
          recipientId: recipientId,
          token: token,
          mobile: mobile,
          idNumber: idNumber);
      if (response.statusCode == 200) {
        print(response.data);
        UtilsConfig.showSnackBarMessage(
          message: "verification sends successfully",
          status: true,
        );
        AppRouter.goTo(ScreenName.otpCashScreen,
            object: [mobile, idNumber, name, edit]);
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  addRecipient({
    required String token,
    required String mobile,
    required String idNumber,
    required String name,
    required String code,
  }) async {
    try {
      setLoading(true);
      final response = await PayoutApi.addRecipient(
        token: token,
        mobile: mobile,
        idNumber: idNumber,
        name: name,
        code: code,
      );
      if (response.statusCode == 201) {
        print(response.data);
        UtilsConfig.showSnackBarMessage(
          message: "Recipient successfully",
          status: true,
        );

        AppRouter.popUntil(
          screenName: ScreenName.selectAddRecipientCashScreen,
        );
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  getRecipientList({required String token}) async {
    try {
      setLoading(true);
      final response = await PayoutApi.getRecipientList(token: token);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data["data"]["recipients"];
        print(response.data);
        recipientList =
            jsonList.map((value) => RecipientModel.fromMap(value)).toList();

        notifyListeners();
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  deleteRecipient({
    required String token,
    required RecipientModel recipientModel,
  }) async {
    setLoading(true);
    try {
      final response = await PayoutApi.deleteRecipient(
        token: token,
        id: recipientModel.sId,
      );
      if (response.statusCode == 200) {
        recipientList.remove(recipientModel);
        UtilsConfig.showSnackBarMessage(
          message: "recipient has been deleted.",
          status: true,
        );
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  String idSelected = '';

  setIndex(String selected) {
    idSelected = selected;
    notifyListeners();
    print(idSelected);
  }

  editRecipient({
    required String token,
    required String code,
    required String id,
    required String mobile,
    required String idNumber,
    required String name,
  }) async {
    setLoading(true);
    try {
      final response = await PayoutApi.editRecipient(
          token: token,
          id: id,
          data: {
            "code": code,
            "mobile": mobile,
            "idNumber": idNumber,
            "name": name
          });
      if (response.statusCode == 200) {
        AppRouter.popUntil(
          screenName: ScreenName.selectAddRecipientCashScreen,
        );
        UtilsConfig.showSnackBarMessage(
          message: "recipient has been edited.",
          status: true,
        );
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  List<OfficeModel> office = [];
  getOfficeList({required String token}) async {
    try {
      setLoading(true);
      final response = await PayoutApi.getOfficeList(token: token);
      if (response.statusCode == 200) {
        List<dynamic> jsonObject = response.data["data"];
        office = jsonObject
            .map(
              (e) => OfficeModel.fromMap(e),
            )
            .toList();
        print(office.length);
        notifyListeners();
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  requestCashWithdrawal({
    required String token,
    required String officeId,
    required String recipientId,
    required int amount,
  }) async {
    try {
      setLoading(true);
      final response = await PayoutApi.requestCashWithdrawal(
          token: token,
          officeId: officeId,
          recipientId: recipientId,
          amount: amount);
      if (response.statusCode == 200) {
        UtilsConfig.showSnackBarMessage(
          message: "Cash Withdrawal successfully",
          status: true,
        );
        AppRouter.goAndRemove(ScreenName.payoutScreen);
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }
}

class BankInfo {
  final String accountName;
  final String accountNumber;
  final String bankBranch;
  final String ledger;
  BankInfo({
    required this.accountName,
    required this.accountNumber,
    required this.bankBranch,
    required this.ledger,
  });

  @override
  String toString() {
    return 'BankInfo(accountName: $accountName, accountNumber: $accountNumber, bankBranch: $bankBranch, ledger: $ledger)';
  }
}
