import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/material.dart';

class WidgetFormInput extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool obscureText;
  final String hintText;
  final Color? colorSuffix;
  final TextEditingController controller;
  final Function()? onTapSuffix;
  final String? iconSuffix;
  final String iconPrefix;
  const WidgetFormInput({
    Key? key,
    required this.formKey,
    required this.obscureText,
    required this.hintText,
    required this.controller,
    this.colorSuffix,
    this.onTapSuffix,
    this.iconSuffix,
    required this.iconPrefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Form(
        key: formKey,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: (String? error) => 'Field ini tidak boleh kosong',
          cursorColor: ColorApp.primaryA3,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            isCollapsed: true,
            enabled: false,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Image.asset(
                iconPrefix,
                height: 12,
              ),
            ),
            suffixIcon: iconSuffix == null
                ? const SizedBox()
                : InkWell(
                    onTap: onTapSuffix,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Image.asset(
                        iconSuffix!,
                        color: colorSuffix == null
                            ? Colors.white
                            : ColorApp.primaryA3,
                        height: 12,
                      ),
                    ),
                  ),
            hintText: hintText,
            fillColor: ColorApp.primaryA3,
            focusColor: ColorApp.primaryA3,
            hoverColor: ColorApp.primaryA3,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: ColorApp.secondaryEA)),
            hintStyle: FontStyle.body2.copyWith(color: ColorApp.secondaryB2),
          ),
        ),
      ),
    );
  }
}
