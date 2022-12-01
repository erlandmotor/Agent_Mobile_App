import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);

  final TextEditingController _textName = TextEditingController();
  final TextEditingController _textEmail = TextEditingController();
  final TextEditingController _textNoPhone = TextEditingController();
  final TextEditingController _textLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarDefault(
        context,
        backgroundColor: ColorApp.primaryA3,
        colorComponen: Colors.white,
        title: 'Akun Saya',
      ),
      bottomNavigationBar: Padding(
        padding: Marginlayout.marginhorizontal.copyWith(bottom: 48),
        child: ButtonCustom.buttonPrimary(
          onTap: () {
            //NOTE: Save Change profile
          },
          colorBtn: ColorApp.primaryA3,
          text: 'SIMPAN',
        ),
      ),
      body: ListView(
        padding: Marginlayout.marginAll,
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: ColorApp.primaryA3,
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
              onTap: () {},
              splashColor: Colors.white,
              focusColor: Colors.white,
              // overlayColor: Colors.white,
              highlightColor: Colors.white,
              child: Text(
                'Ubah Foto',
                textAlign: TextAlign.center,
                style: FontStyle.subtitle2SemiBold,
              )),
          Text(
            'Nama',
            style: FontStyle.subtitle2,
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: _textName,
            cursorColor: ColorApp.primaryA3,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              isCollapsed: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorApp.primaryA3)),
              hintText: 'Masukan nama',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: ColorApp.secondaryEA)),
              hintStyle: FontStyle.body2.copyWith(color: ColorApp.secondaryB2),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Email',
            style: FontStyle.subtitle2,
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: _textEmail,
            cursorColor: ColorApp.primaryA3,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              isCollapsed: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorApp.primaryA3)),
              hintText: 'Masukan Email',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: ColorApp.secondaryEA)),
              hintStyle: FontStyle.body2.copyWith(color: ColorApp.secondaryB2),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'No.Handphone',
            style: FontStyle.subtitle2,
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: _textNoPhone,
            cursorColor: ColorApp.primaryA3,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              isCollapsed: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorApp.primaryA3)),
              hintText: '08*********',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: ColorApp.secondaryEA)),
              hintStyle: FontStyle.body2.copyWith(color: ColorApp.secondaryB2),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Alamat',
            style: FontStyle.subtitle2,
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: _textLocation,
            maxLines: 4,
            cursorColor: ColorApp.primaryA3,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              isCollapsed: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorApp.primaryA3)),
              hintText: 'Masukan alamat anda',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: ColorApp.secondaryEA)),
              hintStyle: FontStyle.body2.copyWith(color: ColorApp.secondaryB2),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
