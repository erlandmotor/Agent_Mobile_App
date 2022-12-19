import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_below/dropdown_below.dart';

/// class ini berisi kumpulan widget reusable button
class ButtonCustom {
  static ClipRRect buttonPrimary({
    required Function() onTap,
    required Color colorBtn,
    required String text,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Material(
        color: colorBtn,
        child: InkWell(
          onTap: onTap,
          splashColor: colorBtn,
          highlightColor: const Color(0XFF012243),
          child: SizedBox(
            height: 45,
            width: double.infinity,
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

  static ClipRRect buttonPrimarySecond({
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
                style: FontStyle.secondButton,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// function ini menampilkan widget button dimana tedapat icon pada bagian kiri dan text pada bagian tengah
  /// button tidak memiliki brackground hanya memiliki border
  static InkWell buttonSeccondary({
    required Function() onTap,
    required String text,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: ColorApp.secondaryEA,
      highlightColor: ColorApp.secondaryEA,
      child: Container(
        height: 45,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: ColorApp.secondaryEA)),
        child: Text(
          text,
          style: FontStyle.button.copyWith(color: ColorApp.secondary00),
        ),
      ),
    );
  }

  static Container buttonLoading() {
    return Container(
        height: 45,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorApp.primaryA3,
          borderRadius: BorderRadius.circular(6),
        ),
        child: const CupertinoActivityIndicator(
          radius: 10,
          color: Colors.white,
        ));
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

  static Widget listProductCheckout({
    required String descPayment,
    required String total,
    required Widget desc,
    required String icon,
    String action = '',
    bool text = false,
    required Function() onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      leading: CircleAvatar(
        backgroundColor: ColorApp.primaryA3,
        child: Image.asset(icon),
      ),
      title: Text(
        descPayment,
        style: FontStyle.captionTransaction,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            total,
            style: FontStyle.caption,
          ),
          desc
        ],
      ),
      trailing: text == true
          ? Text(
              action,
              style: FontStyle.captionBold,
            )
          : Image(image: AssetImage(action)),
      onTap: onTap,
    );
  }

  static Widget dropDownMenu({
    required List<String> listItems,
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

  static Column homePageMenu({
    required String image,
    required String title,
    required Function() onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorApp.secondaryB2)),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
              height: 20,
            ),
          ),
        ),
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            style: FontStyle.caption,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
