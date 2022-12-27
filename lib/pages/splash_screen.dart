import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/pages/current_pages.dart';
import 'package:agent_mobile_app/pages/desc_product/desc_transaction_page.dart';
import 'package:agent_mobile_app/pages/on_boarding/on_boarding_page.dart';
import 'package:agent_mobile_app/pages/poin_page/poin_rewards_page.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final FirebaseDynamicLinks _dynamicLinks = FirebaseDynamicLinks.instance;
  final ServiceApi _service = ServiceApi();
  @override
  void initState() {
    _paymentNav();
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      wrapperPage();
    });
  }

  Future _paymentNav() async {
    _dynamicLinks.onLink.listen((event) {
      if (event.link.toString() == 'https://digitaloutlet.com/succes-peyment') {
        Navigator.pop(context);
      } else {}
    }).onError((error) {
      RouteWidget.pushReplacment(
          context: context, page: const SplashScreenPage());
    });
  }

  Future wrapperPage() async {
    if (await _service.getToken() != null) {
      RouteWidget.pushReplacment(context: context, page: const CurrentPages());
    } else {
      RouteWidget.pushReplacment(context: context, page: OnBoardingPage());
    }
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
