import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/controller/models/recipient_model.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/payout_provider.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/payout_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';

import '../../../../../utils/helper.dart';
import '../../../../shared/custom_button_widget.dart';

class RecipientScreen extends StatefulWidget {
  const RecipientScreen({super.key});

  @override
  State<RecipientScreen> createState() => _RecipientScreenState();
}

class _RecipientScreenState extends State<RecipientScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Recipients',
        backButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
        child: Consumer<PayoutProvider>(
          builder: (context, payoutProvider, child) => Column(
            children: [
              payoutProvider.loading
                  ? SkeletonLoaderWidget()
                  : payoutProvider.recipientList.isEmpty
                      ? const Text('NO recipient items')
                      : Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: payoutProvider.recipientList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: RecipientItemWidget(
                                recipient: payoutProvider.recipientList[index],
                                index: index,
                                selectedIndex: selectedIndex,
                              ),
                            ),
                          ),
                        ),
              CustomButtonWidget(
                text: 'Select',
                isLoading: false,
                onPressed: () {
                  AppRouter.back(
                      object: payoutProvider.recipientList[selectedIndex]);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  AppRouter.goTo(ScreenName.addRecipientScreen);
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: const BorderSide(
                        width: 2,
                        color: AppColor.borderColor,
                      ),
                    ),
                    minimumSize: const Size(double.infinity, 44)),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RecipientItemWidget extends StatelessWidget {
  const RecipientItemWidget({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.recipient,
  }) : super(key: key);
  final int index;
  final int selectedIndex;
  final RecipientModel recipient;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color:
                  index == selectedIndex ? Colors.blue : AppColor.borderColor,
            ),
            borderRadius: BorderRadius.circular(7)),
        margin: const EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              bool? value = await UtilsConfig.showAlertDialog(
                                message:
                                    'Are you sure you want to delete your recipients account?',
                              );
                              if (value == true) {
                                context.read<PayoutProvider>().deleteRecipient(
                                      token: SharedPrefController()
                                          .getUser()
                                          .accessToken,
                                      recipientModel: recipient,
                                    );
                              }
                            },
                            icon: const Icon(
                              Icons.delete,
                              size: 20,
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              context
                                  .read<PayoutProvider>()
                                  .setIndex(recipient.sId);
                              AppRouter.goTo(ScreenName.addRecipientScreen,
                                  object: recipient);
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 20,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'ID: ${recipient.idNumber}',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.grey,
                        ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    recipient.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Phone: ${recipient.mobile}',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.grey, fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
