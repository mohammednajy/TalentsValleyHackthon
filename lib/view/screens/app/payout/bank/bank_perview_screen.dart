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

class BankPreviewScreen extends StatefulWidget {
  const BankPreviewScreen({
    super.key,
    required this.amountAndId,
  });
  final List<String> amountAndId;
  @override
  State<BankPreviewScreen> createState() => _BankPreviewScreenState();
}

class _BankPreviewScreenState extends State<BankPreviewScreen> {
  late Future<BankModel> bank;
  @override
  void initState() {
    super.initState();
    bank = context.read<PayoutProvider>().getBankDetails(
          token: SharedPrefController().getUser().accessToken,
          id: widget.amountAndId[1],
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Withdrawal Preview',
          backButton: true,
        ),
        body: FutureBuilder<BankModel>(
            future: bank,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SkeletonLoaderWidget();
              } else if (snapshot.hasError) {
                if (snapshot.error.runtimeType == DioError) {
                  final errorMessage =
                      DioExceptions.fromDioError(snapshot.error as DioError);
                  return UtilsConfig.showSnackBarMessage(
                      message: errorMessage, status: false);
                }
              } else if (snapshot.hasData) {
                BankModel bank = snapshot.data!;
                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Text(
                            'Amount:',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: AppColor.subtitleColor,
                                ),
                          ),
                          Text(
                            '${widget.amountAndId[0]} USD',
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
                          TransferredOffice(
                            officeName: bank.bankName,
                            clientName: bank.accountName,
                            officeDetails:
                                '${bank.ledger} - ${bank.accountNumber}',
                            iconPath: AssetPath.bankIcon,
                          ),
                          CustomCardWidget(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Transfer amount',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text('\$${widget.amountAndId[0]}',
                                        style: const TextStyle(fontSize: 16)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('You\'ll get',
                                        style: TextStyle(fontSize: 16)),
                                    Text('\$${widget.amountAndId[0]}',
                                        style: const TextStyle(fontSize: 16)),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 21, vertical: 10),
                      child: CustomButtonWidget(
                        text: 'Confirm',
                        isLoading: context.watch<PayoutProvider>().loading,
                        onPressed: () {
                          context.read<PayoutProvider>().confirmBankWithdrawal(
                              token:
                                  SharedPrefController().getUser().accessToken,
                              bankId: widget.amountAndId[1],
                              amount: double.parse(widget.amountAndId[0]));
                        },
                      ),
                    )
                  ],
                );
              }
              return const Text('something went wrong');
            }));
  }
}
