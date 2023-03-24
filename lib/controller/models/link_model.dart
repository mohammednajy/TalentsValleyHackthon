class LinkModel {
  final String sId;
  final List<Fixed> fixedList;
  final String currency;
  final int subTotal;
  final String status;
  final int paidInvoice;
  final int revenue;
  final String serviceNo;
  final String createdAt;
  final String updatedAt;

  LinkModel(
      {required this.sId,
      required this.fixedList,
      required this.currency,
      required this.subTotal,
      required this.status,
      required this.paidInvoice,
      required this.revenue,
      required this.serviceNo,
      required this.createdAt,
      required this.updatedAt});

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> fixedListJson = json["fixed"];
    List<Fixed> fixedItems = fixedListJson
        .map(
          (e) => Fixed.fromJson(e),
        )
        .toList();

    return LinkModel(
      sId: json['_id'],
      fixedList: fixedItems,
      currency: json['currency'],
      subTotal: json['subTotal'],
      status: json['status'],
      paidInvoice: json['paidInvoice'],
      revenue: json['revenue'],
      serviceNo: json['serviceNo'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Fixed {
  final String itemName;
  final String description;
  final int price;
  final String sId;

  Fixed({
    required this.itemName,
    required this.description,
    required this.price,
    required this.sId,
  });

  factory Fixed.fromJson(Map<String, dynamic> json) {
    return Fixed(
        itemName: json['itemName'],
        description: json['description'],
        price: json['price'],
        sId: json['_id']);
  }
}
