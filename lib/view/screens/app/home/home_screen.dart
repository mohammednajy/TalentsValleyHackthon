import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/payout_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';

import '../../../shared/custom_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        children: [
          Text(
            'Hello, ${SharedPrefController().getUser().userInfo.firstName}',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black54,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomCardWidget(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Balance',
                style: TextStyle(
                  color: Color.fromARGB(255, 127, 127, 127),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      '\$ ${SharedPrefController().getUser().userInfo.balance.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Container(
                      height: 35,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 227, 242, 255),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        color: Colors.blue,
                        onPressed: () {},
                        alignment: Alignment.center,
                        icon: const Icon(
                          Icons.file_download_outlined,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        AppRouter.goTo(ScreenName.createLinkScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 227, 242, 255),
                      ),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      label: const Text(
                        'Create Link',
                        style: TextStyle(color: Colors.blue),
                      )),
                  ElevatedButton.icon(
                      onPressed: () {
                        AppRouter.goTo(ScreenName.createInvoiceScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 227, 242, 255),
                      ),
                      icon: Image.asset(
                        AssetPath.sentIcon,
                        height: 18,
                        color: Colors.blue,
                      ),
                      label: const Text(
                        'Send Invoice',
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
