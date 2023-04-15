import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/controller/provider/authProvider/authprovider.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/bnb_provider.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/payout_provider.dart';
import 'package:talents_valley_hackthon/utils/responsive.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';
import 'package:talents_valley_hackthon/view/shared/custom_button_widget.dart';
import 'package:talents_valley_hackthon/view/shared/custom_rich_text.dart';
import 'package:talents_valley_hackthon/view/shared/otp_widget.dart';

import '../../../../../utils/constant.dart';

class OtpBankScreen extends StatefulWidget {
  const OtpBankScreen({
    required this.bankInfo,
    super.key,
  });
  final BankInfo bankInfo;
  @override
  State<OtpBankScreen> createState() => _OtpBankScreenState();
}

class _OtpBankScreenState extends State<OtpBankScreen> {
  TextEditingController firstControllerField = TextEditingController();
  TextEditingController secondControllerField = TextEditingController();
  TextEditingController thirdControllerField = TextEditingController();
  TextEditingController fourthControllerField = TextEditingController();
  TextEditingController fifthControllerField = TextEditingController();
  TextEditingController sixthControllerField = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print(widget.bankInfo);
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        icon: Image.asset(
          AssetPath.logoIcon,
        ),
        backButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AssetPath.phoneIcon,
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    'We have sent you a verification code to your mobile number ……….098',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColor.subtitleColor,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
                OTPCodeWidget(
                  firstControllerField: firstControllerField,
                  secondControllerField: secondControllerField,
                  thirdControllerField: thirdControllerField,
                  fourthControllerField: fourthControllerField,
                  fifthControllerField: fifthControllerField,
                  sixthControllerField: sixthControllerField,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  '02:00',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColor.subtitleColor,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichTextCustom(
                    leftText: 'Didn\'t get the code? ',
                    rightText: 'Resend',
                    fontSize: 15,
                    onTap: () {
                      print('ddd');
                    }),
                SizedBox(
                  height: UI.height / 8,
                ),
                CustomButtonWidget(
                  text: 'Verify',
                  isLoading: context.watch<PayoutProvider>().loading,
                  onPressed: () {
                    print('ddddd00');
                    if (formKey.currentState!.validate()) {
                      String code = firstControllerField.text +
                          secondControllerField.text +
                          thirdControllerField.text +
                          fourthControllerField.text +
                          fifthControllerField.text +
                          sixthControllerField.text;
                     
                      context.read<PayoutProvider>().addBankAccount(
                            token: SharedPrefController().getUser().accessToken,
                            accountName: widget.bankInfo.accountName,
                            accountNumber: widget.bankInfo.accountName,
                            bankBranch: widget.bankInfo.bankBranch,
                            ledger: widget.bankInfo.ledger,
                            code: code,
                          );
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
