class EndPoints {
  static const String baseUrl =
      "https://talents-valley-backend.herokuapp.com/api";
  static const String login = '$baseUrl/user/login';
  static const String withdrawList = '$baseUrl/withdraw/list';
  static const String bankAccountList = '$baseUrl/bank/listing';

  static const int receiveTimeout = 35000;
  static const int connectTimeout = 35000;
}
