import 'package:agent_mobile_app/pages/desc_product/check_out_page.dart';
import 'package:agent_mobile_app/pages/desc_product/desc_transaction_page.dart';
import 'package:agent_mobile_app/pages/desc_product/e-wallet/e-wallet.dart';
import 'package:agent_mobile_app/pages/desc_product/e-wallet/e_wallet_list.dart';
import 'package:agent_mobile_app/pages/desc_product/e-wallet/e_wallet_page.dart';

import 'package:agent_mobile_app/pages/desc_product/paket_data/paket_data_page.dart';
import 'package:agent_mobile_app/pages/desc_product/pulsa/pulsa_page.dart';
import 'package:agent_mobile_app/pages/detail_transaction/detail_transaction_page.dart';
import 'package:agent_mobile_app/pages/splash_screen.dart';
import 'package:agent_mobile_app/providers/auth/forgot_password_provider.dart';
import 'package:agent_mobile_app/providers/auth/signin_provider.dart';
import 'package:agent_mobile_app/providers/auth/signup_provider.dart';
import 'package:agent_mobile_app/providers/auth/verification_otp_provider.dart';
import 'package:agent_mobile_app/providers/buyer_prov/payment_provider.dart';
import 'package:agent_mobile_app/providers/faq_prov/faq_providers.dart';
import 'package:agent_mobile_app/providers/notification_prov/notification_provider.dart';
import 'package:agent_mobile_app/providers/product_prov/product_providers.dart';
import 'package:agent_mobile_app/providers/profile/account_provider.dart';
import 'package:agent_mobile_app/providers/reward/reward_providers.dart';
import 'package:agent_mobile_app/providers/transaction_prov/transaction_provider.dart';

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
        ChangeNotifierProvider<FAQProviders>(
            create: (context) => FAQProviders()),
        ChangeNotifierProvider<ProductProviders>(
            create: (context) => ProductProviders()),
        ChangeNotifierProvider<PaymentMethodProvider>(
            create: (context) => PaymentMethodProvider()),
        ChangeNotifierProvider<TransactionProviders>(
            create: (context) => TransactionProviders()),
        ChangeNotifierProvider<NotificationDataProvider>(
            create: (context) => NotificationDataProvider()),
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
