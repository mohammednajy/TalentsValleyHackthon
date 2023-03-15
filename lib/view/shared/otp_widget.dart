import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';

class OTPCodeWidget extends StatefulWidget {
  const OTPCodeWidget({
    required this.firstControllerField,
    required this.secondControllerField,
    required this.thirdControllerField,
    required this.fourthControllerField,
    required this.fifthControllerField,
    required this.sixthControllerField,
    Key? key,
  }) : super(key: key);
  final TextEditingController firstControllerField;
  final TextEditingController secondControllerField;
  final TextEditingController thirdControllerField;
  final TextEditingController fourthControllerField;
  final TextEditingController fifthControllerField;
  final TextEditingController sixthControllerField;
  @override
  State<OTPCodeWidget> createState() => _OTPCodeWidgetState();
}

class _OTPCodeWidgetState extends State<OTPCodeWidget> {
  final FocusNode _firstField = FocusNode();
  final FocusNode _secoundField = FocusNode();
  final FocusNode _thirdField = FocusNode();
  final FocusNode _fourthField = FocusNode();
  final FocusNode _fifthField = FocusNode();
  final FocusNode _sixthField = FocusNode();

  @override
  void dispose() {
    _firstField.dispose();
    _secoundField.dispose();
    _thirdField.dispose();
    _fourthField.dispose();
    _fifthField.dispose();
    _sixthField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SingleOtpField(
            autofocus: true,
            focusNode: _firstField,
            textControllerField: widget.firstControllerField,
            onChanged: (value) {
              if (value.isNotEmpty) {
                _firstField.nextFocus();
              }
            }),
        SizedBox(width: 7),
        SingleOtpField(
            focusNode: _secoundField,
            textControllerField: widget.secondControllerField,
            onChanged: (value) {
              widget.secondControllerField.text.isNotEmpty
                  ? _secoundField.nextFocus()
                  : _secoundField.previousFocus();
            }),
        SizedBox(width: 7),
        SingleOtpField(
            focusNode: _thirdField,
            textControllerField: widget.thirdControllerField,
            onChanged: (value) {
              widget.thirdControllerField.text.isNotEmpty
                  ? _thirdField.nextFocus()
                  : _thirdField.previousFocus();
            }),
        SizedBox(width: 40),
        SingleOtpField(
            focusNode: _fourthField,
            textControllerField: widget.fourthControllerField,
            onChanged: (value) {
              widget.fourthControllerField.text.isNotEmpty
                  ? _fourthField.nextFocus()
                  : _fourthField.previousFocus();
            }),
        SizedBox(width: 7),
        SingleOtpField(
            focusNode: _fifthField,
            textControllerField: widget.fifthControllerField,
            onChanged: (value) {
              widget.fifthControllerField.text.isNotEmpty
                  ? _fifthField.nextFocus()
                  : _fifthField.previousFocus();
            }),
        SizedBox(width: 7),
        SingleOtpField(
            focusNode: _sixthField,
            textControllerField: widget.sixthControllerField,
            onChanged: (value) {
              if (widget.sixthControllerField.text.isEmpty) {
                _sixthField.previousFocus();
              }
            }),
      ],
    );
  }
}

class SingleOtpField extends StatelessWidget {
  const SingleOtpField(
      {required this.focusNode,
      required this.textControllerField,
      required this.onChanged,
      this.autofocus = false,
      super.key});

  final FocusNode focusNode;
  final TextEditingController textControllerField;
  final Function(String)? onChanged;
  final bool autofocus;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          }
        },
        autofocus: autofocus,
        focusNode: focusNode,
        controller: textControllerField,
        onChanged: onChanged,
        decoration: InputDecoration(
            counter: Container(),
            errorStyle: const TextStyle(height: 0.3),
            contentPadding: const EdgeInsetsDirectional.only(
                top: 11, bottom: 11, start: 16, end: 16),
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.4),
              fontSize: 16,
            ),
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColor.borderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.blue,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            )),
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 20),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}
