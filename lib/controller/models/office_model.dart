// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OfficeModel {
  final String sId;
  final String name;
  final String address;
  final int fees;
  final String startingHour;
  final String endingHour;
  OfficeModel({
    required this.sId,
    required this.name,
    required this.address,
    required this.fees,
    required this.startingHour,
    required this.endingHour,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sId': sId,
      'name': name,
      'address': address,
      'fees': fees,
      'startingHour': startingHour,
      'endingHour': endingHour,
    };
  }

  factory OfficeModel.fromMap(Map<String, dynamic> map) {
    return OfficeModel(
      sId: map['_id'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      fees: map['fees'] as int,
      startingHour: map['startingHour'] as String,
      endingHour: map['endingHour'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficeModel.fromJson(String source) =>
      OfficeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
