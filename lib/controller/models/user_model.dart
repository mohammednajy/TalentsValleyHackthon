class UserModel {
  final String accessToken;
  final String refreshToken;
  final UserInfo userInfo;

  UserModel({
    required this.accessToken,
    required this.refreshToken,
    required this.userInfo,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonMap) {
    UserInfo userInfo = UserInfo.fromJson(jsonMap["user"]);
    return UserModel(
      accessToken: jsonMap["accessToken"],
      refreshToken: jsonMap["refreshToken"],
      userInfo: userInfo,
    );
  }
  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "user": userInfo.toJson(),
      };
}

class UserInfo {
  final String id;
  final String firstName;
  final String lastName;
  final String email;

  final int balance;

  UserInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.balance,
  });

  factory UserInfo.fromJson(Map<String, dynamic> jsonMap) {
    return UserInfo(
      id: jsonMap["_id"],
      firstName: jsonMap["firstName"],
      lastName: jsonMap["lastName"],
      email: jsonMap["email"],
      balance: jsonMap["balance"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "balance": balance,
      };
  @override
  String toString() {
    return '$id $firstName $lastName $email  $balance ';
  }
}
