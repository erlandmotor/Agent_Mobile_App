import 'package:agent_mobile_app/pages/splash_screen.dart';
import 'package:agent_mobile_app/providers/auth/forgot_password_provider.dart';
import 'package:agent_mobile_app/providers/auth/signin_provider.dart';
import 'package:agent_mobile_app/providers/auth/signup_provider.dart';
import 'package:agent_mobile_app/providers/auth/verification_otp_provider.dart';
import 'package:agent_mobile_app/providers/profile/account_provider.dart';
import 'package:agent_mobile_app/providers/reward/reward_providers.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> contextNav = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpProviders>(
            create: (context) => SignUpProviders()),
        ChangeNotifierProvider<VePinsProvider>(
            create: (context) => VePinsProvider()),
        ChangeNotifierProvider<SigninProvider>(
            create: (context) => SigninProvider()),
        ChangeNotifierProvider<AccountProvider>(
            create: (context) => AccountProvider()),
        ChangeNotifierProvider<ForgotPaswordProvider>(
            create: (context) => ForgotPaswordProvider()),
        ChangeNotifierProvider<RewardsProviders>(
            create: (context) => RewardsProviders()),
      ],
      child: MaterialApp(
        navigatorKey: contextNav,
        debugShowCheckedModeBanner: false,
        title: 'DIGO',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreenPage(),
      ),
    );
  }
}
