import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/cashout/cashout_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:flutter/material.dart';

class CashoutList extends StatelessWidget {
  CashoutList({super.key});

  List<String> cashoutList = ['BNI', 'BCA', 'BRI', 'Mandiri'];
  List<String> icon = [
    'assets/logo/bni.png',
    'assets/logo/bca.png',
    'assets/logo/bri.png',
    'assets/logo/mandiri.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarDefault(context,
          backgroundColor: ColorApp.primaryA3,
          colorComponen: ColorApp.secondaryFF,
          title: 'Tarik Tunai'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Bank',
              style: FontStyle.subtitle1SemiBold,
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cashoutList.length,
                  itemBuilder: (context, index) {
                    return cashout(
                        context: context,
                        icon: icon[index],
                        eWallet: cashoutList[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }

  InkWell cashout({
    required BuildContext context,
    required String icon,
    required String eWallet,
  }) {
    return InkWell(
      onTap: () {
        RouteWidget.push(context: context, page: CashoutPage(icon: icon));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorApp.secondaryFF,
              borderRadius: BorderRadius.circular(6),
              boxShadow: CustomShadow.md),
          child: ListTile(
            leading: Image.asset(
              icon,
              height: 30,
            ),
            title: Text(
              eWallet,
              style: FontStyle.subtitle1SemiBold,
            ),
          ),
        ),
      ),
    );
  }
}
