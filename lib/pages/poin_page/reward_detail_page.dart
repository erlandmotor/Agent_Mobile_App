import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/pages/poin_page/check_redem_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class RewardDetailPage extends StatelessWidget {
  RewardDetailPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _numbuerKey = GlobalKey<FormState>();
  final TextEditingController _inputNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.appBarDefault(
        context,
        backgroundColor: ColorApp.primaryA3,
        colorComponen: Colors.white,
        title: 'Detail Reward',
      ),
      bottomNavigationBar: Padding(
        padding: Marginlayout.marginhorizontal.copyWith(bottom: 40),
        child: ButtonCustom.buttonPrimary(
          onTap: () => _dialogRedeem(context),
          // colorBtn: ColorApp.secondaryB2,
          // text: 'Oups, dikoin kamu belum cukup',
          colorBtn: ColorApp.primaryA3,
          text: 'Redeem Sekarang',
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            alignment: Alignment.center,
            color: ColorApp.primaryA3,
            child: const Icon(
              Icons.phone_android_rounded,
              size: 60,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: Marginlayout.marginhorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _overViewReward(context),
                Text(
                  'Deskripsi',
                  style: FontStyle.subtitle1SemiBold,
                ),
                const SizedBox(
                  height: 16,
                ),
                //NOTE Data Deskripsi
                Text(
                  'Khusus buat kamu yang ingin dapat tambahan pulsa dari DIGO. Yuk buruan redeem sekarang juga keburu selesai rewardnya.',
                  style: FontStyle.subtitle2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future _dialogRedeem(BuildContext context) async {
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Redeem Poin',
                style: FontStyle.subtitle1SemiBold,
              ),
              const SizedBox(
                height: 16,
              ),
              //NOTE Data Deskripsi
              Text(
                'Masukan Nomor Handphone Terlebih dahulu sebelum anda melakukan Redeem poin.',
                style: FontStyle.subtitle2,
              ),
              const SizedBox(
                height: 16,
              ),
              WidgetFormInput(
                formKey: _numbuerKey,
                obscureText: false,
                hintText: '08**********',
                controller: _inputNumber,
                iconPrefix: 'assets/icons/call.png',
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 10.0),
              //   child: Text(
              //     '*Nomor HP yang anda masukkan tidak sesuai',
              //     style: FontStyle.caption
              //         .copyWith(color: ColorApp.subSecondary21),
              //   ),
              // ),
              const SizedBox(
                height: 70,
              ),
              ButtonCustom.buttonPrimary(
                onTap: () => RouteWidget.push(
                    context: context, page: const CheckDetailRedeemPage()),
                // colorBtn: ColorApp.secondaryB2,
                // text: 'Oups, dikoin kamu belum cukup',
                colorBtn: ColorApp.primaryA3,
                text: 'Redeem Sekarang',
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonCustom.buttonSeccondary(
                onTap: () => Navigator.pop(context),
                text: 'Nanti deh',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _overViewReward(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            bottom: 24, top: MediaQuery.of(context).size.height * 0.2),
        width: double.infinity,
        padding: Marginlayout.marginhorizontal.copyWith(top: 16, bottom: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: CustomShadow.md,
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Paket Data',
                  style: FontStyle.caption,
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/coin.png',
                  height: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '100 Koin',
                  style: FontStyle.subtitle1SemiBold,
                ),
              ],
            ),
            Text(
              'Pulsa 25.000',
              style: FontStyle.heading1,
            ),
            const SizedBox(
              height: 16,
            ),
            Divider(
              color: ColorApp.secondaryB2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Berlaku Sampai dengan',
                    style: FontStyle.subtitle2,
                  ),
                ),
                Text(
                  '31 Desember 2022',
                  style: FontStyle.subtitle2,
                ),
              ],
            ),
          ],
        ));
  }
}
