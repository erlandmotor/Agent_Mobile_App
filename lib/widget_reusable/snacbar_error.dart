import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:flutter/material.dart';

class SnackbarError {
  static GlobalKey<NavigatorState> mNavigation = GlobalKey<NavigatorState>();
  erorrSnacbar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorApp.subSecondary21,
        content: Text(message),
      ),
    );
  }
}
