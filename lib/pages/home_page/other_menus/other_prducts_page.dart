import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/main.dart';
import 'package:agent_mobile_app/pages/cashout/cashout_page.dart';
import 'package:agent_mobile_app/pages/desc_product/paket_data/paket_data_page.dart';
import 'package:agent_mobile_app/pages/desc_product/pulsa/pulsa_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import "package:flutter/material.dart";

class OtherProductMenuPages extends StatelessWidget {
  OtherProductMenuPages({Key? key}) : super(key: key);

  final List<Widget> _menuPrabayar = [
    ButtonCustom.homePageMenu(
        onTap: () {
          RouteWidget.push(
              context: contextNav.currentContext!, page: const PulsaPage());
        },
        image: 'assets/icons/pulsa.png',
        title: 'Pulsa'),
    ButtonCustom.homePageMenu(
        onTap: () {
          RouteWidget.push(
              context: contextNav.currentContext!, page: const PaketDataPage());
        },
        image: 'assets/icons/paket.png',
        title: 'Paket Data'),
    ButtonCustom.homePageMenu(
        onTap: () {},
        image: 'assets/icons/voucher.png',
        title: 'Voucher \nGame'),
    ButtonCustom.homePageMenu(
        onTap: () {},
        image: 'assets/icons/listrik.png',
        title: 'Token \nListrik'),
    ButtonCustom.homePageMenu(
        onTap: () {}, image: 'assets/icons/pdam.png', title: 'PDAM'),
    ButtonCustom.homePageMenu(
        onTap: () {}, image: 'assets/icons/bpjs.png', title: 'BPJS'),
  ];

  final List<Widget> _menuTransfer = [
    ButtonCustom.homePageMenu(
        onTap: () {}, image: 'assets/icons/money.png', title: 'Tarik Tunai'),
    ButtonCustom.homePageMenu(
        onTap: () {
          RouteWidget.push(
              context: contextNav.currentContext!, page: CashoutPage(icon: '',));
        },
        image: 'assets/icons/wallet.png',
        title: 'Uang \nElektrik'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarDefault(
        context,
        backgroundColor: ColorApp.primaryA3,
        colorComponen: Colors.white,
        title: 'Produk',
      ),
      body: ListView(
        padding: Marginlayout.marginAll,
        children: [
          // NOTE: menu prabayar
          Text(
            'Prabayar',
            style: FontStyle.subtitle1SemiBold,
          ),
          const SizedBox(
            height: 24,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 10),
            itemCount: _menuPrabayar.length,
            itemBuilder: (context, index) => _menuPrabayar[index],
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Transfer',
            style: FontStyle.subtitle1SemiBold,
          ),
          const SizedBox(
            height: 24,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 10),
            itemCount: _menuTransfer.length,
            itemBuilder: (context, index) => _menuTransfer[index],
          ),
        ],
      ),
    );
  }
}
