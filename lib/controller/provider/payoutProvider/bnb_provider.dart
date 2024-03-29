import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/controller/localData/shared_perf.dart';
import 'package:talents_valley_hackthon/controller/provider/authProvider/authprovider.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/payout_provider.dart';
import 'package:talents_valley_hackthon/view/screens/app/invoice/invoice_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_button_widget.dart';

import '../../../utils/constant.dart';
import '../../../view/screens/app/home/home_screen.dart';
import '../../../view/screens/app/payout/bank/payout_screen.dart';

class BNBProvider extends ChangeNotifier {
  int selectPage = 0;

  setSelectedPage(int index) {
    selectPage = index;
    notifyListeners();
  }

  List<Widget> bnbIcon() {
    List<Widget> bnbItem = [
      Image.asset(
        AssetPath.homeIcon,
        color: selectPage == 0
            ? const Color.fromARGB(255, 11, 72, 242)
            : Colors.grey,
      ),
      Image.asset(
        AssetPath.invoiceIcon,
        color: selectPage == 1
            ? const Color.fromARGB(255, 11, 72, 242)
            : Colors.grey,
      ),
      Image.asset(
        AssetPath.payoutIcon,
        color: selectPage == 2
            ? const Color.fromARGB(255, 11, 72, 242)
            : Colors.grey,
      ),
      Image.asset(
        AssetPath.userManagementIcon,
        color: selectPage == 3
            ? const Color.fromARGB(255, 11, 72, 242)
            : Colors.grey,
      ),
    ];
    return bnbItem;
  }

  List<Widget> pages = [
    HomeScreen(),
    InvoiceScreen(),
    PayoutScreen(),
    UserManagmentScreen(),
  ];
}

class UserManagmentScreen extends StatelessWidget {
  const UserManagmentScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomButtonWidget(
      text: 'login',
      isLoading: context.watch<AuthProvider>().loading,
      onPressed: () {
        context.read<AuthProvider>().login();
      },
    ));
  }
}


