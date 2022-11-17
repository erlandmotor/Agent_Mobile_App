import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/material.dart';

/// class ini berisi kumpulan widget reusable button
class ButtonCustom {
  static Widget buttonPrimary({
    required Function() onTap,
    required Color colorBtn,
    required String text,
  }) {
    return FlatButton(
      onPressed: onTap,
      height: 45,
      minWidth: double.infinity,
      color: colorBtn,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Text(
        text,
        style: FontStyle.button,
      ),
    );
  }
}
