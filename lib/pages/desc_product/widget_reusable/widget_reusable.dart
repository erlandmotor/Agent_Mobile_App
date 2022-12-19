import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';

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
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      validator: (String? error) {
                        if (error!.isEmpty) {
                          return 'Field ini tidak boleh kosong*';
                        } else if (error.startsWith('+62') == false) {
                          return 'Format harus +62*';
                        }
                      },
                      keyboardType: TextInputType.number,
                      cursorColor: ColorApp.primaryA3,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        isCollapsed: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorApp.primaryA3)),
                        hintText: 'Contoh : 08571287123',
                        fillColor: ColorApp.primaryA3,
                        focusColor: ColorApp.primaryA3,
                        hoverColor: ColorApp.primaryA3,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide:
                                BorderSide(color: ColorApp.secondaryEA)),
                        hintStyle: FontStyle.body2
                            .copyWith(color: ColorApp.secondaryB2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.perm_contact_calendar,
                    size: 24,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  static Widget inputNumber() {
    return Column(
      children: [
        Image.asset('assets/ilustration/notransaction.png'),
        const SizedBox(
          height: 7,
        ),
        Text(
          'Masukkan Nomor yang ingin diisi pulsanya',
          textAlign: TextAlign.center,
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
