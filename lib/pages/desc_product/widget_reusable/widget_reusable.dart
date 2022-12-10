import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/pages/desc_product/pulsa/pulsa_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';

import 'package:flutter/material.dart';

import '../../../helper/routes.dart';

class ReusableWidget {
  static Container overViewReward(
      {BuildContext? context, required TextEditingController? controller}) {
    return Container(
        margin: EdgeInsets.only(
            bottom: 24, top: MediaQuery.of(context!).size.height * 0.2),
        width: double.infinity,
        padding: Marginlayout.marginhorizontal.copyWith(top: 16, bottom: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: CustomShadow.md,
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masukkan No. Handphone',
              style: FontStyle.caption,
            ),
            SizedBox(
              height: 8,
            ),
            WidgetFormInputNumber(
                obscureText: false,
                hintText: 'Contoh : 08571287123',
                controller: controller!),
          ],
        ));
  }

  static Widget inputNumber() {
    return Column(
      children: [
        Image.asset('assets/ilustration/notransaction.png'),
        SizedBox(
          height: 7,
        ),
        Text(
          'Masukkan Nomor yang ingin diisi pulsanya',
          style: FontStyle.subtitle1,
        )
      ],
    );
  }

  static Widget infoPayment(
      {required BuildContext context, required Widget pageRoute}) {
    return Padding(
        padding: Marginlayout.marginhorizontal.copyWith(bottom: 40),
        child: ButtonCustom.buttonSecondaryWithIcon(
            onTap: () {
              RouteWidget.push(context: context, page: pageRoute);
            },
            text: 'Cek harga pulsa dan info lainnya',
            icon: 'assets/icons/arrow.png'));
  }
}
