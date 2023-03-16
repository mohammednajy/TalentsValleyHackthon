import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/payout_provider.dart';
import 'package:talents_valley_hackthon/utils/responsive.dart';

import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';
import 'package:talents_valley_hackthon/view/shared/custom_button_widget.dart';
import 'package:talents_valley_hackthon/view/shared/custom_rich_text.dart';
import 'package:talents_valley_hackthon/view/shared/otp_widget.dart';

import '../../../../../utils/constant.dart';

class OtpCashScreen extends StatefulWidget {
  const OtpCashScreen({
    required this.recipientInfo,
    super.key,
  });
  final List<dynamic> recipientInfo;
  @override
  State<OtpCashScreen> createState() => _OtpCashScreenState();
}

class _OtpCashScreenState extends State<OtpCashScreen> {
  TextEditingController firstControllerField = TextEditingController();
  TextEditingController secondControllerField = TextEditingController();
  TextEditingController thirdControllerField = TextEditingController();
  TextEditingController fourthControllerField = TextEditingController();
  TextEditingController fifthControllerField = TextEditingController();
  TextEditingController sixthControllerField = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                    String code = firstControllerField.text +
                        secondControllerField.text +
                        thirdControllerField.text +
                        fourthControllerField.text +
                        fifthControllerField.text +
                        sixthControllerField.text;
                    if (formKey.currentState!.validate()) {
                      widget.recipientInfo[3]
                          ? context.read<PayoutProvider>().editRecipient(
                              token:
                                  SharedPrefController().getUser().accessToken,
                              code: code,
                              id: context.read<PayoutProvider>().idSelected,
                              mobile: widget.recipientInfo[0],
                              idNumber: widget.recipientInfo[1],
                              name: widget.recipientInfo[2])
                          : context.read<PayoutProvider>().addRecipient(
                              token:
                                  SharedPrefController().getUser().accessToken,
                              mobile: widget.recipientInfo[0],
                              idNumber: widget.recipientInfo[1],
                              name: widget.recipientInfo[2],
                              code: code);
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
