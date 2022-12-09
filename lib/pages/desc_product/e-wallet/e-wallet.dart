import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:flutter/material.dart';

class EWallet extends StatelessWidget {
  EWallet({super.key});

  List<String> ewalletList = [
    'DANA',
    'Shopee Pay',
    'OVO',
    'Gopay Customer',
    'Link Aja'
  ];

  List<String> icon = [
    'assets/logo/dana1.png',
    'assets/logo/shopeepay.png',
    'assets/logo/ovo.png',
    'assets/logo/gopay.png',
    'assets/logo/linkaja.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.secondaryFF,
      appBar: CustomAppBar.appBarDefault(context,
          backgroundColor: ColorApp.primaryA3,
          colorComponen: ColorApp.secondaryFF,
          title: 'Top-Up E-Wallet',
          action: [Image.asset('assets/icons/question.png')]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'E-Wallet',
              style: FontStyle.subtitle1SemiBold,
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: ewalletList.length,
                  itemBuilder: (context, index) {
                    return eWallet(
                        icon: icon[index], eWallet: ewalletList[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }

  Padding eWallet({
    required String icon,
    required String eWallet,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorApp.secondaryFF,
            borderRadius: BorderRadius.circular(6),
            boxShadow: CustomShadow.md),
        child: ListTile(
          leading: Image.asset(icon),
          title: Text(
            eWallet,
            style: FontStyle.subtitle1SemiBold,
          ),
        ),
      ),
    );
  }
}
