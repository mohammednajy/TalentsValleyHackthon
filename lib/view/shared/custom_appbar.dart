import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';

import '../../utils/constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.backButton = false,
    Key? key,
    required this.title,
    this.icon,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(80);
  final bool backButton;
  final String title;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: backButton
          ? IconButton(
              padding: const EdgeInsets.only(left: 21),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                AppRouter.back();
              },
            )
          : null,
      centerTitle: true,
      // ignore: prefer_if_null_operators
      title: icon != null
          ? icon
          : Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
      backgroundColor: AppColor.backgroundColor,
      elevation: 0,
    );
  }
}
