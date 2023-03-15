import 'package:flutter/material.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile(
      {super.key,
      required this.paymentMethod,
      required this.iconPath,
      this.onTap});
  final String paymentMethod;
  final String iconPath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.grey,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: SizedBox(
          width: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                iconPath,
                height: 30,
              ),
              Text(
                paymentMethod,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
