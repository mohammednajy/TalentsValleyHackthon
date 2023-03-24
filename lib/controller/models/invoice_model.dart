class InvoiceModel {
  final String id;
  final String clientId;

  final String clientName;
  final String clientEmail;
  final Map clientAddress;

  final String currency;
  final List<FixedModel> fixedList;
  // final List<FreelancerModel> freelancerList;
  final String freelancerName;
  final String freelancerEmail;
  final String freelancerId;
  final String createdAt;
  final String updatedAt;
  final int subTotal;
  final String hashcode;
  final String status;
  InvoiceModel({
    required this.clientId,
    required this.clientAddress,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.clientName,
    required this.clientEmail,
    required this.currency,
    required this.fixedList,
    required this.freelancerId,
    required this.freelancerEmail,
    required this.freelancerName,
    required this.subTotal,
    required this.hashcode,
    required this.status,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> fixedListJson = json["fixed"];
    List<FixedModel> fixedList = fixedListJson.map(
      (e) {
        return FixedModel.fromJson(e);
      },
    ).toList();

    // final List<dynamic> freelancerListJson = [...json["freelancer"]];
    // List<FreelancerModel> freelancerList = freelancerListJson.map(
    //   (e) {
    //     return FreelancerModel.fromJson(e);
    //   },
    // ).toList();
    return InvoiceModel(
      id: json["_id"],
      clientId: json["client"]["_id"] ?? '',
      clientName: json["client"]["fullName"] ?? '',
      clientEmail: json["client"]["email"],
      clientAddress: json["client"]["address"] ?? {},
      currency: json["currency"],
      fixedList: fixedList,
      freelancerId: json["freelancer"]["_id"],
      freelancerEmail: json["freelancer"]["email"],
      freelancerName:
          '${json["freelancer"]["firstName"]} ${json["freelancer"]["lastName"]}',
      subTotal: json["subTotal"],
      hashcode: json["hashCode"] ?? '',
      status: json["status"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }
}

class FixedModel {
  final String itemName;
  final String description;
  final int price;
  final String sId;

  FixedModel(
      {required this.itemName,
      required this.description,
      required this.price,
      required this.sId});

  factory FixedModel.fromJson(Map<String, dynamic> json) {
    return FixedModel(
      itemName: json["itemName"],
      description: json["description"],
      price: json["price"],
      sId: json["_id"],
    );
  }
}

class FreelancerModel {
  final String firstName;
  final String lastName;
  final String email;

  FreelancerModel(
      {required this.firstName, required this.lastName, required this.email});

  factory FreelancerModel.fromJson(Map<String, dynamic> json) {
    return FreelancerModel(
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
    );
  }
}
