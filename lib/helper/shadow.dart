import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:flutter/cupertino.dart';

class CustomShadow {
  static List<BoxShadow> base = [
    BoxShadow(
      color: ColorApp.secondary00.withOpacity(0.01),
      offset: const Offset(0, 1),
      blurRadius: 2,
    ),
    BoxShadow(
      color: ColorApp.secondary00.withOpacity(0.1),
      offset: const Offset(0, 1),
      blurRadius: 3,
    )
  ];
  static List<BoxShadow> md = [
    BoxShadow(
      color: ColorApp.secondary00.withOpacity(0.01),
      offset: const Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
      color: ColorApp.secondary00.withOpacity(0.1),
      offset: const Offset(0, 4),
      blurRadius: 6,
    )
  ];
  static List<BoxShadow> lg = [
    BoxShadow(
      color: ColorApp.secondary00.withOpacity(0.01),
      offset: const Offset(0, 4),
      blurRadius: 6,
    ),
    BoxShadow(
      color: ColorApp.secondary00.withOpacity(0.1),
      offset: const Offset(0, 10),
      blurRadius: 15,
    )
  ];
  static List<BoxShadow> xl = [
    BoxShadow(
      color: ColorApp.secondary00.withOpacity(0.01),
      offset: const Offset(0, 10),
      blurRadius: 10,
    ),
    BoxShadow(
      color: ColorApp.secondary00.withOpacity(0.1),
      offset: const Offset(0, 20),
      blurRadius: 25,
    )
  ];
  static List<BoxShadow> product = [
    BoxShadow(
      color: ColorApp.primaryA3.withOpacity(0.01),
      offset: const Offset(0, 1),
      blurRadius: 2,
    ),
    BoxShadow(
      color: ColorApp.primaryA3.withOpacity(0.1),
      offset: const Offset(0, 20),
      blurRadius: 25,
    )
  ];
}
