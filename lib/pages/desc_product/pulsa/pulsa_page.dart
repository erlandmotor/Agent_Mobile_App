import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/pages/desc_product/product_page.dart';
import 'package:agent_mobile_app/pages/desc_product/widget_reusable/widget_reusable.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:flutter/material.dart';

class PulsaPage extends StatelessWidget {
  PulsaPage({super.key});

  TextEditingController inputNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarDefault(context,
          backgroundColor: ColorApp.primaryA3,
          colorComponen: ColorApp.secondaryFF,
          title: 'Pulsa'),
      body: ReusableWidget.headerWidgetProduct(
          context: context,
          icon: 'assets/icons/pulsa.png',
          inputNumberController: inputNumber),
    );
  }
}
