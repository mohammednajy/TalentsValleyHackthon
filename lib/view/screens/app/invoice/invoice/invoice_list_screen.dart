import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/controller/provider/invoiceProvider/invoice_provider.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/payout_screen.dart';

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

  Color statusColor(String status) {
    if (status.toLowerCase() == "sent".toLowerCase()) {
      return Colors.blue;
    } else if (status.toLowerCase() == "pending_approval".toLowerCase()) {
      return Colors.amber;
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
                                          print(index);
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
                                                    Text(
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
