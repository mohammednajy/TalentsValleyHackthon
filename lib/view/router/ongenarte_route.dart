import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/controller/models/create_invoice_model.dart';
import 'package:talents_valley_hackthon/controller/models/invoice_model.dart';
import 'package:talents_valley_hackthon/controller/models/recipient_model.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/payout_provider.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:talents_valley_hackthon/view/screens/app/invoice/link/create_link_screen.dart';
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

import '../screens/app/home_app_screen.dart';
import '../screens/app/invoice/invoice/canceled_invoice_screen.dart';
import '../screens/app/invoice/invoice/create_invoice_screen.dart';
import '../screens/app/invoice/invoice/disapproved_invoice_screen.dart';
import '../screens/app/invoice/invoice/invoice_perview_screen.dart';
import '../screens/app/invoice/invoice/pending_invoice_screen.dart';
import '../screens/app/invoice/invoice/sent_invoice_screen.dart';
import '../screens/app/invoice/link/active_link_screen.dart';
import '../screens/app/invoice/link/disapproved_link_screen.dart';
import '../screens/app/invoice/link/inactive_link_screen.dart';
import '../screens/app/invoice/link/link_perview_screen.dart';
import '../screens/app/invoice/link/pending_link_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  dynamic result;
  switch (settings.name) {
    case ScreenName.homeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeAppScreen(),
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
    case ScreenName.createInvoiceScreen:
      return MaterialPageRoute(
          builder: (context) => CreateInvoiceScreen(
              invoiceModel: settings.arguments as InvoiceModel?),
          settings: const RouteSettings(
            name: ScreenName.createInvoiceScreen,
          ));
    case ScreenName.invoicePreviewScreen:
      return MaterialPageRoute(
          builder: (context) => PreviewInvoiceScreen(
                createInvoiceModel: settings.arguments as CreateInvoiceModel,
              ),
          settings: const RouteSettings(
            name: ScreenName.invoicePreviewScreen,
          ));
    case ScreenName.previewLinkScreen:
      return MaterialPageRoute(
          builder: (context) => PreviewLinkScreen(
                createLinkModel: settings.arguments as CreateLinkModel,
              ),
          settings: const RouteSettings(
            name: ScreenName.previewLinkScreen,
          ));
    case ScreenName.pendingInvoiceScreen:
      return MaterialPageRoute(
          builder: (context) => const PendingInvoiceScreen(),
          settings: const RouteSettings(
            name: ScreenName.pendingInvoiceScreen,
          ));
    case ScreenName.canceledInvoiceScreen:
      return MaterialPageRoute(
          builder: (context) => const CanceledInvoiceScreen(),
          settings: const RouteSettings(
            name: ScreenName.canceledInvoiceScreen,
          ));
    case ScreenName.disapprovedInvoiceScreen:
      return MaterialPageRoute(
          builder: (context) => const DisapprovedInvoiceScreen(),
          settings: const RouteSettings(
            name: ScreenName.disapprovedInvoiceScreen,
          ));
    case ScreenName.pendingLinkScreen:
      return MaterialPageRoute(
          builder: (context) => const PendingLinkScreen(),
          settings: const RouteSettings(
            name: ScreenName.pendingLinkScreen,
          ));
    case ScreenName.disapprovedLinkScreen:
      return MaterialPageRoute(
          builder: (context) => const DisapprovedLinkScreen(),
          settings: const RouteSettings(
            name: ScreenName.disapprovedLinkScreen,
          ));
    case ScreenName.sentInvoiceScreen:
      return MaterialPageRoute(
          builder: (context) => const SentInvoiceScreen(),
          settings: const RouteSettings(
            name: ScreenName.sentInvoiceScreen,
          ));
    case ScreenName.inactiveLinkScreen:
      return MaterialPageRoute(
          builder: (context) => const InactiveLinkScreen(),
          settings: const RouteSettings(
            name: ScreenName.inactiveLinkScreen,
          ));
    case ScreenName.activeLinkScreen:
      return MaterialPageRoute(
          builder: (context) => const ActiveLinkScreen(),
          settings: const RouteSettings(
            name: ScreenName.activeLinkScreen,
          ));
    case ScreenName.createLinkScreen:
      return MaterialPageRoute(
          builder: (context) => const CreateLinkScreen(),
          settings: const RouteSettings(
            name: ScreenName.createLinkScreen,
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
