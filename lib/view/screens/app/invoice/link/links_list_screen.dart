import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';

import '../../../../../controller/localData/shared_perf.dart';
import '../../../../../controller/provider/invoiceProvider/invoice_provider.dart';
import '../../../../shared/custom_bottom_sheet.dart';
import '../../payout/bank/payout_screen.dart';

enum filter { active }

class LinkListScreen extends StatefulWidget {
  const LinkListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LinkListScreen> createState() => _LinkListScreenState();
}

class _LinkListScreenState extends State<LinkListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<InvoiceProvider>().getLinkList(
            token: SharedPrefController().getUser().accessToken,
          );
    });
  }

  Color statusColor(String status) {
    if (status.toLowerCase() == "active".toLowerCase() ||
        status.toLowerCase() == "archived".toLowerCase()) {
      return Colors.blue;
    } else if (status.toLowerCase() == "pending_approval".toLowerCase()) {
      return Colors.amber;
    } else if (status.toLowerCase() == "cancelled".toLowerCase() ||
        status.toLowerCase() == "rejected".toLowerCase()) {
      return Colors.grey;
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
              context.read<InvoiceProvider>().getLinkList(
                    search: value,
                    token: SharedPrefController().getUser().accessToken,
                  );
            },
            // onFieldSubmitted: (value) {
            //   context.read<InvoiceProvider>().getLinkList(
            //         search: value,
            //         token: SharedPrefController().getUser().accessToken,
            //       );
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
                              options: linkFilter
                                  .map((value) => InkWell(
                                        onTap: () {
                                          value.split(" ")[0].toLowerCase() ==
                                                  "all"
                                              ? context
                                                  .read<InvoiceProvider>()
                                                  .getLinkList(
                                                    token:
                                                        SharedPrefController()
                                                            .getUser()
                                                            .accessToken,
                                                  )
                                              : context
                                                  .read<InvoiceProvider>()
                                                  .getLinkList(
                                                    filter: value
                                                        .split(" ")[0]
                                                        .toLowerCase(),
                                                    token:
                                                        SharedPrefController()
                                                            .getUser()
                                                            .accessToken,
                                                  );
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
                : invoiceProvider.links.isEmpty
                    ? const Text('There is no links')
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
                                                            .links[index]
                                                            .fixedList
                                                            .isEmpty
                                                        ? 'no fixed'
                                                        : invoiceProvider
                                                                    .links[
                                                                        index]
                                                                    .fixedList
                                                                    .length ==
                                                                1
                                                            ? invoiceProvider
                                                                .links[index]
                                                                .fixedList[0]
                                                                .itemName
                                                            : invoiceProvider
                                                                        .links[
                                                                            index]
                                                                        .fixedList
                                                                        .length ==
                                                                    2
                                                                ? '${invoiceProvider.links[index].fixedList[0].itemName} + ${invoiceProvider.links[index].fixedList[1].itemName}'
                                                                : '${invoiceProvider.links[index].fixedList[0].itemName} + other'),
                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    Text(
                                                      '${DateFormat.MMMd().format(
                                                        DateTime.parse(
                                                          invoiceProvider
                                                              .links[index]
                                                              .createdAt,
                                                        ),
                                                      )}, ${DateFormat.jm().format(
                                                        DateTime.parse(
                                                          invoiceProvider
                                                              .links[index]
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
                                                      '${invoiceProvider.links[index].subTotal} ${invoiceProvider.links[index].currency}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    Text(
                                                      invoiceProvider
                                                              .links[index]
                                                              .status
                                                              .contains('_')
                                                          ? invoiceProvider
                                                              .links[index]
                                                              .status
                                                              .replaceAll(
                                                                  '_', " ")
                                                          : invoiceProvider
                                                              .links[index]
                                                              .status,
                                                      style: TextStyle(
                                                        color: statusColor(
                                                          invoiceProvider
                                                              .links[index]
                                                              .status
                                                              .toLowerCase(),
                                                        ),
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
                                  itemCount: invoiceProvider.links.length)),
                        ),
                      ),
          )
        ],
      ),
    );
  }

  List<String> linkFilter = [
    "All Links",
    "Active Links",
    "Inactive Links",
    "Pending Links"
  ];
}
