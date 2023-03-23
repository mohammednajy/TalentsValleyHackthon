import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:talents_valley_hackthon/controller/provider/authProvider/authprovider.dart';
import 'package:talents_valley_hackthon/controller/provider/payoutProvider/payout_provider.dart';
import 'package:talents_valley_hackthon/utils/helper.dart';
import 'package:talents_valley_hackthon/utils/theme.dart';
import 'package:talents_valley_hackthon/view/router/app_router.dart';
import 'package:talents_valley_hackthon/view/router/ongenarte_route.dart';
import 'package:talents_valley_hackthon/view/router/router_name.dart';
import 'controller/localData/shared_perf.dart';
import 'controller/provider/payoutProvider/bnb_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => BNBProvider(),
      ),
         ChangeNotifierProvider(
        create: (context) => PayoutProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      ),
    ],
    child: const TalentsValleyApp(),
  ));
}

class TalentsValleyApp extends StatelessWidget {
  const TalentsValleyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: ScreenName.inactiveLinkScreen,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: AppRouter.navigationKey,
      scaffoldMessengerKey: UtilsConfig.scaffoldKey,
    );
  }
}
