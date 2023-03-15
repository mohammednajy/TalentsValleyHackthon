import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


import '../../../api/apiSettings/app_exception.dart';
import '../../../api/authApi/auth_api.dart';
import '../../../utils/helper.dart';
import '../../localData/shared_perf.dart';
import '../../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  bool loading = false;
  setLoading(bool loadingValue) {
    loading = loadingValue;
    notifyListeners();
  }

  login() async {
    try {
      setLoading(true);
      final Response response = await AuthApi.login(
        email: "hebaskhail@gmail.com",
        password: "Heba@123456",
      );
      if (response.data["statusCode"] == 200) {
        SharedPrefController().save(UserModel.fromJson(response.data["data"]));
        print(response.data);
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }
}
