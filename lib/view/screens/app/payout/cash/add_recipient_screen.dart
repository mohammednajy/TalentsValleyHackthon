import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/controller/models/recipient_model.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/payout_provider.dart';
import 'package:talents_valley_hackthon/utils/validation.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/add_bank_account_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';

import '../../../../shared/custom_button_widget.dart';

class AddRecipientScreen extends StatefulWidget {
  const AddRecipientScreen({super.key, this.recipientModel});
  final dynamic recipientModel;
  @override
  State<AddRecipientScreen> createState() => _AddRecipientScreenState();
}

class _AddRecipientScreenState extends State<AddRecipientScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController recipientsIDController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.recipientModel is RecipientModel) {
      nameController.text = widget.recipientModel.name;
      phoneNumController.text = widget.recipientModel.mobile;
      recipientsIDController.text = widget.recipientModel.idNumber;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.recipientModel is RecipientModel
            ? 'Edit Recipient'
            : 'Add Recipient',
        backButton: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
            children: [
              CustomTextFieldWidget(
                controller: nameController,
                label: 'Recipients Full Name (Arabic)',
                validator: (value) {
                  return value!.isValidName;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFieldWidget(
                controller: phoneNumController,
                label: 'Recipients Phone Number',
                validator: (value) {
                  return value!.isValidName;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFieldWidget(
                controller: recipientsIDController,
                label: 'Recipients ID Number',
                validator: (value) {
                  return value!.isValidName;
                },
              ),
              const SizedBox(
                height: 100,
              ),
              CustomButtonWidget(
                text: 'Continue',
                isLoading: context.watch<PayoutProvider>().loading,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context
                        .read<PayoutProvider>()
                        .sendVerificationCodeToRecipient(
                          edit: widget.recipientModel is RecipientModel,
                          recipientId: widget.recipientModel is RecipientModel
                              ? widget.recipientModel.sId
                              : '',
                          token: SharedPrefController().getUser().accessToken,
                          mobile: phoneNumController.text,
                          idNumber: recipientsIDController.text,
                          name: nameController.text,
                        );
                  }
                },
              )
            ]),
      ),
    );
  }
}
