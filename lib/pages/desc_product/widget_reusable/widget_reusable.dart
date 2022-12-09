import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';

import 'package:flutter/material.dart';

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
}
