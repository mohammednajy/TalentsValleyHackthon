import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/utils/validation.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/bank_withdrow_amount_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';

import '../../../../../controller/localData/shared_perf.dart';
import '../../../../../controller/provider/payoutProvider/payout_provider.dart';
import '../../../../router/router_name.dart';

class AmountCashScreen extends StatefulWidget {
  const AmountCashScreen({super.key});

  @override
  State<AmountCashScreen> createState() => _AmountCashScreenState();
}

class _AmountCashScreenState extends State<AmountCashScreen> {
  TextEditingController amountController = TextEditingController();
  GlobalKey<FormFieldState> filedKey = GlobalKey<FormFieldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cash Withdraw',
        backButton: true,
      ),
      body: AmountCustomWidget(
          filedKey: filedKey,
          amountController: amountController,
          validator: (value) {
            return value!.isValidAmountWithoutCents;
          },
          onPressed: () {
            if (filedKey.currentState!.validate()) {
              context.read<PayoutProvider>().getRecipientList(
                    token: SharedPrefController().getUser().accessToken,
                  );
              
              AppRouter.goTo(ScreenName.selectAddRecipientCashScreen,
                  object: amountController.text);
            }
          }),
    );
  }
}
