import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/controller/models/office_model.dart';
import 'package:talents_valley_hackthon/controller/models/recipient_model.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/payout_provider.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/payout_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';

import '../../../../shared/custom_bottom_sheet.dart';
import '../../../../shared/custom_button_widget.dart';

class SelectAddRecipientCashScreen extends StatefulWidget {
  const SelectAddRecipientCashScreen({super.key, required this.amount});
  final String amount;
  @override
  State<SelectAddRecipientCashScreen> createState() =>
      _SelectAddRecipientCashScreenState();
}

class _SelectAddRecipientCashScreenState
    extends State<SelectAddRecipientCashScreen> {
  OfficeModel? officeInfo;
  RecipientModel? selectedRecipient;
  bool error = false;
  @override
  void initState() {
    super.initState();
    officeInfo = context.read<PayoutProvider>().office[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cash',
        backButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 21,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Office',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
                    context: context,
                    builder: (BuildContext context) {
                      return Consumer<PayoutProvider>(
                        builder: (context, providerValue, child) =>
                            CustomBottomSheet(
                                height: 600,
                                title: 'Offices',
                                titleColor: Colors.black54,
                                closable: true,
                                options: [
                              providerValue.office.isEmpty
                                  ? const Text('there is no office ')
                                  : ListView.separated(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          setState(() {
                                            officeInfo =
                                                providerValue.office[index];
                                          });
                                          AppRouter.back();
                                        },
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    providerValue.office[index]
                                                            .startingHour +
                                                        providerValue
                                                            .office[index]
                                                            .endingHour,
                                                    style: const TextStyle(
                                                      fontSize: 11,
                                                      color: AppColor
                                                          .subtitleColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    providerValue
                                                        .office[index].fees
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: AppColor
                                                          .subtitleColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    providerValue
                                                        .office[index].name,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    providerValue
                                                        .office[index].address,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: AppColor
                                                          .subtitleColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      separatorBuilder: (context, index) =>
                                          const Divider(
                                        thickness: 1.5,
                                        height: 15,
                                      ),
                                      itemCount: providerValue.office.length > 5
                                          ? 5
                                          : providerValue.office.length,
                                    )
                            ]),
                      );
                    },
                  );
                },
                child: CustomCardWidget(
                    bottomPadding: 40,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ' ${officeInfo?.startingHour}??'
                                ' + ${officeInfo?.endingHour} ??'
                                '',
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: AppColor.subtitleColor,
                                ),
                              ),
                              Text(
                                officeInfo?.fees.toString() ?? '',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColor.subtitleColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                officeInfo?.name ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                officeInfo?.address ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColor.subtitleColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.expand_more,
                              size: 25,
                            ))
                      ],
                    )),
              ),
              Text(
                'Recipient',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
                    context: context,
                    builder: (BuildContext context) {
                      return CustomBottomSheet(
                          height: 280,
                          title: 'Recipients',
                          titleColor: Colors.black54,
                          closable: true,
                          options: [
                            Consumer<PayoutProvider>(
                              builder: (context, valueProvider, child) =>
                                  valueProvider.recipientList.isEmpty ||
                                          valueProvider.recipientList.length < 3
                                      ? const Text(
                                          'There is no recipient or less than three, try add new recipient',
                                        )
                                      : ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) =>
                                              InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedRecipient =
                                                    valueProvider
                                                        .recipientList[index];
                                              });
                                              AppRouter.back();
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                    'ID: ${valueProvider.recipientList[index].idNumber}'),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      valueProvider
                                                          .recipientList[index]
                                                          .name,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                        'Phone: ${valueProvider.recipientList[index].mobile}'),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          itemCount: 3,
                                          separatorBuilder: (context, index) =>
                                              const Divider(
                                            thickness: 1.5,
                                            height: 25,
                                          ),
                                        ),
                            )
                          ]);
                    },
                  );
                },
                child: CustomCardWidget(
                    bottomPadding: 0,
                    child: Row(
                      children: [
                        selectedRecipient != null
                            ? Expanded(
                                flex: 6,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        'ID: ${selectedRecipient?.idNumber ?? ''}'),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          selectedRecipient?.name ?? '',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            'Phone: ${selectedRecipient?.mobile ?? ''}'),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : const Expanded(
                                flex: 4, child: Text('Select a recipient')),
                        const Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.expand_more,
                            size: 30,
                          ),
                        )
                      ],
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () async {
                        context.read<PayoutProvider>().getRecipientList(
                              token:
                                  SharedPrefController().getUser().accessToken,
                            );
                        dynamic value =
                            await AppRouter.goTo(ScreenName.recipientScreen);
                        setState(() {
                          if (value is RecipientModel) {
                            selectedRecipient = value;
                          }
                        });
                      },
                      child: const Text('All recipient')),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      enableFeedback: false,
                      primary: Colors.transparent,
                    ),
                    onPressed: () {
                      AppRouter.goTo(ScreenName.addRecipientScreen);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.blue,
                      size: 20,
                    ),
                    label: const Text(
                      'Add recipient',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              error
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.warning,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          ' Please select a bank account.',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              CustomButtonWidget(
                text: 'Continue',
                isLoading: false,
                onPressed: () {
                  if (selectedRecipient != null && officeInfo != null) {
                    setState(() {
                      error = false;
                    });
                    AppRouter.goTo(ScreenName.cashPreviewScreen, object: [
                      widget.amount,
                      officeInfo!.sId,
                      selectedRecipient!.sId
                    ]);
                  } else {
                    setState(() {
                      error = true;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// List<OfficeInfo> officeInfoList = [
//   OfficeInfo(
//     hoursWork: 'ساعات العمل: 9 صباحا -7مساءا',
//     profit: 'بدون عمولة',
//     address: 'غزة - مكتب الدانا',
//     detailsAddress: 'الرمال _ تقاطع شارع فلسطين مع الشهداء',
//   ),
//   OfficeInfo(
//     hoursWork: 'ساعات العمل: 9 صباحا -7مساءا',
//     profit: 'بدون عمولة',
//     address: 'خانيونس - مكتب الدانا',
//     detailsAddress: 'شارع جمال عبد الناصر _ بجوار مدرسة ابن خلدون',
//   ),
//   OfficeInfo(
//     hoursWork: 'ساعات العمل: 9 صباحا -7مساءا',
//     profit: 'عمولة 5 شيكل',
//     address: 'جباليا - مكتب الدانا',
//     detailsAddress: 'شارع الترنس _ مقابل مزاج',
//   ),
//   OfficeInfo(
//     hoursWork: 'ساعات العمل: 9 صباحا -7مساءا',
//     profit: 'بدون عمولة',
//     address: 'رفح - مكتب ابن خلدون',
//     detailsAddress: 'دوار العودة _ مقابل مكتبة المنارة',
//   ),
//   OfficeInfo(
//     hoursWork: 'ساعات العمل: 9 صباحا -7مساءا',
//     profit: 'عمولة 5 شيكل',
//     address: 'النصيرات - مكتب الترك',
//     detailsAddress: 'بجانب مول أبو دلال - خلف مكتب مشتهى للسياحة',
//   ),
// ];

// class OfficeInfo {
//   final String hoursWork;
//   final String profit;
//   final String address;
//   final String detailsAddress;

//   OfficeInfo({
//     required this.hoursWork,
//     required this.profit,
//     required this.address,
//     required this.detailsAddress,
//   });
// }
