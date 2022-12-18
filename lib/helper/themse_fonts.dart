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
  static TextStyle subtitle1 = TextStyle(
      fontSize: 17,
      color: ColorApp.secondary00,
      fontFamily: 'Source Sans Pro',
      fontWeight: FontWeight.w600);

  static TextStyle subtitle1White = TextStyle(
      fontSize: 17,
      color: ColorApp.secondaryFF,
      fontFamily: 'Source Sans Pro',
      fontWeight: FontWeight.w400);

  static TextStyle button = TextStyle(
    fontSize: 15,
    color: ColorApp.secondaryFF,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle buttonBlue = TextStyle(
    fontSize: 15,
    color: ColorApp.primaryB3,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle buttonBlack = TextStyle(
    fontSize: 15,
    color: ColorApp.secondary00,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle secondButton = TextStyle(
    fontSize: 15,
    color: ColorApp.secondaryB2,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
    fontFamily: 'Source Sans Pro',
  );
  static TextStyle subtitle1SemiBold = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle subtitle1SemiBoldBlue = TextStyle(
    fontSize: 17,
    color: ColorApp.primaryA3,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle button2 = TextStyle(
    fontSize: 15,
    color: ColorApp.secondary00,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle button3 = TextStyle(
    fontSize: 15,
    color: ColorApp.primaryA3,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle caption = const TextStyle(
    fontSize: 13,
    letterSpacing: 0.4,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle captionNeutral = TextStyle(
    color: ColorApp.secondaryB2,
    fontSize: 13,
    letterSpacing: 0.4,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle captionBlue = TextStyle(
    fontSize: 13,
    letterSpacing: 0.4,
    color: ColorApp.primaryB3,
    fontFamily: 'Source Sans Pro',
  );

  static TextStyle headingPage = TextStyle(
      fontSize: 26,
      color: ColorApp.secondaryFF,
      fontWeight: FontWeight.w600,
      fontFamily: 'Source Sans Pro');

  static TextStyle dateTransaction = TextStyle(
      fontSize: 15,
      color: ColorApp.secondary00,
      fontWeight: FontWeight.w600,
      fontFamily: 'Source Sans Pro');

  static TextStyle captionTransaction = TextStyle(
      fontSize: 13,
      color: ColorApp.secondary00,
      fontWeight: FontWeight.w600,
      fontFamily: 'Source Sans Pro');

  static TextStyle resultTransaction = TextStyle(
      fontSize: 13,
      color: ColorApp.secondaryFF,
      fontWeight: FontWeight.w600,
      fontFamily: 'Source Sans Pro');

  static TextStyle timeTransaction = TextStyle(
      fontSize: 10,
      color: ColorApp.secondary00,
      fontWeight: FontWeight.w300,
      fontFamily: 'Source Sans Pro');

  static TextStyle headline5 = TextStyle(
      fontSize: 26,
      color: ColorApp.subSecondary21,
      fontWeight: FontWeight.w600,
      fontFamily: 'Source Sans Pro');
  static TextStyle headline5SemiBold = TextStyle(
      fontSize: 26,
      color: ColorApp.secondary00,
      fontWeight: FontWeight.w600,
      fontFamily: 'Source Sans Pro');

  static TextStyle headline5SemiBoldWhite = TextStyle(
      fontSize: 26,
      color: ColorApp.secondaryFF,
      fontWeight: FontWeight.w600,
      fontFamily: 'Source Sans Pro');

  static TextStyle headline5SemiBold = TextStyle(
      fontSize: 26,
      color: ColorApp.secondaryFF,
      fontWeight: FontWeight.w600,
      fontFamily: 'Source Sans Pro');

  static TextStyle headline6 = TextStyle(
      fontSize: 22,
      color: ColorApp.secondary00,
      fontWeight: FontWeight.w400,
      fontFamily: 'Source Sans Pro');

  static TextStyle headline6SemiBold = TextStyle(
      fontSize: 22,
      color: ColorApp.secondary00,
      fontWeight: FontWeight.w600,
      fontFamily: 'Source Sans Pro');

  static TextStyle headline6Bold = TextStyle(
      fontSize: 22,
      color: ColorApp.secondary00,
      fontWeight: FontWeight.w700,
      fontFamily: 'Source Sans Pro');

  static TextStyle headline6BoldWhite = TextStyle(
      fontSize: 22,
      color: ColorApp.secondaryFF,
      fontWeight: FontWeight.w700,
      fontFamily: 'Source Sans Pro');

  static TextStyle subtitle2 = TextStyle(
      fontSize: 15,
      color: ColorApp.secondary00,
      fontWeight: FontWeight.w400,
      fontFamily: 'Source Sans Pro');

  static TextStyle subtitle2Silver = TextStyle(
      fontSize: 15,
      color: ColorApp.secondaryB2,
      fontWeight: FontWeight.w400,
      fontFamily: 'Source Sans Pro');

  static TextStyle subtitle2Blue = TextStyle(
      fontSize: 15,
      color: ColorApp.primaryB3,

      fontWeight: FontWeight.w400,
      fontFamily: 'Source Sans Pro');

  static TextStyle subtitle2SemiBold = TextStyle(
      fontSize: 15,
      color: ColorApp.secondary00,
      fontWeight: FontWeight.w600,
      fontFamily: 'Source Sans Pro');

  static TextStyle subtitle2SemiBoldBlue = TextStyle(
      fontSize: 15,
      color: ColorApp.primaryA3,
      fontWeight: FontWeight.w700,
      fontFamily: 'Source Sans Pro');
}
