import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/controller/models/recipient_model.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/payout_provider.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/add_bank_account_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/bank_perview_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/bank_withdrow_amount_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/otp_bank_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/payout_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/select_add_bank_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/cash/add_recipient_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/cash/amount_cash_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/cash/cash_perview_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/cash/otp_mobile_cash_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/cash/recipient_screen.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/cash/select_add_recipient_cash_screen.dart';

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
        builder: (context) =>
            SelectAddBankScreen(amount: settings.arguments as String),
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
        builder: (context) {
          return OtpBankScreen(
            bankInfo: settings.arguments as BankInfo,
          );
        },
        settings: const RouteSettings(
          name: ScreenName.otpBankScreen,
        ),
      );

    case ScreenName.bankPreviewScreen:
      return MaterialPageRoute(
        builder: (context) =>
            BankPreviewScreen(amountAndId: settings.arguments as List<String>),
        settings: const RouteSettings(
          name: ScreenName.bankPreviewScreen,
        ),
      );
    // ignore: no_duplicate_case_values
    case ScreenName.cashAmountScreen:
      return MaterialPageRoute(
          builder: (context) => const AmountCashScreen(),
          settings: const RouteSettings(
            name: ScreenName.cashAmountScreen,
          ));
    case ScreenName.selectAddRecipientCashScreen:
      return MaterialPageRoute(
          builder: (context) => SelectAddRecipientCashScreen(
                amount: settings.arguments as String,
              ),
          settings: const RouteSettings(
            name: ScreenName.selectAddRecipientCashScreen,
          ));

    case ScreenName.addRecipientScreen:
      return MaterialPageRoute(
          builder: (context) =>
              AddRecipientScreen(recipientModel: settings.arguments ?? ''),
          settings: const RouteSettings(
            name: ScreenName.addRecipientScreen,
          ));

    case ScreenName.otpCashScreen:
      return MaterialPageRoute(
          builder: (context) =>
              OtpCashScreen(recipientInfo: settings.arguments as List<dynamic>),
          settings: const RouteSettings(
            name: ScreenName.otpCashScreen,
          ));
    case ScreenName.recipientScreen:
      return MaterialPageRoute(
          builder: (context) => const RecipientScreen(),
          settings: const RouteSettings(
            name: ScreenName.recipientScreen,
          ));
    case ScreenName.cashPreviewScreen:
      return MaterialPageRoute(
          builder: (context) =>
              CashPreviewScreen(data: settings.arguments as List<String>),
          settings: const RouteSettings(
            name: ScreenName.cashPreviewScreen,
          ));
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
