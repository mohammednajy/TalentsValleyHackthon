import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/add_bank_account_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank_perview_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank_withdrow_amount_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/otp_bank_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/payout_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/select_add_bank_screen.dart';

import '../screens/app/home_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  dynamic result;
  switch (settings.name) {
    case ScreenName.homeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
        settings: const RouteSettings(
          name: ScreenName.homeScreen,
        ),
      );

    case ScreenName.payoutScreen:
      return MaterialPageRoute(
        builder: (context) => const PayoutScreen(),
        settings: const RouteSettings(
          name: ScreenName.payoutScreen,
        ),
      );
    case ScreenName.bankWithdrawAmountScreen:
      return MaterialPageRoute(
        builder: (context) => const BankWithdrawAmountScreen(),
        settings: const RouteSettings(
          name: ScreenName.bankWithdrawAmountScreen,
        ),
      );
    case ScreenName.selectAddBankScreen:
      return MaterialPageRoute(
        builder: (context) => const SelectAddBankScreen(),
        settings: const RouteSettings(
          name: ScreenName.selectAddBankScreen,
        ),
      );
    case ScreenName.addBankAccountScreen:
      return MaterialPageRoute(
        builder: (context) => const AddBankAccountScreen(),
        settings: const RouteSettings(
          name: ScreenName.addBankAccountScreen,
        ),
      );
    case ScreenName.otpBankScreen:
      return MaterialPageRoute(
        builder: (context) => const OtpBankScreen(),
        settings: const RouteSettings(
          name: ScreenName.otpBankScreen,
        ),
      );

    case ScreenName.bankPreviewScreen:
      return MaterialPageRoute(
        builder: (context) => const BankPreviewScreen(),
        settings: const RouteSettings(
          name: ScreenName.bankPreviewScreen,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('error path')),
        ),
        settings: const RouteSettings(
          name: 'error',
        ),
      );
  }
}
