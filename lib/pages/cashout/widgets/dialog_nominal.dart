import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/cashout/otp_regitration.dart';
import 'package:agent_mobile_app/pages/cashout/widgets/dialog_confirm_nominal.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future dialogNominal(BuildContext context,
    {required TextEditingController nominalCashout}) async {
  final ValueNotifier<bool> approveAmount = ValueNotifier<bool>(true);

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
              controller: nominalCashout,
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
              valueListenable: approveAmount,
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
              Expanded(
                child: ButtonCustom.buttonSeccondary(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: 'BATAL'),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: ButtonCustom.buttonPrimary(
                      onTap: () {
                        if (int.parse(nominalCashout.text.replaceAll('.', '')) %
                                50000 ==
                            0) {
                          approveAmount.value = true;
                          Navigator.pop(context);
                          dialogRedeem(context,
                              amountBank: int.parse(
                                  nominalCashout.text.replaceAll('.', '')),
                              priceAdmin: 2000);
                          nominalCashout.clear();
                        } else {
                          approveAmount.value = false;
                        }
                      },
                      colorBtn: ColorApp.primaryA3,
                      text: 'LANJUT')),
            ],
          ),
        ],
      );
    },
  );
}
