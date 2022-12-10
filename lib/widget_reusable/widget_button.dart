import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/desc_product/checkout_product.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:agent_mobile_app/helper/shadow.dart';

/// class ini berisi kumpulan widget reusable button
class ButtonCustom {
  static Widget buttonPrimary({
    required Function() onTap,
    required Color colorBtn,
    required String text,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Material(
        color: colorBtn,
        child: SizedBox(
          height: 45,
          width: double.infinity,
          child: InkWell(
            onTap: onTap,
            splashColor: colorBtn,
            highlightColor: const Color(0XFF012243),
            child: Center(
              child: Text(
                text,
                style: FontStyle.button,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget buttonPrimarySecond(
      {required Function() onTap,
      required Color colorBtn,
      required String text,
      required bool methodPayment}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Material(
        color: colorBtn,
        child: SizedBox(
          height: 45,
          width: double.infinity,
          child: InkWell(
            onTap: onTap,
            splashColor: colorBtn,
            highlightColor: const Color(0XFF012243),
            child: Center(
              child: Text(text,
                  style: methodPayment == false
                      ? FontStyle.buttonB2
                      : FontStyle.button),
            ),
          ),
        ),
      ),
    );
  }

  /// function ini menampilkan widget button dimana tedapat icon pada bagian kiri dan text pada bagian tengah
  /// button tidak memiliki brackground hanya memiliki border
  static Widget buttonSeccondary({
    required Function() onTap,
    required String text,
  }) {
    return Container(
      height: 45,
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: ColorApp.secondaryEA)),
      child: InkWell(
        onTap: onTap,
        splashColor: ColorApp.secondaryEA,
        highlightColor: ColorApp.secondaryEA,
        child: Text(
          text,
          style: FontStyle.button.copyWith(color: ColorApp.secondary00),
        ),
      ),
    );
  }

  static Widget buttonSecondaryWithIcon({
    required Function() onTap,
    required String text,
    required String icon,
  }) {
    return Container(
      height: 45,
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: ColorApp.secondaryEA)),
      child: InkWell(
        onTap: onTap,
        splashColor: ColorApp.secondaryEA,
        highlightColor: ColorApp.secondaryEA,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: FontStyle.subtitle2.copyWith(color: ColorApp.secondary00),
            ),
            Image.asset(icon)
          ],
        ),
      ),
    );
  }

  static Widget listProductPulsa({
    required BuildContext context,
    required String descProduct,
    required String expired,
    required String price,
  }) {
    return InkWell(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: ColorApp.secondaryFF,
            boxShadow: CustomShadow.md),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              descProduct,
              style: FontStyle.subtitle2SemiBold,
            ),
          ),
          subtitle: Text(
            expired,
            style: FontStyle.caption,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Rp. " + price,
                  style: FontStyle.subtitle1SemiBoldBlue,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        RouteWidget.push(context: context, page: CheckoutPage());
      },
    );
  }

  static Widget listProductCheckout({
    required String descPayment,
    required String total,
    required String desc,
    required String icon,
    TextStyle? textStyle,
    String action = '',
    bool text = false,
    required Function() onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      // visualDensity: VisualDensity(vertical: ),
      leading: CircleAvatar(
        backgroundColor: ColorApp.primaryA3,
        child: Image.asset(icon),
      ),
      title: Text(
        descPayment,
        style: FontStyle.captionTransaction,
      ),
      subtitle: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Rp." + total,
            style: FontStyle.caption,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            desc,
            style: textStyle,
          )
        ],
      ),
      trailing: text == true
          ? Text(
              action,
              style: FontStyle.captionBold,
            )
          : Image(image: AssetImage(action)),
      // image == null
      //     ? Image.asset(image!)
      //     : Text(
      //         action,
      //         style: FontStyle.captionBold,
      //       ),

      onTap: onTap,
    );
  }

  static Widget dropDownMenu({
    // required Color dropdownColor,
    // required bool isExpanded,
    // required String value,
    required List<String> listItems,
    // required void Function(Object?)? onChange,
    required String hint,
  }) {
    return Container(
      width: 118,
      height: 38,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: ColorApp.primaryA3),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownBelow(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: ColorApp.secondaryFF,
          ),

          itemWidth: 200,
          boxTextstyle: FontStyle.button,
          boxHeight: 45,
          boxWidth: 200,
          hint: Text(
            hint,
            style: FontStyle.button,
          ),
          // value: _selectedTest,
          items: listItems.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
                alignment: AlignmentDirectional.centerStart,
                value: value,
                child: Text(
                  value,
                  style: FontStyle.button3,
                ));
          }).toList(),
          onChanged: (value) {},
        ),
      ),
    );
  }

  static Widget homePageMenu({
    required String image,
    required String desc,
    required Function() onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 48,
            width: 48,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorApp.secondaryB2)),
            child: Image.asset(
              image,
              fit: BoxFit.scaleDown,
              scale: 3,
            ),
          ),
        ),
        Text(
          desc,
          style: FontStyle.caption,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
