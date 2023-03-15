import 'dart:convert';

class WithdrawalModel {
  final String id;
  final int amount;
  final String officeID;
  final String officeName;
  final String officeAddress;
  final String typeWithdraw;
  final String status;
  final String recipientID;
  final String recipientName;
  final String recipientMobile;
  final String createdAt;

  WithdrawalModel(
    this.id,
    this.amount,
    this.officeID,
    this.officeName,
    this.officeAddress,
    this.typeWithdraw,
    this.status,
    this.recipientID,
    this.recipientName,
    this.recipientMobile,
    this.createdAt,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'officeID': officeID,
      'officeName': officeName,
      'officeAddress': officeAddress,
      'typeWithdraw': typeWithdraw,
      'status': status,
      'recipientID': recipientID,
      'recipientName': recipientName,
      'recipientMobile': recipientMobile,
      'createdAt': createdAt,
    };
  }

  factory WithdrawalModel.fromMap(Map<String, dynamic> map) {
    return WithdrawalModel(
      map['_id'] as String,
      map['amount'] as int,
      map['office']['_id'] as String,
      map['office']['name'] as String,
      map['office']['address'] as String,
      map['typeWithdraw'] as String,
      map['status'] as String,
      map['recipient']['_id'] as String,
      map['recipient']['name'] as String,
      map['recipient']['mobile'] as String,
      map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WithdrawalModel.fromJson(String source) =>
      WithdrawalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WithdrawalModel(id: $id, amount: $amount, officeID: $officeID, officeName: $officeName, officeAddress: $officeAddress, typeWithdraw: $typeWithdraw, status: $status, recipientID: $recipientID, recipientName: $recipientName, recipientMobile: $recipientMobile, createdAt: $createdAt)';
  }
}
