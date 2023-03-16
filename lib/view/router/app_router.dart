import 'package:flutter/cupertino.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/payout_provider.dart';

class AppRouter {
  AppRouter._();
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static goAndRemove(String screenName) {
    navigationKey.currentState!
        .pushNamedAndRemoveUntil(screenName, (route) => false);
  }

  static goTo(String screenName, {Object? object}) {
    return navigationKey.currentState!.pushNamed(screenName, arguments: object);
  }

  static back({dynamic object}) {
    navigationKey.currentState!.maybePop(object);
  }

  static goAndRemoveUntil(
      {required String screenName, required String targetScreen}) {
    navigationKey.currentState!
        .pushNamedAndRemoveUntil(targetScreen, ModalRoute.withName(screenName));
  }

  static popUntil({required String screenName}) {
    navigationKey.currentState!.popUntil(ModalRoute.withName(screenName));
  }
}
