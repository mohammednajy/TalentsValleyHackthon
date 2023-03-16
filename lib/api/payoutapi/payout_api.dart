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

  static Future<Response> deleteBank({
    required String token,
    required String id,
  }) async {
    return await BaseClient().delete(
      "${EndPoints.deleteBankAccount}$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }

  static Future<Response> sendVerificationCodeToAddBank({
    required String token,
    required String accountName,
    required String accountNumber,
    required String bankBranch,
    required String ledger,
  }) async {
    return await BaseClient()
        .post(EndPoints.sendVerificationCodeToAddBankAccount,
            options: Options(
              headers: {
                "Authorization": "Bearer $token",
              },
            ),
            data: {
          "accountName": accountName,
          "accountNumber": accountNumber,
          "bankBranch": bankBranch,
          "ledger": ledger
        });
  }

  static Future<Response> addBankAccount({
    required String token,
    required String accountName,
    required String accountNumber,
    required String bankBranch,
    required String ledger,
    required String code,
  }) async {
    return await BaseClient().post(
      EndPoints.addBankAccount,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
      data: {
        "accountName": accountName,
        "accountNumber": accountNumber,
        "bankBranch": bankBranch,
        "ledger": ledger,
        "code": code,
        "bankName": "Bank of Palestine"
      },
    );
  }

  static Future<Response> getBankDetails({
    required String token,
    required String id,
  }) async {
    return await BaseClient().get(
      "${EndPoints.bankDetailsAccount}$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }

  static Future<Response> confirmBankWithdrawal({
    required String token,
    required String bankId,
    required double amount,
  }) async {
    return await BaseClient().post(EndPoints.requestBankWithdraw,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "amount": amount,
          "bankId": bankId,
        });
  }

  /// cash api start from here

  static Future<Response> sendVerificationCodeToRecipient(
      {required String token,
      required String mobile,
      required String idNumber,
      required String recipientId,
      required bool edit}) async {
    return await BaseClient().post(EndPoints.sendVerificationCodeToAddRecipient,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
        data: edit
            ? {
                "mobile": mobile,
                "idNumber": idNumber,
                "recipientId": recipientId
              }
            : {
                "mobile": mobile,
                "idNumber": idNumber,
              });
  }

  static Future<Response> addRecipient({
    required String token,
    required String mobile,
    required String idNumber,
    required String name,
    required String code,
  }) async {
    return await BaseClient().post(
      EndPoints.addRecipient,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
      data: {
        "code": code,
        "mobile": mobile,
        "idNumber": idNumber,
        "name": name
      },
    );
  }

  static Future<Response> getRecipientList({
    required String token,
  }) async {
    return await BaseClient().get(
      EndPoints.recipientList,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }

  static Future<Response> deleteRecipient({
    required String token,
    required String id,
  }) async {
    return await BaseClient().delete(
      "${EndPoints.deleteRecipient}$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }

  static Future<Response> editRecipient({
    required String token,
    required String id,
    dynamic data,
  }) async {
    return await BaseClient().put(
      "${EndPoints.editRecipient}$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
      data: data,
    );
  }

  static Future<Response> getWithdrawalRequestDetails({
    required String token,
    required String id,
  }) async {
    return await BaseClient().get(
      "${EndPoints.withdrawDetailsAccount}$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }

  static Future<Response> getOfficeList({
    required String token,
  }) async {
    return await BaseClient().get(
      EndPoints.officeList,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }

  static Future<Response> requestCashWithdrawal({
    required String token,
    required String officeId,
    required String recipientId,
    required int amount,
  }) async {
    return await BaseClient().post(EndPoints.requestCashWithdrawal,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "amount": amount,
          "officeId": officeId,
          "recipientId": recipientId
        });
  }
}
