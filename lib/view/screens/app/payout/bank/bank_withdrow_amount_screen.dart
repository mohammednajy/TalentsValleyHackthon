import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';
import 'package:talents_valley_hackthon/utils/responsive.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';
import 'package:talents_valley_hackthon/view/shared/custom_rich_text.dart';
import '../../../../../controller/provider/payoutProvider/payout_provider.dart';
import '../../../../../utils/validation.dart';
import '../../../../shared/custom_button_widget.dart';

class BankWithdrawAmountScreen extends StatefulWidget {
  const BankWithdrawAmountScreen({super.key});

  @override
  State<BankWithdrawAmountScreen> createState() =>
      _BankWithdrawAmountScreenState();
}

class _BankWithdrawAmountScreenState extends State<BankWithdrawAmountScreen> {
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
        title: 'Bank Withdraw',
        backButton: true,
      ),
      body: AmountCustomWidget(
          filedKey: filedKey,
          amountController: amountController,
          validator: (value) {
            return value!.isValidAmount;
          },
          onPressed: () {
            if (filedKey.currentState!.validate()) {
              context.read<PayoutProvider>().getBankList(
                  token: SharedPrefController().getUser().accessToken);
              AppRouter.goTo(
                ScreenName.selectAddBankScreen,
                object: amountController.text,
              );
            }
          }),
    );
  }
}

class AmountCustomWidget extends StatefulWidget {
  const AmountCustomWidget({
    super.key,
    required this.filedKey,
    required this.amountController,
    required this.onPressed,
    this.validator,
  });
  final GlobalKey<FormFieldState> filedKey;
  final TextEditingController amountController;
  final void Function()? onPressed;
  final String? Function(String?)? validator;
  @override
  State<AmountCustomWidget> createState() => _AmountCustomWidgetState();
}

class _AmountCustomWidgetState extends State<AmountCustomWidget> {
  String balance = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            padding: const EdgeInsets.only(left: 55, right: 90),
            child: TextFormField(
              // autofocus: true,
              key: widget.filedKey,
              controller: widget.amountController,

              textAlign: TextAlign.right,
              validator: widget.validator,
              // textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.black, fontSize: 38),
              keyboardType: TextInputType.number,

              decoration: const InputDecoration(
                hintText: '300.00',
                fillColor: Colors.transparent,
                hintStyle: TextStyle(fontSize: 35),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Icon(
                    Icons.attach_money,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                filled: true,
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
              balance =
                  SharedPrefController().getUser().userInfo.balance.toString();

              widget.amountController.text = balance;
            },
          ),
          const Spacer(),
          CustomButtonWidget(
            text: 'Continue',
            onPressed: widget.onPressed,
            isLoading: false,
          )
        ],
      ),
    );
  }
}
