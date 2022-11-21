import 'package:flutter/material.dart';

/// class ini berisikan route untuk function custom berpindah navigasi
///
class RouteWidget {
//TODO : buat animasi
  static Future pushReplacment(
      {required BuildContext context, required Widget page}) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static Future push(
      {required BuildContext context, required Widget page}) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static Future pushAndRemoveUntil(
      {required BuildContext context, required Widget page}) async {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }
}
