import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/material.dart';

class ConfirmSuccesPage extends StatelessWidget {
  final String image, title, description;
  final Widget buttonAction;
  const ConfirmSuccesPage(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.buttonAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: Marginlayout.marginhorizontal,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  image,
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: FontStyle.heading1,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: FontStyle.body1.copyWith(color: ColorApp.secondaryB2),
                ),
                const SizedBox(
                  height: 80,
                ),
                buttonAction
              ],
            ),
          ),
        ),
      ),
    );
  }
}
