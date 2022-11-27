import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/material.dart';

/// class ini berisi kumpulan widget reusable button
class ButtonCustom {
  static Widget buttonPrimary({
    required Function() onTap,
    required Color colorBtn,
    required String text,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Material(
        color: colorBtn,
        child: SizedBox(
          height: 45,
          width: double.infinity,
          child: InkWell(
            onTap: onTap,
            splashColor: colorBtn,
            highlightColor: Color(0XFF012243),
            child: Center(
              child: Text(
                text,
                style: FontStyle.button,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// function ini menampilkan widget button dimana tedapat icon pada bagian kiri dan text pada bagian tengah
  /// button tidak memiliki brackground hanya memiliki border
  static Widget buttonSeccondary({
    required Function() onTap,
    required String text,
  }) {
    return Container(
      height: 45,
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: ColorApp.secondaryEA)),
      child: InkWell(
        onTap: onTap,
        splashColor: ColorApp.secondaryEA,
        highlightColor: ColorApp.secondaryEA,
        child: Text(
          text,
          style: FontStyle.button.copyWith(color: ColorApp.secondary00),
        ),
      ),
    );
  }

  static Widget homePageMenu({
    required String image,
    required String desc,
  }) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorApp.secondaryB2)),
          child: Image.asset(
            image,
            fit: BoxFit.scaleDown,
            scale: 3,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: 72,
          child: Text(
            desc,
            style: FontStyle.caption,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
