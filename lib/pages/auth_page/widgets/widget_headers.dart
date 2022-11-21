import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/material.dart';

/// class ini digunakan untuk widget login dan register
class HeadersTitle extends StatelessWidget {
  final String title, subTitle;
  const HeadersTitle({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Text(
          title,
          style: FontStyle.heading1,
        ),
      ),
      subtitle: Center(
        child: Text(
          subTitle,
          textAlign: TextAlign.center,
          style: FontStyle.body2,
        ),
      ),
    );
  }
}
