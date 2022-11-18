import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/pages/on_boarding/on_boarding_page.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      RouteWidget.pushReplacment(context: context, page: OnBoardingPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        'assets/logo.png',
        width: MediaQuery.of(context).size.height * 0.19,
      )),
    );
  }
}
