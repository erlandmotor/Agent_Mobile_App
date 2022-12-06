import 'package:agent_mobile_app/pages/splash_screen.dart';
import 'package:agent_mobile_app/providers/auth/signin_provider.dart';
import 'package:agent_mobile_app/providers/auth/signup_provider.dart';
import 'package:agent_mobile_app/providers/auth/verification_otp_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

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
      ],
      child: MaterialApp(
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
