// ignore_for_file: public_member_api_docs, sort_constructors_first
class Data {
  int? count;
  List<Withdraws>? withdraws;

  Data({this.count, this.withdraws});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['withdraws'] != null) {
      withdraws = <Withdraws>[];
      json['withdraws'].forEach((v) {
        withdraws!.add( Withdraws.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.withdraws != null) {
      data['withdraws'] = this.withdraws!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() => 'Data(count: $count, withdraws: $withdraws)';
}

class Withdraws {
  String? sId;
  int? amount;
  Bank? bank;
  String? typeWithdraw;
  String? status;
  String? createdAt;
  Office? office;
  Recipient? recipient;

  Withdraws(
      {this.sId,
      this.amount,
      this.bank,
      this.typeWithdraw,
      this.status,
      this.createdAt,
      this.office,
      this.recipient});

  Withdraws.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    amount = json['amount'];
    bank = json['bank'] != null ?  Bank.fromJson(json['bank']) : null;
    typeWithdraw = json['typeWithdraw'];
    status = json['status'];
    createdAt = json['createdAt'];
    office =
        json['office'] != null ?  Office.fromJson(json['office']) : null;
    recipient = json['recipient'] != null
        ?  Recipient.fromJson(json['recipient'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['amount'] = this.amount;
    if (this.bank != null) {
      data['bank'] = this.bank!.toJson();
    }
    data['typeWithdraw'] = this.typeWithdraw;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    if (this.office != null) {
      data['office'] = this.office!.toJson();
    }
    if (this.recipient != null) {
      data['recipient'] = this.recipient!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Withdraws(sId: $sId, amount: $amount, bank: $bank, typeWithdraw: $typeWithdraw, status: $status, createdAt: $createdAt, office: $office, recipient: $recipient)';
  }
}

class Bank {
  String? sId;
  String? accountName;
  String? accountNumber;
  String? bankName;

  Bank({this.sId, this.accountName, this.accountNumber, this.bankName});

  Bank.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    accountName = json['accountName'];
    accountNumber = json['accountNumber'];
    bankName = json['bankName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['accountName'] = this.accountName;
    data['accountNumber'] = this.accountNumber;
    data['bankName'] = this.bankName;
    return data;
  }

  @override
  String toString() {
    return 'Bank(sId: $sId, accountName: $accountName, accountNumber: $accountNumber, bankName: $bankName)';
  }
}

class Office {
  String? sId;
  String? name;
  String? address;

  Office({this.sId, this.name, this.address});

  Office.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['address'] = this.address;
    return data;
  }

  @override
  String toString() => 'Office(sId: $sId, name: $name, address: $address)';
}

class Recipient {
  String? sId;
  String? name;
  String? mobile;

  Recipient({this.sId, this.name, this.mobile});

  Recipient.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    return data;
  }

  @override
  String toString() => 'Recipient(sId: $sId, name: $name, mobile: $mobile)';
}
