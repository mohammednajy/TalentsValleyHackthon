class EndPoints {
  static const String baseUrl =
      "https://talents-valley-backend.herokuapp.com/api";
  static const String login = '$baseUrl/user/login';
  static const String withdrawList = '$baseUrl/withdraw/list';
  static const String bankAccountList = '$baseUrl/bank/listing';
  static const String deleteBankAccount = '$baseUrl/bank/delete/';
  static const String sendVerificationCodeToAddBankAccount =
      '$baseUrl/bank/send-code';
  static const String addBankAccount = '$baseUrl/bank/add';
  static const String bankDetailsAccount = '$baseUrl/bank/details/';
  static const String requestBankWithdraw = '$baseUrl/withdraw/request-bank';
  static const String sendVerificationCodeToAddRecipient =
      '$baseUrl/recipient/send-code';
  static const String addRecipient = '$baseUrl/recipient/create';
  static const String recipientList = '$baseUrl/recipient/list';
  static const String deleteRecipient = '$baseUrl/recipient/delete/';
  static const String editRecipient = '$baseUrl/recipient/edit/';
  static const String withdrawDetailsAccount = '$baseUrl/withdraw/details/';
  static const String officeList = '$baseUrl/withdraw/office-list';
  static const String requestCashWithdrawal = '$baseUrl/withdraw/request-cash';


  static const int receiveTimeout = 35000;
  static const int connectTimeout = 35000;
}
