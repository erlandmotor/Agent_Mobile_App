import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/material.dart';

/// class ini kumpulan appbar custom yang dapat dipanggil berkali kali
class CustomAppBar {
  static PreferredSizeWidget appBarDefault(BuildContext context,
      {required Color backgroundColor,
      required Color colorComponen,
      List<Widget>? action,
      required String title}) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: colorComponen,
        ),
      ),
      titleSpacing: 0,
      title: Text(
        title,
        style: FontStyle.heading1.copyWith(color: colorComponen),
      ),
      actions: action ?? [],
    );
  }
}
