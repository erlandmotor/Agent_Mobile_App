import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/cashout/widgets/dialog_confirm_nominal.dart';
import 'package:agent_mobile_app/providers/product_prov/product_providers.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyValidateBank extends StatelessWidget {
  final String iconBank;
  final ValueNotifier<bool> isVerifBank;
  BodyValidateBank(
      {Key? key,
      required this.isVerifBank,
      required this.iconBank})
      : super(key: key);

  final TextEditingController _noRek = TextEditingController(text: '');
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  final ValueNotifier<bool> _norekIsNotEmpty = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Image.asset(
          iconBank,
          height: 50,
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Masukkan Nomor Rekening',
          style: FontStyle.subtitle2,
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: Marginlayout.marginhorizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: Form(
                  key: _keyForm,
                  child: TextFormField(
                    controller: _noRek,
                    validator: (String? error) {
                      if (error!.isEmpty) {
                        return 'Form ini tidak boleh kosong';
                      }
                    },
                    cursorColor: ColorApp.primaryA3,
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      if (value == '') {
                        isVerifBank.value = false;
                        _norekIsNotEmpty.value = true;
                      } else {
                        _norekIsNotEmpty.value = false;
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 10),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorApp.primaryA3)),
                      hintText: 'Nomor Rekening',
                      fillColor: ColorApp.primaryA3,
                      focusColor: ColorApp.primaryA3,
                      hoverColor: ColorApp.primaryA3,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: ColorApp.secondaryEA)),
                      hintStyle:
                          FontStyle.body2.copyWith(color: ColorApp.secondaryB2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 4,
                  child: ValueListenableBuilder(
                      valueListenable: _norekIsNotEmpty,
                      builder: (context, empty, _) {
                        if (empty == true) {
                          return ButtonCustom.buttonNoAction(
                              text: 'Verifikasi');
                        } else {
                          return ButtonCustom.buttonPrimary(
                              onTap: () {
                                isVerifBank.value = true;
                              },
                              colorBtn: ColorApp.primaryA3,
                              text: 'Verifikasi');
                        }
                      })),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: Marginlayout.marginAll,
          width: double.infinity,
          color: ColorApp.secondaryEA.withOpacity(0.35),
          child: Row(
            children: [
              Image.asset(
                iconBank,
                fit: BoxFit.fill,
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
        ValueListenableBuilder(
            valueListenable: isVerifBank,
            builder: (context, verifBank, _) {
              if (verifBank == true) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: 10,
                    padding: Marginlayout.marginAll,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            childAspectRatio: 2.2,
                            crossAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      return listCashout(
                          context: context,
                          price: 50 * (index + 1),
                          totalPrice: 50 * (index + 1));
                    },
                  ),
                );
              } else {
                return const SizedBox();
              }
            })
      ],
    );
  }

  Widget listCashout({
    required BuildContext context,
    required int price,
    required int totalPrice,
  }) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
              color: ColorApp.secondaryB2,
            ),
            borderRadius: BorderRadius.circular(6)),
        child: ListTile(
          onTap: () {
            dialogRedeem(context, amountBank: int.parse('${price}000'), priceAdmin: 2000);
          },
          visualDensity: const VisualDensity(vertical: 2),
          contentPadding: Marginlayout.marginhorizontal,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                price.toString(),
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
          subtitle: Text(
            context
                .read<ProductProviders>()
                .formateQurency(angka: int.parse('${totalPrice}000') + 2000),
            style: FontStyle.subtitle2Blue,
          ),
        ));
  }
}
