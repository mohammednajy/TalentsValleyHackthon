import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';

var theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.backgroundColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
              side: BorderSide.none,
            ),
            elevation: 0,
            
            maximumSize: const Size(double.infinity, 44))));
