import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/controller/provider/invoiceProvider/invoice_provider.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/payout_screen.dart';

import '../../../../../utils/constant.dart';
import '../../../../../utils/helper.dart';
import '../../../../shared/custom_bottom_sheet.dart';

class InvoiceListScreen extends StatefulWidget {
  const InvoiceListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<InvoiceListScreen> createState() => _InvoiceListScreenState();
}

class _InvoiceListScreenState extends State<InvoiceListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<InvoiceProvider>().getInvoicesList(
            token: SharedPrefController().getUser().accessToken,
          );
    });
  }

  String bottomSheetIcon(String status) {
    if (status == "pending_approval") {
      return AssetPath.pendingIcon;
    } else if (status == "cancelled") {
      return AssetPath.canceledIcon;
    } else if (status == "sent") {
      return AssetPath.sentIcon;
    }
    return AssetPath.cashIcon;
  }

  Color statusColor(String status) {
    if (status.toLowerCase() == "sent".toLowerCase()) {
      return Colors.blue;
    } else if (status.toLowerCase() == "pending_approval".toLowerCase()) {
      return AppColor.pendingColor;
    } else if (status.toLowerCase() == "cancelled".toLowerCase()) {
      return Colors.grey;
    } else if (status.toLowerCase() == "paid".toLowerCase()) {
      return Colors.green;
    }

    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              context.read<InvoiceProvider>().getInvoicesList(
                  token: SharedPrefController().getUser().accessToken,
                  search: value);
            },

            // onFieldSubmitted: (value) {
            //   context.read<InvoiceProvider>().getInvoicesList(
            //       token: SharedPrefController().getUser().accessToken,
            //       search: value);
            // },
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Color(0xFFBEC2C6),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Color(0xFFBEC2C6),
                  ),
                ),
                hintText: 'Search',
                prefixIcon: const Icon(
                  Icons.search,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                        context: context,
                        builder: (BuildContext context) {
                          return CustomBottomSheet(
                              height: 190,
                              title: 'Filter',
                              titleColor: Colors.black54,
                              closable: true,
                              options: invoiceFilter
                                  .map((value) => InkWell(
                                        onTap: () {
                                          value.split(" ")[0].toLowerCase() ==
                                                  "all"
                                              ? context
                                                  .read<InvoiceProvider>()
                                                  .getInvoicesList(
                                                    token:
                                                        SharedPrefController()
                                                            .getUser()
                                                            .accessToken,
                                                  )
                                              : context
                                                  .read<InvoiceProvider>()
                                                  .getInvoicesList(
                                                      token:
                                                          SharedPrefController()
                                                              .getUser()
                                                              .accessToken,
                                                      filter: value
                                                          .split(" ")[0]
                                                          .toLowerCase());
                                          print(value
                                              .split(" ")[0]
                                              .toLowerCase());
                                          AppRouter.back();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(value,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                const SizedBox()
                                              ]),
                                        ),
                                      ))
                                  .toList());
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.tune,
                    ))),
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<InvoiceProvider>(
            builder: (context, invoiceProvider, child) => invoiceProvider
                    .loading
                ? SkeletonLoaderWidget()
                : invoiceProvider.invoices.isEmpty
                    ? const Text('There is no invoice')
                    : Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: CustomCardWidget(
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          print(invoiceProvider
                                              .invoices[index].status);

                                          showModalBottomSheet<void>(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: Radius.circular(25),
                                            )),
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SizedBox(
                                                height: 300,
                                                child: ListView(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 25,
                                                  ),
                                                  children: [
                                                    ListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      leading: Image.asset(
                                                        bottomSheetIcon(
                                                            invoiceProvider
                                                                .invoices[index]
                                                                .status),
                                                        height: 34,
                                                      ),
                                                      title: Text(
                                                          invoiceProvider
                                                                  .invoices[
                                                                      index]
                                                                  .status
                                                                  .contains('_')
                                                              ? invoiceProvider
                                                                  .invoices[
                                                                      index]
                                                                  .status
                                                                  .replaceAll(
                                                                      '_', " ")
                                                              : invoiceProvider
                                                                  .invoices[
                                                                      index]
                                                                  .status,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: statusColor(
                                                                  invoiceProvider
                                                                      .invoices[
                                                                          index]
                                                                      .status
                                                                      .toLowerCase()))),
                                                      subtitle: const Text(
                                                        'Estimate.: 24 Hours',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: AppColor
                                                                .subtitleColor),
                                                      ),
                                                      trailing: Text(
                                                        DateFormat.yMMMEd().format(
                                                            DateTime.parse(
                                                                invoiceProvider
                                                                    .invoices[
                                                                        index]
                                                                    .createdAt)),
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: AppColor
                                                                .subtitleColor),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              invoiceProvider
                                                                  .invoices[
                                                                      index]
                                                                  .fixedList[0]
                                                                  .itemName,
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          16),
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                                invoiceProvider
                                                                    .invoices[
                                                                        index]
                                                                    .fixedList[
                                                                        0]
                                                                    .description,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: AppColor
                                                                        .subtitleColor))
                                                          ],
                                                        ),
                                                        Text(
                                                          '${invoiceProvider.invoices[index].currency} ${invoiceProvider.invoices[index].fixedList[0].price}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 16,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: const [
                                                            Text('Sub Total',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    color: AppColor
                                                                        .subtitleColor)),
                                                            Text('Fees',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    color: AppColor
                                                                        .subtitleColor)),
                                                            Text(
                                                              'Total',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 60,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${invoiceProvider.invoices[index].currency} ${invoiceProvider.invoices[index].subTotal} ',
                                                              style: const TextStyle(
                                                                  fontSize: 11,
                                                                  color: AppColor
                                                                      .subtitleColor),
                                                            ),
                                                            Text(
                                                              '${invoiceProvider.invoices[index].currency}..',
                                                              style: const TextStyle(
                                                                  fontSize: 11,
                                                                  color: AppColor
                                                                      .subtitleColor),
                                                            ),
                                                            Text(
                                                              '${invoiceProvider.invoices[index].currency} ${invoiceProvider.invoices[index].subTotal}',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 50,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            if (invoiceProvider
                                                                    .invoices[
                                                                        index]
                                                                    .status ==
                                                                "pending_approval") {
                                                              AppRouter.goTo(
                                                                  ScreenName
                                                                      .pendingInvoiceScreen);
                                                            } else if (invoiceProvider
                                                                    .invoices[
                                                                        index]
                                                                    .status ==
                                                                "cancelled") {
                                                              AppRouter.goTo(
                                                                  ScreenName
                                                                      .canceledInvoiceScreen);
                                                            } else if (invoiceProvider
                                                                        .invoices[
                                                                            index]
                                                                        .status ==
                                                                    "sent" ||
                                                                invoiceProvider
                                                                        .invoices[
                                                                            index]
                                                                        .status ==
                                                                    "unpaid") {
                                                              AppRouter.goTo(
                                                                  ScreenName
                                                                      .sentInvoiceScreen);
                                                            } else if (invoiceProvider
                                                                    .invoices[
                                                                        index]
                                                                    .status ==
                                                                "disapproved") {
                                                              AppRouter.goTo(
                                                                  ScreenName
                                                                      .disapprovedInvoiceScreen);
                                                            }
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  primary: Colors
                                                                      .white,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(7),
                                                                    side:
                                                                        const BorderSide(
                                                                      color: AppColor
                                                                          .borderColor,
                                                                    ),
                                                                  ),
                                                                  minimumSize:
                                                                      const Size(
                                                                          162,
                                                                          44)),
                                                          child: const Text(
                                                            'Show more',
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            AppRouter.goTo(
                                                              ScreenName
                                                                  .createInvoiceScreen,
                                                              object: invoiceProvider
                                                                      .invoices[
                                                                  index],
                                                            );
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  primary: Colors
                                                                      .white,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(7),
                                                                    side:
                                                                        const BorderSide(
                                                                      color: AppColor
                                                                          .borderColor,
                                                                    ),
                                                                  ),
                                                                  minimumSize:
                                                                      const Size(
                                                                          162,
                                                                          44)),
                                                          child: const Text(
                                                            'Edit',
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(invoiceProvider
                                                            .invoices[index]
                                                            .fixedList
                                                            .isEmpty
                                                        ? ''
                                                        : invoiceProvider
                                                                    .invoices[
                                                                        index]
                                                                    .fixedList
                                                                    .length ==
                                                                1
                                                            ? invoiceProvider
                                                                .invoices[index]
                                                                .fixedList[0]
                                                                .itemName
                                                            : invoiceProvider
                                                                        .invoices[
                                                                            index]
                                                                        .fixedList
                                                                        .length ==
                                                                    2
                                                                ? '${invoiceProvider.invoices[index].fixedList[0].itemName} + ${invoiceProvider.invoices[index].fixedList[1].itemName}'
                                                                : '${invoiceProvider.invoices[index].fixedList[0].itemName} + other'),
                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    Text(
                                                      ' ${SharedPrefController().getUser().userInfo.id == invoiceProvider.invoices[index].id ? invoiceProvider.invoices[index].clientName : invoiceProvider.invoices[index].freelancerName}  ${DateFormat.MMMd().format(
                                                        DateTime.parse(
                                                          invoiceProvider
                                                              .invoices[index]
                                                              .createdAt,
                                                        ),
                                                      )}, ${DateFormat.jm().format(
                                                        DateTime.parse(
                                                          invoiceProvider
                                                              .invoices[index]
                                                              .createdAt,
                                                        ),
                                                      )}',
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      '${invoiceProvider.invoices[index].subTotal} ${invoiceProvider.invoices[index].currency}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    FittedBox(
                                                      child: Text(
                                                        invoiceProvider
                                                                .invoices[index]
                                                                .status
                                                                .contains('_')
                                                            ? invoiceProvider
                                                                .invoices[index]
                                                                .status
                                                                .replaceAll(
                                                                    '_', " ")
                                                            : invoiceProvider
                                                                .invoices[index]
                                                                .status,
                                                        style: TextStyle(
                                                            color: statusColor(
                                                                invoiceProvider
                                                                    .invoices[
                                                                        index]
                                                                    .status
                                                                    .toLowerCase())),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ]),
                                      ),
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                        thickness: 1.5,
                                        height: 30,
                                      ),
                                  itemCount: invoiceProvider.invoices.length)),
                        ),
                      ),
          )
        ],
      ),
    );
  }
}

List invoiceFilter = [
  "All Invoices",
  "Pending Invoices",
  "Paid Invoices",
  "Sent Invoices",
];
