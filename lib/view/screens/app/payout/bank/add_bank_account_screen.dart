// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/payout_provider.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';
import 'package:talents_valley_hackthon/utils/responsive.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';

import '../../../../../utils/validation.dart';
import '../../../../router/app_router.dart';
import '../../../../shared/custom_bottom_sheet.dart';
import '../../../../shared/custom_button_widget.dart';

class AddBankAccountScreen extends StatefulWidget {
  const AddBankAccountScreen({super.key});

  @override
  State<AddBankAccountScreen> createState() => _AddBankAccountScreenState();
}

class _AddBankAccountScreenState extends State<AddBankAccountScreen> {
  TextEditingController accountOwnerNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  String selectedBranch = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String selectedLedger = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add Bank Account',
        backButton: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FixedFieldWidget(
                    label: 'Bank',
                    content: 'Bank of Palestine',
                  ),
                  SizedBox(
                    height: UI.height * 0.02,
                  ),
                  CustomTextFieldWidget(
                    controller: accountOwnerNameController,
                    validator: (value) {
                      return value!.isValidName;
                    },
                    label: 'Account Owner Full Name',
                  ),
                  SizedBox(
                    height: UI.height * 0.02,
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
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
                            height: UI.height * 0.5,
                            title: 'Branch',
                            titleColor: Colors.black54,
                            closable: true,
                            options: branches
                                .map(
                                  (e) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedBranch = e;
                                      });
                                      AppRouter.back();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: UI.height * 0.012),
                                      child: Text(
                                        textAlign: TextAlign.start,
                                        e,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        },
                      );
                    },
                    child: FixedFieldWidget(
                      label: 'Branch',
                      content: selectedBranch,
                      backgroundColor: Colors.white,
                      contentColor: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: UI.height * 0.02,
                  ),
                  CustomTextFieldWidget(
                    controller: accountNumberController,
                    validator: (value) {
                      return value!.isValidName;
                    },
                    label: 'Account Number',
                  ),
                  SizedBox(
                    height: UI.height * 0.02,
                  ),
                  const FixedFieldWidget(
                    label: 'Currency',
                    content: '1 - USD',
                  ),
                  SizedBox(
                    height: UI.height * 0.02,
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
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
                            height: UI.height * 0.3,
                            title: 'Ledger',
                            titleColor: Colors.black54,
                            closable: true,
                            options: ledger
                                .map(
                                  (e) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedLedger = e;
                                      });
                                      AppRouter.back();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: UI.height * 0.012),
                                      child: Text(
                                        textAlign: TextAlign.start,
                                        e,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        },
                      );
                    },
                    child: FixedFieldWidget(
                      label: 'Ledger',
                      contentColor: Colors.black,
                      content: selectedLedger,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: UI.height * 0.02,
                  ),
                  CustomButtonWidget(
                    text: 'Continue',
                    isLoading: context.watch<PayoutProvider>().loading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context
                            .read<PayoutProvider>()
                            .sendVerificationCodeToAdd(
                                token: SharedPrefController()
                                    .getUser()
                                    .accessToken,
                                accountName: accountOwnerNameController.text,
                                accountNumber: accountNumberController.text,
                                bankBranch: selectedBranch,
                                ledger: selectedLedger);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
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
                      'Back',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: UI.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> branches = [
    "0446 - Naser",
    "0454 - Rimal",
    "0448 - Nussairat",
    "0451 - Main Branch",
    "0452 - Khan Younis",
    "0453 - Jabalia",
    "0454 - Rafah"
  ];

  List<String> ledger = [
    "3000 - Current  جاري",
    "3100 - Saving  توفير",
    "3102 - Saving For Every Citizen  توفير لكل مواطن",
  ];
}

class FixedFieldWidget extends StatelessWidget {
  const FixedFieldWidget({
    Key? key,
    required this.label,
    required this.content,
    this.backgroundColor = AppColor.backgroundColor,
    this.contentColor = Colors.grey,
  }) : super(key: key);
  final String label;
  final String content;
  final Color backgroundColor;
  final Color contentColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == ''
            ? const SizedBox()
            : Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColor.subtitleColor,
                ),
              ),
        label == ''
            ? const SizedBox()
            : const SizedBox(
                height: 5,
              ),
        Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: AppColor.borderColor,
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    content,
                    style: content == 'Country' || content == 'USD'
                        ? const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          )
                        : TextStyle(
                            color: contentColor,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                ),
                // ignore: prefer_const_constructors
                Icon(
                  size: 30,
                  Icons.expand_more,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    required this.label,
    this.controller,
    this.hintText,
    this.validator, this.suffixIcon,
  }) : super(key: key);
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            color: AppColor.subtitleColor,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          style: const TextStyle(fontSize: 18),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 16,
            ),
            suffixIcon: suffixIcon,
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(
                  color: AppColor.borderColor,
                )),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.borderColor,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        )
      ],
    );
  }
}
