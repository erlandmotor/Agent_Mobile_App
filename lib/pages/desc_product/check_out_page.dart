import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/desc_product/widget_reusable/dialog_succes.dart';
import 'package:agent_mobile_app/providers/buyer_prov/payment_provider.dart';
import 'package:agent_mobile_app/providers/product_prov/product_providers.dart';
import 'package:agent_mobile_app/providers/profile/account_provider.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:agent_mobile_app/widget_reusable/widget_text_error.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  final String numberPhone;
  final int id;
  const CheckoutPage({
    super.key,
    required this.id,
    required this.numberPhone,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController codeController = TextEditingController();
  final ValueNotifier<String> _paymentMethod = ValueNotifier<String>('');
  final GlobalKey<FormState> _codePromo = GlobalKey<FormState>();

  final ValueNotifier<bool> _invalidPromo = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    context.read<AccountProvider>().getUserData();
    context.read<ProductProviders>().detailProduct(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.secondaryFF,
        appBar: CustomAppBar.appBarDefault(context,
            backgroundColor: ColorApp.primaryA3,
            colorComponen: ColorApp.secondaryFF,
            title: 'Checkout'),
        body: Consumer2<ProductProviders, AccountProvider>(
          builder: (context, dataProduct, dataUser, _) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Apakah kamu mempunyai kode promo?',
                  style: FontStyle.subtitle2,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Form(
                        key: _codePromo,
                        child: TextFormField(
                          controller: codeController,
                          validator: (String? error) {
                            if (error!.isEmpty) {
                              return 'Form ini tidak boleh kosong*';
                            }
                          },
                          cursorColor: ColorApp.primaryA3,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            isCollapsed: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorApp.primaryA3)),
                            hintText: 'Masukkan Kode',
                            fillColor: ColorApp.primaryA3,
                            focusColor: ColorApp.primaryA3,
                            hoverColor: ColorApp.primaryA3,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide:
                                    BorderSide(color: ColorApp.secondaryEA)),
                            hintStyle: FontStyle.body2
                                .copyWith(color: ColorApp.secondaryB2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 3,
                      child: ButtonCustom.buttonPrimary(
                          onTap: () {
                            if (_codePromo.currentState!.validate() == true) {
                              _invalidPromo.value = true;
                            }
                          },
                          colorBtn: ColorApp.primaryA3,
                          text: 'Gunakan'),
                    )
                  ],
                ),
                ValueListenableBuilder<bool>(
                    valueListenable: _invalidPromo,
                    builder: (context, invalid, _) {
                      if (invalid == true) {
                        return const TextError(
                            message: 'Kode Promo tidak ditemukan*');
                      } else {
                        return const SizedBox();
                      }
                    }),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Pilih Metode Pembayaran',
                  style: FontStyle.subtitle1SemiBold,
                ),
                const SizedBox(
                  height: 16,
                ),
                dataProduct.isloading == false && dataUser.isLoading == false
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorApp.secondaryFF,
                            boxShadow: CustomShadow.md),
                        child: ButtonCustom.listProductCheckout(
                            icon: 'assets/icons/money.png',
                            descPayment: 'Saldo Digo',
                            total: context
                                .read<ProductProviders>()
                                .formateQurency(
                                    angka:
                                        dataUser.dataAccount.credit!.amount!),
                            desc: dataUser.dataAccount.credit!.amount! <
                                    dataProduct.dataDetail.price!
                                ? Text(
                                    'Saldo tidak mencukupi',
                                    style: FontStyle.captionRed,
                                  )
                                : const SizedBox(),
                            action: dataUser.dataAccount.credit!.amount! <
                                    dataProduct.dataDetail.price!
                                ? 'Top Up Saldo'
                                : '',
                            text: true,
                            onTap: () {
                              context
                                  .read<PaymentMethodProvider>()
                                  .paymentCredit(
                                      id: dataProduct.dataDetail.id!);
                            }),
                      )
                    : const Opacity(opacity: 0),
                const SizedBox(
                  height: 16,
                ),
                dataProduct.isloading == false && dataUser.isLoading == false
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorApp.secondaryFF,
                            boxShadow: CustomShadow.md),
                        child: ButtonCustom.listProductCheckout(
                            icon: 'assets/icons/e-wallet.png',
                            descPayment: 'Pembayaran Lain',
                            total: context
                                .read<ProductProviders>()
                                .formateQurency(
                                    angka: dataProduct.dataDetail.price!),
                            desc: ValueListenableBuilder<String>(
                                valueListenable: _paymentMethod,
                                builder: (context, data, _) {
                                  if (data != '') {
                                    return Image.asset(
                                      data,
                                      height: 24,
                                    );
                                  } else {
                                    return Text(
                                      'E-Money, Bank, Gerai ATM',
                                      style: FontStyle.captionGreen,
                                    );
                                  }
                                }),
                            action: 'assets/icons/arrow.png',
                            text: false,
                            onTap: () {
                              _dialogRedeem(context);
                            }),
                      )
                    : const Opacity(opacity: 0),
                const SizedBox(height: 32),
                Text(
                  'RIncian Transaksi',
                  style: FontStyle.subtitle1SemiBold,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Nama Produk',
                        style: FontStyle.subtitle2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            dataProduct.isloading == false
                                ? dataProduct.dataDetail.description!
                                : 'Loading...',
                            textAlign: TextAlign.right,
                            style: FontStyle.subtitle2SemiBold,
                          ),
                          Text(
                            dataProduct.isloading == false
                                ? 'Masa Aktif ${dataProduct.dataDetail.activePeriod} Hari'
                                : 'Loading...',
                            textAlign: TextAlign.right,
                            style: FontStyle.subtitle2SemiBold,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                detailTransaction(
                    desc: 'Nomor Handphone', value: widget.numberPhone),
                detailTransaction(
                    desc: 'Harga',
                    value: context
                        .read<ProductProviders>()
                        .formateQurency(angka: dataProduct.dataDetail.price!)),
                detailTransaction(desc: 'Biaya Admin', value: '-'),
                detailTransaction(desc: 'Promo', value: '-'),
                const Divider(
                  thickness: 1,
                ),
                detailTransaction(
                    desc: 'Total Pembayaran',
                    value: context
                        .read<ProductProviders>()
                        .formateQurency(angka: dataProduct.dataDetail.price!)),
                const SizedBox(
                  height: 46,
                ),
                ValueListenableBuilder<String>(
                    valueListenable: _paymentMethod,
                    builder: (context, data, _) {
                      if (data != '') {
                        return ButtonCustom.buttonPrimarySecond(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => ShowDialog(
                                poin: dataProduct.dataDetail.coins.toString(),
                              ),
                            );
                          },
                          text: 'BAYAR',
                          colorBtn: ColorApp.primaryA3,
                        );
                      } else {
                        return ButtonCustom.buttonPrimarySecond(
                          onTap: () {},
                          text: 'BAYAR',
                          colorBtn: ColorApp.secondaryEA,
                        );
                      }
                    }),
                const SizedBox(
                  height: 32,
                )
              ],
            ),
          ),
        ));
  }

  Padding detailTransaction({
    required String desc,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              desc,
              style: FontStyle.subtitle2,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              value,
              style: FontStyle.subtitle2SemiBold,
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pilih Metode Pembayaran',
                        style: FontStyle.subtitle2,
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
                    height: 12.5,
                  ),
                  //NOTE Data Deskripsi
                  Text(
                    'E-Money',
                    style: FontStyle.subtitle2SemiBold,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  paymentMethod(
                      icon: 'assets/logo/dana.png',
                      paymentMethod: 'DANA',
                      ontap: () {
                        _paymentMethod.value = 'assets/logo/dana.png';
                        Navigator.pop(context);
                      }),
                  paymentMethod(
                      icon: 'assets/logo/shopeepay.png',
                      paymentMethod: 'Shopee Pay',
                      ontap: () {
                        _paymentMethod.value = 'assets/logo/shopeepay.png';
                        Navigator.pop(context);
                      }),
                  paymentMethod(
                      icon: 'assets/logo/ovo.png',
                      paymentMethod: 'OVO',
                      ontap: () {
                        _paymentMethod.value = 'assets/logo/ovo.png';
                        Navigator.pop(context);
                      }),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text('Virtual Account'),
                  const SizedBox(
                    height: 16,
                  ),
                  paymentMethod(
                      icon: 'assets/logo/bni.png',
                      paymentMethod: 'BNI',
                      ontap: () {
                        _paymentMethod.value = 'assets/logo/bni.png';
                        Navigator.pop(context);
                      }),
                  paymentMethod(
                      icon: 'assets/logo/bca.png',
                      paymentMethod: 'BCA',
                      ontap: () {
                        _paymentMethod.value = 'assets/logo/bca.png';
                        Navigator.pop(context);
                      }),
                  paymentMethod(
                      icon: 'assets/logo/mandiri.png',
                      paymentMethod: 'Mandiri',
                      ontap: () {
                        _paymentMethod.value = 'assets/logo/mandiri.png';
                        Navigator.pop(context);
                      }),
                  paymentMethod(
                      icon: 'assets/logo/bri.png',
                      paymentMethod: 'BRI',
                      ontap: () {
                        _paymentMethod.value = 'assets/logo/bri.png';
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Column paymentMethod({
    required String icon,
    required String paymentMethod,
    required Function() ontap,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: ontap,
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            icon,
            width: 24,
            height: 24,
          ),
          title: Text(
            paymentMethod,
            style: FontStyle.subtitle2SemiBold,
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
        )
      ],
    );
  }
}
