import 'dart:convert';

class RecipientModel {
  final String sId;
  final String name;
  final String mobile;
  final String idNumber;
  final String createdAt;
  final String updatedAt;
  RecipientModel({
    required this.sId,
    required this.name,
    required this.mobile,
    required this.idNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sId': sId,
      'name': name,
      'mobile': mobile,
      'idNumber': idNumber,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory RecipientModel.fromMap(Map<String, dynamic> map) {
    return RecipientModel(
      sId: map['_id'] as String,
      name: map['name'] as String,
      mobile: map['mobile'] as String,
      idNumber: map['idNumber'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipientModel.fromJson(String source) =>
      RecipientModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
