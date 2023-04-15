import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/controller/models/create_invoice_model.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';

import '../../../../../utils/constant.dart';
import '../../../../router/app_router.dart';
import '../../../../router/router_name.dart';
import '../../../../shared/custom_bottom_sheet.dart';
import '../../../../shared/custom_button_widget.dart';
import '../../payout/bank/add_bank_account_screen.dart';
import '../invoice/create_invoice_screen.dart';

class CreateLinkScreen extends StatefulWidget {
  const CreateLinkScreen({super.key});

  @override
  State<CreateLinkScreen> createState() => _CreateLinkScreenState();
}

class _CreateLinkScreenState extends State<CreateLinkScreen> {
  TextEditingController jobDetailsController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? selectedCurrency;
  // int lastServiceIndex = -1;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Create Link',
        backButton: true,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.only(
              left: 21,
              right: 21,
              bottom: 10,
            ),
            children: [
              const Text(
                'Currency',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColor.subtitleColor,
                ),
              ),
              const SizedBox(
                height: 5,
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
                          height: 270,
                          title: 'Currency',
                          titleColor: Colors.black54,
                          closable: true,
                          options: [
                            Expanded(
                              child: ListView.separated(
                                itemCount: currencyList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedCurrency = currencyList[index];
                                    });
                                    AppRouter.back();
                                  },
                                  child: Text(
                                    currencyList[index],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 7,
                                ),
                              ),
                            )
                          ]);
                    },
                  );
                },
                child: FixedFieldWidget(
                  label: '',
                  content: selectedCurrency ?? 'USD',
                  backgroundColor: Colors.white,
                  contentColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ServiceCustomWidget(
                jobDetailsController: jobDetailsController,
                amountController: amountController,
                descriptionController: descriptionController,
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.topRight,
                      onPressed: () {
                        setState(() {
                          servicesWidgetList.removeAt(index);
                          serviceControllers.removeAt(index);
                        });
                      },
                      icon: const Icon(
                        Icons.cancel,
                        size: 20,
                      ),
                    ),
                    servicesWidgetList[index]
                  ],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: servicesWidgetList.length,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    serviceControllers.add(
                      ServiceControllerObject(
                        jobDetailsController: TextEditingController(),
                        amountController: TextEditingController(),
                        descriptionController: TextEditingController(),
                      ),
                    );

                    servicesWidgetList.add(
                      ServiceCustomWidget(
                        amountController:
                            serviceControllers.last.amountController,
                        descriptionController:
                            serviceControllers.last.descriptionController,
                        jobDetailsController:
                            serviceControllers.last.jobDetailsController,
                      ),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  primary: AppColor.backgroundColor,
                  minimumSize: const Size(123, 19),
                  maximumSize: const Size(123, 19),
                  // fixedSize: const Size(123, 19),
                ),
                icon: const Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
                label: const Text(
                  'Add item or service',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButtonWidget(
                text: 'Preview Invoice',
                isLoading: false,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Map<String, dynamic> map = {
                      "fixed": servicesMap(),
                      "currency": selectedCurrency
                    };
                    AppRouter.goTo(
                      ScreenName.previewLinkScreen,
                      object: CreateLinkModel.fromJson(map),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  servicesMap() {
    List<Map<String, dynamic>> data = [
      {
        "itemName": jobDetailsController.text,
        "description": descriptionController.text,
        "price": amountController.text
      },
    ];

    if (serviceControllers.isNotEmpty) {
      for (int i = 0; i < serviceControllers.length; ++i) {
        data.add({
          "itemName": serviceControllers[i].jobDetailsController.text,
          "description": serviceControllers[i].descriptionController.text,
          "price": serviceControllers[i].amountController.text,
        });
      }
    }

    return data;
  }

  List<Widget> servicesWidgetList = [];
  List<ServiceControllerObject> serviceControllers = [];

  List<String> currencyList = [
    "USD",
    "EUR",
    "ILS",
    "SAR",
    "EGP",
    "QAR",
    "JOD",
  ];
}
