import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider/payoutProvider/bnb_provider.dart';
import '../../../utils/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
      AppSetting.init(context);
    return Consumer<BNBProvider>(
        builder: (context, homeController, child) => Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: homeController.selectPage,
                  onTap: (value) {
                    homeController.setSelectedPage(value);
                  },
                  items: homeController
                      .bnbIcon()
                      .map((e) => BottomNavigationBarItem(icon: e, label: ''))
                      .toList(),),
              body: homeController.pages[homeController.selectPage],
            ),);
  }
}

