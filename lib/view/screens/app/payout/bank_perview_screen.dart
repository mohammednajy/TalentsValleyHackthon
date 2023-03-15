import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/payout_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';
import 'package:talents_valley_hackthon/view/shared/custom_button_widget.dart';

import 'componat/perview_card_widget.dart';

class BankPreviewScreen extends StatelessWidget {
  const BankPreviewScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
                const Text(
                  '300.00 USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Transferred to:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const TransferredOffice(
                  officeName: 'Bank of Palestine',
                  clientName: 'Mohammed Jawad',
                  officeDetails: '0452-1064559-001-3100-000',
                  iconPath: AssetPath.bankIcon,
                ),
                CustomCardWidget(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Transfer amount',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text('\$300', style: TextStyle(fontSize: 16)),
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
                        children: const [
                          Text('You\'ll get', style: TextStyle(fontSize: 16)),
                          Text('\$300', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  '- Estimated arrival: 2 business days.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '- Transfers made after 9:00 PM or on weekends takes longer.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
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
              isLoading: false,
              onPressed: () {
                AppRouter.goAndRemove(ScreenName.payoutScreen);
              },
            ),
          )
        ],
      ),
    );
  }
}
