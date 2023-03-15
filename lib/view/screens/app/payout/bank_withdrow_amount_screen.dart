import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';
import 'package:talents_valley_hackthon/utils/responsive.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';
import 'package:talents_valley_hackthon/view/shared/custom_rich_text.dart';
import '../../../../utils/validation.dart';
import '../../../shared/custom_button_widget.dart';

class BankWithdrawAmountScreen extends StatefulWidget {
  const BankWithdrawAmountScreen({super.key});

  @override
  State<BankWithdrawAmountScreen> createState() =>
      _BankWithdrawAmountScreenState();
}

class _BankWithdrawAmountScreenState extends State<BankWithdrawAmountScreen> {
  String balance = '';

  TextEditingController amountController = TextEditingController();
  GlobalKey<FormFieldState> filedKey = GlobalKey<FormFieldState>();
  @override
  void initState() {
    amountController.addListener(() {
      amountController.value = TextEditingValue(text: balance);
    });
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
        title: 'Bank Withdraw',
        backButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: UI.height * .1,
            ),
            Text(
              'Amount',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: UI.width * .15, right: UI.width * .2),
              child: TextFormField(
                autofocus: true,
                key: filedKey,
                // controller: amountController,
                textAlign: TextAlign.right,
                validator: (value) {
                  return value!.isValidAmount;
                },
                // textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.black,
                    ),
                keyboardType: TextInputType.number,

                decoration: const InputDecoration(
                  hintText: '300.00',
                  // fillColor: Colors.grey,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Icon(
                      Icons.attach_money,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                  // filled: true,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichTextCustom(
              leftText: 'Available  ',
              rightText:
                  '\$ ${SharedPrefController().getUser().userInfo.balance}',
              onTap: () {
                setState(() {
                  balance = SharedPrefController()
                      .getUser()
                      .userInfo
                      .balance
                      .toString();
                  print(balance);
                });
              },
            ),
            const Spacer(),
            CustomButtonWidget(
              text: 'Continue',
              onPressed: () {
                if (filedKey.currentState!.validate()) {
                  AppRouter.goTo(ScreenName.selectAddBankScreen);
                }
              },
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}
