import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/material.dart';

class DialogCustom {
  static dialogAlertPop(
      {required BuildContext context,
      required Function() function,
      String? textButton,
      List<Widget>? leading,
      String? textContent}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            title: Row(
              children: leading!,
            ),
            content: Text('$textContent', style: FontStyle.body2),
            actions: [
              TextButton(
                onPressed: function,
                child: Text('$textButton',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: ColorApp.primaryA3)),
              ),
            ],
          );
        });
  }

  static choiceActionButton(
      {required BuildContext context,
      required Function() function,
      String? textButton,
      List<Widget>? leading,
      textContent}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            title: Row(
              children: leading!,
            ),
            content: Text('$textContent', style: FontStyle.body2),
            actions: [
              FlatButton(
                onPressed: function,
                splashColor: ColorApp.primaryA3,
                color: Colors.transparent,
                child: Text('$textButton',
                    style: FontStyle.body2.copyWith(color: ColorApp.primaryA3)),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                splashColor: Colors.red,
                color: Colors.transparent,
                child: Text('Batal',
                    style: FontStyle.body2.copyWith(color: Colors.red)),
              ),
            ],
          );
        });
  }
}
