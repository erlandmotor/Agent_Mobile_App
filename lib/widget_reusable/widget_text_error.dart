import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/cupertino.dart';

class TextError extends StatelessWidget {
  final String message;
  const TextError({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(message,
          style: FontStyle.subtitle2.copyWith(
            color: ColorApp.subSecondary21,
          )),
    );
  }
}
