import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/providers/profile/account_provider.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  final String name, email, phone;
  const EditProfilePage(
      {Key? key, required this.name, required this.email, required this.phone})
      : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _textName = TextEditingController();

  final TextEditingController _textEmail = TextEditingController();

  final TextEditingController _textNoPhone = TextEditingController();

  final TextEditingController _textLocation = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _textName.text = widget.name;
    _textEmail.text = widget.email;
    _textNoPhone.text = widget.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarDefault(
        context,
        backgroundColor: ColorApp.primaryA3,
        colorComponen: Colors.white,
        title: 'Akun Saya',
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: context.read<AccountProvider>().isUpdate,
          builder: (context, isUpdate, _) {
            if (isUpdate == true) {
              return Padding(
                padding: Marginlayout.marginhorizontal.copyWith(bottom: 48),
                child: ButtonCustom.buttonLoading(),
              );
            } else {
              return Padding(
                padding: Marginlayout.marginhorizontal.copyWith(bottom: 48),
                child: ButtonCustom.buttonPrimary(
                  onTap: () {
                    if (_formKey.currentState!.validate() == true) {
                      context.read<AccountProvider>().editProfile(context,
                          name: _textName.text, noHandphone: _textEmail.text);
                    }
                  },
                  colorBtn: ColorApp.primaryA3,
                  text: 'SIMPAN',
                ),
              );
            }
          }),
      body: Form(
        key: _formKey,
        child: ListView(
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
            WidgetFormOnlyInput(
              hintText: 'Masukan nama',
              controller: _textName,
            ),
            Text(
              'Email',
              style: FontStyle.subtitle2,
            ),
            const SizedBox(
              height: 5,
            ),
            WidgetFormOnlyInput(
              hintText: 'Masukan Email',
              controller: _textEmail,
            ),
            Text(
              'No.Handphone',
              style: FontStyle.subtitle2,
            ),
            const SizedBox(
              height: 5,
            ),
            WidgetFormOnlyInput(
              hintText: '08*********',
              controller: _textNoPhone,
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
                hintStyle:
                    FontStyle.body2.copyWith(color: ColorApp.secondaryB2),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
