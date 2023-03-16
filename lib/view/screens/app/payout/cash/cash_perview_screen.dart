import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/controller/models/bank_model.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/payout_provider.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/payout_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';
import 'package:talents_valley_hackthon/view/shared/custom_button_widget.dart';

import '../../../../../api/apiSettings/app_exception.dart';
import '../../../../../utils/helper.dart';
import '../componat/perview_card_widget.dart';

class CashPreviewScreen extends StatefulWidget {
  const CashPreviewScreen({
    super.key,
    required this.data,
  });
  final List<String> data;
  @override
  State<CashPreviewScreen> createState() => _CashPreviewScreenState();
}

class _CashPreviewScreenState extends State<CashPreviewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Withdrawal Preview',
          backButton: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  Text(
                    'Amount:',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColor.subtitleColor,
                        ),
                  ),
                  Text(
                    '${widget.data[0]} USD',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'Transferred to:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const TransferredOffice(
                    officeName: 'غزة - مكتب الدانا',
                    clientName: 'dddd',
                    officeDetails: 'dddd55555',
                    iconPath: AssetPath.bankIcon,
                  ),
                  CustomCardWidget(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Recipients name',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text('mohammed naji',
                                style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Transfer amount',
                                style: TextStyle(fontSize: 16)),
                            Text('\$300', style: TextStyle(fontSize: 16))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Fee', style: TextStyle(fontSize: 16)),
                            Text('Free', style: TextStyle(fontSize: 16))
                          ],
                        ),
                        const Divider(
                          thickness: 1.5,
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('You\'ll get',
                                style: TextStyle(fontSize: 16)),
                            Text('\$300', style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '- Estimated arrival: 2 business days.',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '- Transfers made after 9:00 PM or on weekends takes longer.',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' - All transfers are subject to review and could be delayed or stopped if we identify an issue.',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
              child: CustomButtonWidget(
                text: 'Confirm',
                isLoading: context.watch<PayoutProvider>().loading,
                onPressed: () {
                  context.read<PayoutProvider>().requestCashWithdrawal(
                      token: SharedPrefController().getUser().accessToken,
                      officeId: widget.data[1],
                      recipientId: widget.data[2],
                      amount: int.parse(widget.data[0]));
                },
              ),
            )
          ],
        ));
  }
}
