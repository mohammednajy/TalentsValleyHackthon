import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/controller/provider/authProvider/authprovider.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/payout_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_button_widget.dart';

import '../../../utils/constant.dart';

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
    Center(child: Text('index 2')),
    PayoutScreen(),
    Center(child: Text('index 3')),
  ];
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
