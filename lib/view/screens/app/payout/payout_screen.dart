import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/controller/models/withdraw_model_list.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/payout_provider.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:intl/intl.dart';

import '../../../../api/apiSettings/app_exception.dart';
import '../../../../utils/helper.dart';
import '../../../../utils/responsive.dart';
import '../../../shared/custom_appbar.dart';
import '../../../shared/custom_bottom_sheet.dart';
import 'componat/payment_method.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class PayoutScreen extends StatefulWidget {
  const PayoutScreen({super.key});

  @override
  State<PayoutScreen> createState() => _PayoutScreenState();
}

class _PayoutScreenState extends State<PayoutScreen> {
  late Future<List<Withdraws>> withdrawList;

  Color statusColor(String status) {
    if (status.toLowerCase() == "sent".toLowerCase()) {
      return Colors.blue;
    } else if (status.toLowerCase() == "pending".toLowerCase()) {
      return Colors.amber;
    } else if (status.toLowerCase() == "completed".toLowerCase()) {
      return Colors.black;
    } else if (status.toLowerCase() == "cancelled".toLowerCase()) {
      return Colors.grey;
    }

    return Colors.green;
  }

  @override
  void initState() {
    super.initState();
    withdrawList = context
        .read<PayoutProvider>()
        .getWithdrawalList(token: SharedPrefController().getUser().accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Balance',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CustomCardWidget(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Balance',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColor.subtitleColor,
                                ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            '\$ ${SharedPrefController().getUser().userInfo.balance}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Colors.black,
                                ),
                          )
                        ],
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            fixedSize: const Size(140, 34),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                                side: const BorderSide(
                                  color: AppColor.borderColor,
                                ))),
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
                                  height: UI.height * 0.28,
                                  title: 'Choose Payment Method',
                                  titleColor: Colors.black54,
                                  closable: true,
                                  options: [
                                    PaymentMethodTile(
                                      iconPath: AssetPath.bankIcon,
                                      paymentMethod: 'Bank',
                                      onTap: () {
                                        AppRouter.goTo(ScreenName
                                            .bankWithdrawAmountScreen);
                                      },
                                    ),
                                    PaymentMethodTile(
                                      iconPath: AssetPath.cashIcon,
                                      paymentMethod: 'cash',
                                      onTap: () {
                                        print('cash');
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ]);
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.file_download_outlined,
                          color: Colors.blue,
                        ),
                        label: const Text(
                          'Withdraw',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                FutureBuilder<List<Withdraws>>(
                    future: withdrawList,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SkeletonLoaderWidget();
                      } else if (snapshot.hasError) {
                        if (snapshot.error.runtimeType == DioError) {
                          final errorMessage = DioExceptions.fromDioError(
                              snapshot.error as DioError);
                          return UtilsConfig.showSnackBarMessage(
                              message: errorMessage, status: false);
                        }
                      } else if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          return const Text(
                            'NO Posts',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          );
                        }

                        List<Withdraws> postsList = snapshot.data!;
                        return CustomCardWidget(
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                postsList[index]
                                                        .bank
                                                        ?.accountName ??
                                                    postsList[index]
                                                        .office
                                                        ?.name ??
                                                    '',
                                                style: const TextStyle(
                                                    fontSize: 15),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      postsList[index]
                                                              .bank
                                                              ?.bankName ??
                                                          postsList[index]
                                                              .office
                                                              ?.address ??
                                                          '',
                                                      style: const TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      '${DateFormat.MMMd().format(
                                                        DateTime.parse(
                                                          postsList[index]
                                                              .createdAt!,
                                                        ),
                                                      )}, ${DateFormat.jm().format(
                                                        DateTime.parse(
                                                          postsList[index]
                                                              .createdAt!,
                                                        ),
                                                      )}',
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '\$${postsList[index].amount}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '${postsList[index].status}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  decoration: postsList[index]
                                                              .status!
                                                              .toLowerCase() ==
                                                          "cancelled"
                                                              .toLowerCase()
                                                      ? TextDecoration
                                                          .lineThrough
                                                      : null,
                                                  color: statusColor(
                                                      postsList[index].status!),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                separatorBuilder: (context, index) =>
                                    const Divider(
                                      height: 30,
                                      thickness: 1,
                                    ),
                                itemCount: postsList.length));
                      }
                      return const Text('Something wrong');
                    })
              ],
            )),
      ),
    );
  }

  SkeletonLoader SkeletonLoaderWidget() {
    return SkeletonLoader(
      builder: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 10,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 12,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      items: 10,
      period: const Duration(seconds: 2),
      highlightColor: Colors.white,
      direction: SkeletonDirection.ltr,
    );
  }
}

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    Key? key,
    required this.child,
    this.verticalPadding = 18,
    this.horizontalPadding = 16,
  }) : super(key: key);
  final Widget child;
  final double verticalPadding;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side: const BorderSide(
            color: AppColor.borderColor,
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: child,
      ),
    );
  }
}
