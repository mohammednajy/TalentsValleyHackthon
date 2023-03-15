import 'package:flutter/cupertino.dart';

class AppRouter {
  AppRouter._();
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static goAndRemove(String screenName) {
    navigationKey.currentState!
        .pushNamedAndRemoveUntil(screenName, (route) => false);
  }

  static goTo(String screenName, {Object? object}) {
    navigationKey.currentState!.pushNamed(screenName, arguments: object);
  }

  static back() {
    navigationKey.currentState!.maybePop();
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
