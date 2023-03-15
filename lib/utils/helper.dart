import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';

import '../view/router/app_router.dart';

class UtilsConfig {
  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBarMessage({required String message, required bool status}) {
    return scaffoldKey.currentState!.showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(message),
      elevation: 0,
      backgroundColor: status ? Colors.green : Colors.black45,
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
