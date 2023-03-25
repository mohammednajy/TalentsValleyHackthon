import 'package:talents_valley_hackthon/view/screens/app/invoice/link/create_link_screen.dart';

class CreateInvoiceModel {
  final String clientName;
  final String clientEmail;
  final String clientAddress;
  final List<Fixed> fixedList;
  final String currency;

  CreateInvoiceModel({
    required this.clientName,
    required this.clientEmail,
    required this.clientAddress,
    required this.fixedList,
    required this.currency,
  });

  factory CreateInvoiceModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> fixedItems = json["fixed"];

    return CreateInvoiceModel(
      clientName: json["client"]["fullName"],
      clientEmail: json["client"]["email"],
      clientAddress: json["client"]["address"]["country"],
      fixedList: fixedItems.map((e) => Fixed.fromJson(e)).toList(),
      currency: json["currency"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "client": {
        "fullName": clientName,
        "email": clientEmail,
        "address": {
          "country": clientAddress,
        }
      },
    };
    data["fixed"] = fixedList.map((e) => e.toJson()).toList();
    data["currency"] = currency;
    return data;
  }

  @override
  String toString() {
    return 'CreateInvoiceModel(clientName: $clientName, clientEmail: $clientEmail, clientAddress: $clientAddress, fixedList: $fixedList, currency: $currency)';
  }
}

class Fixed {
  final String itemName;
  final String description;
  final double price;
  Fixed({
    required this.itemName,
    required this.description,
    required this.price,
  });

  factory Fixed.fromJson(Map<String, dynamic> json) {
    return Fixed(
      itemName: json['itemName'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['itemName'] = itemName;
    data['description'] = description;
    data['price'] = price;
    return data;
  }

  @override
  String toString() =>
      'Fixed(itemName: $itemName, description: $description, price: $price)';
}

class CreateLinkModel {
  final List<Fixed> fixedList;
  final String currency;

  CreateLinkModel({
    required this.fixedList,
    required this.currency,
  });

  factory CreateLinkModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> fixedItems = json["fixed"];

    return CreateLinkModel(
      fixedList: fixedItems.map((e) => Fixed.fromJson(e)).toList(),
      currency: json["currency"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["fixed"] = fixedList.map((e) => e.toJson()).toList();
    data["currency"] = currency;
    return data;
  }

  @override
  String toString() {
    return 'CreateInvoiceModel(fixedList: $fixedList, currency: $currency)';
  }
}
