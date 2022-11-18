import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/material.dart';

class WidgetFormInput extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool obscureText;
  final String hintText;
  final TextEditingController controller;
  const WidgetFormInput({
    Key? key,
    required this.formKey,
    required this.obscureText,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: (String? error) => 'Field ini tidak boleh kosong',
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: ColorApp.secondaryEA)),
          hintStyle: FontStyle.body2.copyWith(color: ColorApp.secondaryB2),
        ),
      ),
    );
  }
}
