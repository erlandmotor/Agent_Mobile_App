import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';

import 'package:agent_mobile_app/pages/desc_product/paket_data/paket_data.dart';
import 'package:agent_mobile_app/pages/desc_product/widget_reusable/widget_reusable.dart';
import 'package:agent_mobile_app/pages/poin_page/check_redem_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _numbuerKey = GlobalKey<FormState>();
  final TextEditingController _inputNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.appBarDefault(context,
          backgroundColor: ColorApp.primaryA3,
          colorComponen: Colors.white,
          title: 'Pulsa',
          action: [Image.asset('assets/icons/question.png')]),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            alignment: Alignment.center,
            color: ColorApp.primaryA3,
            child: const Icon(
              Icons.phone_android_rounded,
              size: 60,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: Marginlayout.marginhorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableWidget.overViewReward(
                    context: context, controller: _inputNumber),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
          padding: Marginlayout.marginhorizontal.copyWith(bottom: 40),
          child: ButtonCustom.buttonSecondaryWithIcon(
              onTap: () {
                RouteWidget.push(context: context, page: PulsaPage());
              },
              text: 'Cek harga pulsa dan info lainnya',
              icon: 'assets/icons/arrow.png')),
    );
  }
}
