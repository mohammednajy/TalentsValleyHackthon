import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';

class RichTextCustom extends StatelessWidget {
  const RichTextCustom({
    required this.leftText,
    required this.rightText,
    required this.onTap,
    Key? key,
    this.fontSize = 17,
  }) : super(key: key);

  final String leftText;
  final String rightText;
  final void Function()? onTap;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: leftText,
          style: TextStyle(color: AppColor.subtitleColor, fontSize: fontSize),
          children: [
            TextSpan(
              text: rightText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: fontSize,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            )
          ],
        ),
      ),
    );
  }
}
