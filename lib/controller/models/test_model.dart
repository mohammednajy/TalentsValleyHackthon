class TestModel {
  final String id;
  final double amount;
  final OfficeModel? officeModel;
  final String typeWithdraw;
  final String status;
  final RecipientModel? recipientModel;
  final String createdAt;
  final BankModel? bankModel;

  TestModel({
    required this.id,
    required this.amount,
    this.officeModel,
    required this.typeWithdraw,
    required this.status,
    this.recipientModel,
    required this.createdAt,
    required this.bankModel,
  });
  factory TestModel.fromJson(Map<String, dynamic> map) {
    return TestModel(
        id: map["_id"],
        amount: map["amount"] as double,
        officeModel:
            map["office"] != null ? OfficeModel.fromJson(map["office"]) : null,
        typeWithdraw: map["typeWithdraw"],
        status: map["status"],
        recipientModel: map["recipient"] != null
            ? RecipientModel.fromJson(map["recipient"])
            : null,
        createdAt: map["createdAt"],
        bankModel:
            map["bank"] != null ? BankModel.fromJson(map["bank"]) : null);
  }

  @override
  String toString() {
    return 'TestModel(id: $id, amount: $amount, officeModel: $officeModel, typeWithdraw: $typeWithdraw, status: $status, recipientModel: $recipientModel, createdAt: $createdAt, bankModel: $bankModel)';
  }
}

class OfficeModel {
  final String officeID;
  final String officeName;
  final String officeAddress;

  OfficeModel({
    required this.officeID,
    required this.officeName,
    required this.officeAddress,
  });
  factory OfficeModel.fromJson(Map<String, dynamic> map) {
    return OfficeModel(
      officeID: map["_id"],
      officeName: map["name"],
      officeAddress: map["address"],
    );
  }

  @override
  String toString() =>
      'OfficeModel(officeID: $officeID, officeName: $officeName, officeAddress: $officeAddress)';
}

class RecipientModel {
  final String recipientID;
  final String recipientName;
  final String recipientMobile;

  RecipientModel({
    required this.recipientID,
    required this.recipientName,
    required this.recipientMobile,
  });
  factory RecipientModel.fromJson(Map<String, dynamic> map) {
    return RecipientModel(
      recipientID: map["_id"],
      recipientName: map["name"],
      recipientMobile: map["mobile"],
    );
  }

  @override
  String toString() =>
      'RecipientModel(recipientID: $recipientID, recipientName: $recipientName, recipientMobile: $recipientMobile)';
}

class BankModel {
  final String bankID;
  final String accountName;
  final String accountNumber;
  final String bankName;

  BankModel(
      {required this.bankID,
      required this.accountName,
      required this.accountNumber,
      required this.bankName});
  factory BankModel.fromJson(Map<String, dynamic> map) {
    return BankModel(
      bankID: map["_id"],
      accountName: map["accountName"],
      accountNumber: map["accountNumber"],
      bankName: map["bankName"],
    );
  }

  @override
  String toString() {
    return 'BankModel(bankID: $bankID, accountName: $accountName, accountNumber: $accountNumber, bankName: $bankName)';
  }
}
