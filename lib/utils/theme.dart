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
        maximumSize: const Size(double.infinity, 44),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 16,
        ),
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
        hintStyle: const TextStyle(
          fontSize: 15,
          color: Colors.grey,
        )));
