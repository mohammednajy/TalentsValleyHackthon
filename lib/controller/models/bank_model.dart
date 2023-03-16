// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class BankModel extends Equatable {
  late String sId;
  late String accountName;
  late String accountNumber;
  late String bankBranch;
  late String bankName;
  late String ledger;
  late String currency;
  late String createdAt;
  late String updatedAt;

  BankModel(
      {required this.sId,
      required this.accountName,
      required this.accountNumber,
      required this.bankBranch,
      required this.bankName,
      required this.ledger,
      required this.currency,
      required this.createdAt,
      required this.updatedAt});

  BankModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    accountName = json['accountName'];
    accountNumber = json['accountNumber'];
    bankBranch = json['bankBranch'];
    bankName = json['bankName'];
    ledger = json['ledger'];
    currency = json['currency'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['accountName'] = accountName;
    data['accountNumber'] = accountNumber;
    data['bankBranch'] = bankBranch;
    data['bankName'] = bankName;
    data['ledger'] = ledger;
    data['currency'] = currency;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  @override
  List<Object?> get props => [
        sId,
        accountName,
        accountNumber,
        bankBranch,
        bankName,
        ledger,
        currency,
        createdAt,
        updatedAt,
      ];

  @override
  bool get stringify => true;
}
