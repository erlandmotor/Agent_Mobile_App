import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/pages/cashout/otp_regitration.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CashoutPage extends StatelessWidget {
  CashoutPage({super.key, required this.icon});

  final String icon;
  final TextEditingController _noRek = TextEditingController();
  final TextEditingController _nominalCashout = TextEditingController();

  final ValueNotifier<bool> _approveAmount = ValueNotifier<bool>(true);

  bool filled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorApp.secondaryFF,
      appBar: CustomAppBar.appBarDefaultSecond(context,
          backgroundColor: ColorApp.primaryA3,
          colorComponen: ColorApp.secondaryFF,
          title: 'Tarik Tunai'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: ButtonCustom.buttonPrimary(
            onTap: () {
              _dialogNominal(context);
            },
            colorBtn: ColorApp.primaryA3,
            text: 'Pilih Jumlah Nominal Sendiri'),
      ),
      body: Padding(
        padding: Marginlayout.marginAll,
        child: Column(
          children: [
            Image.asset(
              icon,
              height: 50,
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masukkan Nomor Rekening',
                  style: FontStyle.subtitle2,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: WidgetFormOnlyInput(
                        hintText: 'Nomor Rekening',
                        controller: _noRek,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        flex: 4,
                        child: filled != true
                            ? ButtonCustom.buttonPrimarySecond(
                                onTap: () {},
                                colorBtn: ColorApp.primaryF0,
                                text: 'Verifikasi')
                            : ButtonCustom.buttonPrimary(
                                onTap: () {},
                                colorBtn: ColorApp.primaryA3,
                                text: 'Verifikasi')),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: Marginlayout.marginAll,
              height: 56,
              width: double.infinity,
              color: ColorApp.secondaryEA.withOpacity(0.2),
              child: Row(
                children: [
                  Image.asset(
                    icon,
                    height: 30,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    'ANDRE SETYO',
                    style: FontStyle.subtitle1SemiBold,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
                child: GridView.builder(
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.2,
                  crossAxisSpacing: 16),
              itemBuilder: (context, index) {
                return listCashout(
                    context: context, price: '50', totalPrice: '52.000');
              },
            )),
          ],
        ),
      ),
    );
  }

  Widget listCashout({
    required BuildContext context,
    required String price,
    required String totalPrice,
  }) {
    return InkWell(
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
                color: ColorApp.secondaryB2,
              ),
              borderRadius: BorderRadius.circular(6)),
          // BoxDecoration(
          //   borderRadius: BorderRadius.circular(6),
          //   color: ColorApp.secondaryFF,

          // ),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price,
                    style: FontStyle.headline5SemiBold,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '000',
                    style: FontStyle.subtitle1SemiBold,
                  ),
                ],
              ),
            ),
            subtitle: Text(
              "Rp.$totalPrice",
              style: FontStyle.subtitle2Blue,
            ),
          )),
      onTap: () {
        _dialogRedeem(context);
      },
    );
  }

  Future _dialogRedeem(BuildContext context) async {
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      builder: (BuildContext context) {
        return ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Konfirmasi Tarik Tunai',
                        style: FontStyle.subtitle1SemiBold,
                      ),
                      InkWell(
                        child: Image.asset('assets/icons/x.png'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25.5,
                  ),
                  //NOTE Data Deskripsi
                  Text(
                    'DETAIL PEMBAYARAN',
                    style: FontStyle.subtitle2,
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  detailPayment(desc: 'Jumlah Tarik Tunai', value: 'Rp50.000'),
                  detailPayment(desc: 'Biaya Admin', value: 'Rp2.000'),
                  const Divider(
                    thickness: 1,
                  ),
                  detailPayment(desc: 'Total Pembayaran', value: 'Rp52.000'),
                  const SizedBox(height: 8),
                  Text(
                    'Metode Pembayaran',
                    style: FontStyle.subtitle2,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Deposit',
                        style: FontStyle.subtitle1SemiBoldBlue,
                      ),
                      Text(
                        'Rp6.000',
                        style: FontStyle.subtitle2SemiBold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 64,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: ColorApp.primaryDF.withOpacity(0.2)),
                    child: Padding(
                      padding: Marginlayout.marginAll,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/info.png'),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Text(
                              'Jumlah total pembayaran akan ditahan sampai transaksi berhasil atau kadaluwarsa',
                              style: FontStyle.caption,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                            text: 'Dengan Mengkonfimasi, kamu setuju dengan',
                            style: FontStyle.caption),
                        TextSpan(
                            text: ' Syarat & Ketentuan ',
                            style: FontStyle.captionBlue),
                        TextSpan(text: 'kami', style: FontStyle.caption)
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ButtonCustom.buttonPrimary(
                      onTap: () {
                        RouteWidget.push(
                            context: context,
                            page: OtpRegistration(
                              amount: int.parse(
                                  _nominalCashout.text.replaceAll('.', '')),
                            ));
                      },
                      colorBtn: ColorApp.primaryA3,
                      text: 'KONFIRMASI')
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future _dialogNominal(BuildContext context) async {
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'JUMLAH NOMINAL',
              style: FontStyle.buttonBlack,
            ),
            const SizedBox(
              height: 8,
            ),
            //NOTE Data Deskripsi
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom * 0.7),
              child: TextFormField(
                controller: _nominalCashout,
                validator: (String? error) => 'Field ini tidak boleh kosong',
                cursorColor: ColorApp.primaryA3,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CurrencyTextInputFormatter(
                      locale: 'id_ID', decimalDigits: 0, symbol: ''),
                ],
                decoration: InputDecoration(
                  isDense: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorApp.primaryA3)),
                  hintText: 'Masukkan Nominalmu',
                  fillColor: ColorApp.primaryA3,
                  focusColor: ColorApp.primaryA3,
                  hoverColor: ColorApp.primaryA3,
                  hintStyle:
                      FontStyle.body2.copyWith(color: ColorApp.secondaryB2),
                ),
              ),
            ),

            const SizedBox(
              height: 8,
            ),
            ValueListenableBuilder<bool>(
                valueListenable: _approveAmount,
                builder: (context, valide, _) {
                  if (valide == false) {
                    return Text(
                      'Nominal Tari Tunai Kelipatan Rp50.000 *',
                      style: FontStyle.caption
                          .copyWith(color: ColorApp.subSecondary21),
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nominal Tari Tunai Kelipatan Rp50.000',
                          style: FontStyle.caption,
                        ),
                        Image.asset(
                          'assets/icons/info2.png',
                        ),
                      ],
                    );
                  }
                }),
            const SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Expanded(child: button(context: context)),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: secondButton(
                  context: context,
                )),
              ],
            ),
          ],
        );
      },
    );
  }

  static Widget button({
    required BuildContext context,
  }) {
    return InkWell(
      child: Container(
        height: 52,
        decoration: BoxDecoration(
            border: Border.all(color: ColorApp.primaryA3, width: 2),
            borderRadius: BorderRadius.circular(6),
            color: ColorApp.secondaryFF),
        child: Center(
          child: Text(
            'BATAL',
            style: FontStyle.buttonBlue,
          ),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Widget secondButton({
    required BuildContext context,
  }) {
    return InkWell(
      child: Container(
        height: 52,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: ColorApp.primaryA3),
        child: Center(
          child: Text(
            'LANJUT',
            style: FontStyle.button,
          ),
        ),
      ),
      onTap: () {
        if (int.parse(_nominalCashout.text.replaceAll('.', '')) % 50000 == 0) {
          _approveAmount.value = true;
          Navigator.pop(context);
          RouteWidget.push(
              context: context,
              page: OtpRegistration(
                amount: int.parse(_nominalCashout.text.replaceAll('.', '')),
              ));
        } else {
          _approveAmount.value = false;
        }
      },
    );
  }

  Padding detailPayment({
    required String desc,
    required String value,
  }) {
    return Padding(
      padding: Marginlayout.marginBottom,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            desc,
            style: FontStyle.subtitle2Silver,
          ),
          Text(
            value,
            style: FontStyle.subtitle2SemiBold,
          )
        ],
      ),
    );
  }
}
