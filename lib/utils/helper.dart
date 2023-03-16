import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';

import '../view/router/app_router.dart';

class UtilsConfig {
  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBarMessage({required String message, required bool status}) {
    return scaffoldKey.currentState!.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: status ? Colors.green : Colors.grey,
          )),
      content: status
          ? Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            )
          : Text(message),
      elevation: 0,
      backgroundColor: status ? Color(0xFFE9F7E7) : Colors.black45,
    ));
  }

  static Future<bool?> showAlertDialog({required String message}) async {
    bool? result = await showDialog(
        context: AppRouter.navigationKey.currentContext!,
        builder: (ctx) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            actionsAlignment: MainAxisAlignment.center,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    message,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    AppRouter.back();
                  },
                  child: const Icon(
                    Icons.close,
                  ),
                )
              ],
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: const BorderSide(
                        color: AppColor.borderColor,
                      ),
                    ),
                    elevation: 0,
                    primary: Colors.white,
                    fixedSize: const Size(121, 35),
                  ),
                  onPressed: () => Navigator.pop(ctx, false),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
              TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: BorderSide.none,
                      ),
                      elevation: 0,
                      backgroundColor: Colors.red,
                      fixedSize: const Size(121, 35)),
                  onPressed: () => Navigator.pop(ctx, true),
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ],
          );
        });
    return result;
  }
}
