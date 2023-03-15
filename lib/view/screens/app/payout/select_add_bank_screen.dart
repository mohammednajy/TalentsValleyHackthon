import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/controller/models/bank_model.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/payout_provider.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';
import 'package:talents_valley_hackthon/utils/helper.dart';
import 'package:talents_valley_hackthon/utils/responsive.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/payout_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:talents_valley_hackthon/view/shared/custom_button_widget.dart';

import '../../../../api/apiSettings/app_exception.dart';

class SelectAddBankScreen extends StatefulWidget {
  const SelectAddBankScreen({super.key});

  @override
  State<SelectAddBankScreen> createState() => _SelectAddBankScreenState();
}

class _SelectAddBankScreenState extends State<SelectAddBankScreen> {
  late Future<List<BankModel>> banks;
  @override
  void initState() {
    super.initState();
    banks = context
        .read<PayoutProvider>()
        .getBankList(token: SharedPrefController().getUser().accessToken);
  }

  int clickedBank = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Bank Withdraw',
        backButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: UI.height * 0.03),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            FutureBuilder<List<BankModel>>(
                future: banks,
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
                  }
                  if (snapshot.hasData) {
                    List<BankModel> banks = snapshot.data!;
                    if (banks.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: AddBankAccountCard(onTap: () {
                          AppRouter.goTo(ScreenName.addBankAccountScreen);
                        }),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: banks.length,
                        itemBuilder: (context, index) => BankInfoCardWidget(
                          clicked: clickedBank,
                          indexValue: index,
                          onTap: () {
                            setState(() {
                              clickedBank = index;
                            });
                          },
                          clientName: banks[index].bankName,
                          bankCode: '0452-1064559-001-3100-000',
                        ),
                      ),
                    );
                  }
                  return const Text('something went wrong');
                }),
            const Spacer(),
            CustomButtonWidget(
              text: 'Continue',
              isLoading: false,
              onPressed: () {
                AppRouter.goTo(ScreenName.bankPreviewScreen);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                AppRouter.goTo(ScreenName.addBankAccountScreen);
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
                'Add Account',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SkeletonLoader SkeletonLoaderWidget() {
    return SkeletonLoader(
      builder: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: <Widget>[
            const CircleAvatar(
              radius: 30,
            ),
            const SizedBox(
              height: 10,
            ),
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
      items: 5,
      period: const Duration(seconds: 2),
      highlightColor: Colors.white,
      direction: SkeletonDirection.ltr,
    );
  }
}

class BankInfoCardWidget extends StatelessWidget {
  const BankInfoCardWidget({
    Key? key,
    required this.clientName,
    required this.bankCode,
    required this.indexValue,
    required this.clicked,
    this.onTap,
  }) : super(key: key);
  final String clientName;
  final String bankCode;
  final int indexValue;
  final void Function()? onTap;
  final int clicked;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: BorderSide(
              color: clicked == indexValue ? Colors.blue : AppColor.borderColor,
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 10,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: const Color(0xFFF2F4F7),
                  child: Image.asset(AssetPath.bankIcon),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clientName,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      bankCode,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  bool? value = await UtilsConfig.showAlertDialog(
                      message:
                          'Are you sure you want to delete your bank account?');
                  print(value);
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 5, bottom: 35),
                  child: Icon(
                    Icons.close,
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

class AddBankAccountCard extends StatelessWidget {
  const AddBankAccountCard({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2.5,
        dashPattern: const [5],
        strokeCap: StrokeCap.butt,
        color: const Color(0xFFBEC2C6),
        radius: const Radius.circular(7),
        child: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: BorderSide.none,
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: const Color(0xFFF2F4F7),
                    child: Image.asset(AssetPath.bankIcon),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    'Add Bank Account',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.blue,
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
