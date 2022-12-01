import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/account/widgets/dialog_list_operator.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class SettingPriceSellPage extends StatelessWidget {
  SettingPriceSellPage({Key? key}) : super(key: key);
  final TextEditingController _inputSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> _menuPrabayar = [
      ButtonCustom.homePageMenu(
          onTap: () {
            dialogListOperator(context, controllerInput: _inputSearch);
          },
          image: 'assets/icons/pulsa.png',
          desc: 'Pulsa'),
      ButtonCustom.homePageMenu(
          onTap: () {}, image: 'assets/icons/paket.png', desc: 'Paket Data'),
      ButtonCustom.homePageMenu(
          onTap: () {},
          image: 'assets/icons/voucher.png',
          desc: 'Voucher Game'),
      ButtonCustom.homePageMenu(
          onTap: () {},
          image: 'assets/icons/listrik.png',
          desc: 'Token Listrik'),
      ButtonCustom.homePageMenu(
          onTap: () {},
          image: 'assets/icons/wallet.png',
          desc: 'Top-Up E-Wallet'),
      ButtonCustom.homePageMenu(
          onTap: () {}, image: 'assets/icons/pdam.png', desc: 'PDAM'),
      ButtonCustom.homePageMenu(
          onTap: () {}, image: 'assets/icons/bpjs.png', desc: 'BPJS'),
    ];
    return Scaffold(
      appBar: CustomAppBar.appBarDefault(
        context,
        backgroundColor: ColorApp.primaryA3,
        colorComponen: Colors.white,
        title: 'Atur Harga Jual',
      ),
      body: ListView(
        padding: Marginlayout.marginAll,
        children: [
          Text(
            'Prabayar',
            style: FontStyle.subtitle1SemiBold,
          ),
          const SizedBox(
            height: 24,
          ),
          // NOTE: Menu

          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 10),
            itemCount: _menuPrabayar.length,
            itemBuilder: (context, index) => _menuPrabayar[index],
          )
        ],
      ),
    );
  }
}
