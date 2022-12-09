import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/pages/desc_product/product_pulsa.dart';
import 'package:flutter/material.dart';

class ReusableWidget {
  static Stack headerWidgetProduct({
    required BuildContext? context,
    required String? icon,
    required TextEditingController inputNumberController,
  }) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: MediaQuery.of(context!).size.height * 0.25,
            alignment: Alignment.center,
            color: ColorApp.primaryA3,
            child: Image.asset(
              icon!,
            )),
        Padding(
          padding: Marginlayout.marginhorizontal,
          child: Column(
            children: [
              ListView(
                children: [
                  _overViewReward(
                    context,
                    inputNumber: inputNumberController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ChoicePage()
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _overViewReward(BuildContext context,
      {required TextEditingController? inputNumber}) {
    return Container(
        margin: EdgeInsets.only(
            bottom: 24, top: MediaQuery.of(context).size.height * 0.2),
        width: double.infinity,
        padding: Marginlayout.marginhorizontal.copyWith(top: 16, bottom: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: CustomShadow.md,
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Masukkan No. Handphone',
                  style: FontStyle.caption,
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: WidgetFormInput(
                      obscureText: false,
                      hintText: 'Contoh : 08571287123',
                      controller: inputNumber!),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Image.asset(
                        'assets/icons/phone_book.png',
                        height: 24,
                      ),
                    ))
              ],
            ),
          ],
        ));
  }
}
