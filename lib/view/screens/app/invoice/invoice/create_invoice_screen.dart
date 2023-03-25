import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/controller/models/create_invoice_model.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';
import 'package:talents_valley_hackthon/utils/validation.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/add_bank_account_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';
import 'package:talents_valley_hackthon/view/shared/custom_button_widget.dart';
import 'package:country_picker/country_picker.dart';

import '../../../../../utils/responsive.dart';
import '../../../../shared/custom_bottom_sheet.dart';

class CreateInvoiceScreen extends StatefulWidget {
  const CreateInvoiceScreen({super.key});

  @override
  State<CreateInvoiceScreen> createState() => _CreateInvoiceScreenState();
}

class _CreateInvoiceScreenState extends State<CreateInvoiceScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController jobDetailsController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedCountry;
  String? selectedCurrency;
  int lastServiceIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: 'Create Invoice',
        backButton: true,
      ),
      body: Form(
        key: formKey,
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: ListView(
              padding: const EdgeInsets.only(right: 21, left: 21, bottom: 20),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomTextFieldWidget(
                        controller: firstNameController,
                        hintText: 'First name',
                        label: 'Client Information',
                        validator: (value) {
                          return value!.isValidName;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          hintText: 'Last name',
                        ),
                        validator: (value) {
                          return value!.isValidName;
                        },
                        style: const TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    return value!.isValidEmail;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: const TextStyle(
                                    fontSize: 16, color: Colors.blueGrey),
                                bottomSheetHeight:
                                    500, // Optional. Country list modal height
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                //Optional. Styles the search field.
                                inputDecoration: InputDecoration(
                                  labelText: 'Search',
                                  hintText: 'Start typing to search',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFF8C98A8)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                              exclude: ['IL'],
                              onSelect: (Country country) {
                                setState(() {
                                  selectedCountry =
                                      country.displayNameNoCountryCode;
                                });
                                print(
                                  'Select country: ${country.displayNameNoCountryCode}',
                                );
                              });
                        },
                        child: FixedFieldWidget(
                          label: '',
                          content: selectedCountry ?? 'Country',
                          backgroundColor: Colors.white,
                          contentColor: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
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
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedCurrency =
                                                  currencyList[index];
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
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
                            // removedItemIndex.add(index);
                            --lastServiceIndex;
                            controllersIndex.remove(index);
                            servicesWidgetList.removeAt(index);
                            servicesControllers.removeAt(index);
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
                      controllersIndex.add(++lastServiceIndex);
                      // lastServiceIndex++;
                      servicesControllers.add({
                        "job_details$lastServiceIndex": TextEditingController(),
                        "amount$lastServiceIndex": TextEditingController(),
                        "description$lastServiceIndex": TextEditingController(),
                      });
                      servicesWidgetList.add(
                        ServiceCustomWidget(
                          jobDetailsController:
                              servicesControllers[lastServiceIndex]
                                  ["job_details$lastServiceIndex"]!,
                          amountController:
                              servicesControllers[lastServiceIndex]
                                  ["amount$lastServiceIndex"]!,
                          descriptionController:
                              servicesControllers[lastServiceIndex]
                                  ["description$lastServiceIndex"]!,
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
                        "client": {
                          "fullName":
                              '${firstNameController.text} ${lastNameController.text}',
                          "email": emailController.text,
                          "address": {
                            "country": selectedCountry,
                          }
                        },
                        "fixed": addListOfServices(),
                        "currency": selectedCurrency
                      };
                      AppRouter.goTo(
                        ScreenName.invoicePreviewScreen,
                        object: CreateInvoiceModel.fromJson(map),
                      );
                    }
                  },
                )
              ]),
        ),
      ),
    );
  }

  List<String> currencyList = [
    "USD",
    "EUR",
    "ILS",
    "SAR",
    "EGP",
    "QAR",
    "JOD",
  ];
  addListOfServices() {
    List<Map<String, dynamic>> data = [
      {
        "itemName": jobDetailsController.text,
        "description": descriptionController.text,
        "price": amountController.text
      },
    ];

    if (servicesWidgetList.isNotEmpty) {
      for (int i = 0; i < controllersIndex.length; ++i) {
        data.add({
          "itemName":
              servicesControllers[i]["job_details${controllersIndex[i]}"]!.text,
          "description":
              servicesControllers[i]["description${controllersIndex[i]}"]!.text,
          "price": servicesControllers[i]["amount${controllersIndex[i]}"]!.text
        });
      }
    }

    return data;
  }

  List<Widget> servicesWidgetList = [];
  List<int> controllersIndex = [];

  List<Map<String, TextEditingController>> servicesControllers = [];
  // Map<String, TextEditingController> singleServiceItem = {
  //   "job_details": TextEditingController(),
  //   "amount": TextEditingController(),
  //   "description": TextEditingController(),
  // };
}

class ServiceCustomWidget extends StatelessWidget {
  ServiceCustomWidget({
    super.key,
    required this.amountController,
    required this.descriptionController,
    required this.jobDetailsController,
  });
  TextEditingController jobDetailsController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: CustomTextFieldWidget(
                validator: (value) {
                  return value!.isValidName;
                },
                controller: jobDetailsController,
                hintText: 'Job Title',
                label: 'Job Details',
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomTextFieldWidget(
                controller: amountController,
                validator: (value) {
                  return value!.isValidAmountForInvoice;
                },
                hintText: '0.00',
                label: 'Amount',
                suffixIcon: const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'USD',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          minLines: 2,
          maxLines: 2,
          validator: (value) {
            return value!.isValidName;
          },
          controller: descriptionController,
          decoration: const InputDecoration(
            hintText: 'Description',
          ),
        ),
      ],
    );
  }
}
