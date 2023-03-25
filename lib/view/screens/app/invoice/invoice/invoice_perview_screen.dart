import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/controller/models/create_invoice_model.dart';
import 'package:talents_valley_hackthon/controller/provider/invoiceProvider/invoice_provider.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/payout_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';
import 'package:talents_valley_hackthon/view/shared/custom_button_widget.dart';
import '../../../../../utils/constant.dart';

class PreviewInvoiceScreen extends StatefulWidget {
  const PreviewInvoiceScreen({required this.createInvoiceModel, Key? key})
      : super(key: key);
  final CreateInvoiceModel createInvoiceModel;

  @override
  State<PreviewInvoiceScreen> createState() => _PreviewInvoiceScreenState();
}

class _PreviewInvoiceScreenState extends State<PreviewInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMEd().format(now);

    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Preview Invoice',
          backButton: true,
        ),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            shrinkWrap: true,
            children: [
              CustomCardWidget(
                bottomPadding: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Text(
                                'Invoice',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '#INV-003',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                        Image.asset(
                          AssetPath.logoIcon,
                          height: 12,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'From',
                              style: TextStyle(
                                  fontSize: 11, color: AppColor.subtitleColor),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              'Talents Valley LLC',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '30 North Gould St.\n Sheridan, Wyoming 82801 \n United States \n +1 307-217-6666',
                              style: TextStyle(
                                  fontSize: 11, color: AppColor.subtitleColor),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bill To',
                              style: TextStyle(
                                  fontSize: 11, color: AppColor.subtitleColor),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Text(
                              widget.createInvoiceModel.clientName,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.createInvoiceModel.clientEmail,
                              style: const TextStyle(
                                  fontSize: 11, color: AppColor.subtitleColor),
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            const Text(
                              'Issue Date',
                              style: TextStyle(
                                  fontSize: 11, color: AppColor.subtitleColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Service',
                          style: TextStyle(
                              fontSize: 11, color: AppColor.subtitleColor),
                        ),
                        Text(
                          'Amount',
                          style: TextStyle(
                              fontSize: 11, color: AppColor.subtitleColor),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Column(
                      children: widget.createInvoiceModel.fixedList
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e.itemName,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '\$ ${e.price}',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                    widget.createInvoiceModel.fixedList.length > 1
                        ? const SizedBox()
                        : const SizedBox(
                            height: 7,
                          ),
                    widget.createInvoiceModel.fixedList.length > 1
                        ? const SizedBox()
                        : Text(
                            widget.createInvoiceModel.fixedList[0].description,
                            style: const TextStyle(
                                fontSize: 12, color: AppColor.subtitleColor),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Sub Total',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColor.subtitleColor),
                                ),
                                const SizedBox(
                                  width: 43,
                                ),
                                Text(
                                  '\$ ${sumOfServicesPrice()}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColor.subtitleColor),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Fees',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColor.subtitleColor),
                                ),
                                SizedBox(
                                  width: 67,
                                ),
                                Text(
                                  '\$..',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColor.subtitleColor),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: AppColor.borderColor,
                              height: 1,
                              width: 118,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.subtitleColor),
                                ),
                                const SizedBox(
                                  width: 60,
                                ),
                                Text(
                                  '\$ ${sumOfServicesPrice()}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: CustomButtonWidget(
                  isLoading: context.watch<InvoiceProvider>().loading,
                  onPressed: () {
                    context.read<InvoiceProvider>().createInvoice(
                          token: SharedPrefController().getUser().accessToken,
                          data: widget.createInvoiceModel.toJson(),
                        );
                  },
                  text: 'Send Invoice',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    AppRouter.back();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: const BorderSide(
                          color: AppColor.borderColor,
                        ),
                      ),
                      minimumSize: const Size(double.infinity, 44)),
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
              )
            ]));
  }

  double sumOfServicesPrice() {
    double sum = 0;
    widget.createInvoiceModel.fixedList.forEach((element) {
      sum += element.price;
    });

    return sum;
  }
}
