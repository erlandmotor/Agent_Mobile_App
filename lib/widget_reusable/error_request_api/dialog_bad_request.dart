import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/pages/splash_screen.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

widgetBadRequest(BuildContext context) {
  return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
            title: Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.red,
                  size: 30,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Permintaan ditolak!'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red.withOpacity(0.7),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            content: Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: 'Session anda telah berakhir. ',
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorApp.secondaryB2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Mohon muat ulang aplikasi!',
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorApp.secondary00.withOpacity(0.3),
                    fontWeight: FontWeight.w600,
                  ),
                )
              ]),
            ),
            actions: [
              Padding(
                padding: Marginlayout.marginhorizontal,
                child: ButtonCustom.buttonPrimary(
                  onTap: () {
                    RouteWidget.pushAndRemoveUntil(
                        context: context, page: const SplashScreenPage());
                  },
                  colorBtn: ColorApp.primaryA3,
                  text: 'Restart Aplikasi',
                ),
              )
            ],
          ));
}
