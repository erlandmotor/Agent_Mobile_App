import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:flutter/material.dart';

/// class ini berisi tentang design system fonts dimana sudah menentukan ukuran dan warna
/// yang dapat dirubah --> .copywith()
///
/// variabel type static
class FontStyle {
  static TextStyle heading1 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: ColorApp.secondary00,
    letterSpacing: 0.15,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle body1 = TextStyle(
    fontSize: 17,
    color: ColorApp.secondary00,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle body2 = TextStyle(
    fontSize: 15,
    color: ColorApp.secondary00,
    letterSpacing: 0.25,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle button = TextStyle(
    fontSize: 15,
    color: ColorApp.secondaryFF,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle caption = const TextStyle(
    fontSize: 13,
    letterSpacing: 0.4,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle subtitle1SemiBold = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle subtitle2 = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle subtitle2SemiBold = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    fontFamily: 'Source Sans Pro',
  );
}
