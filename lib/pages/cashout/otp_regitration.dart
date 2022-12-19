import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/detail_transaction/detail_transaction_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class OtpRegistration extends StatelessWidget {
  const OtpRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: ColorApp.secondaryFF,
              ),
            ),
            titleSpacing: 0,
            title: Text(
              'Verifikasi Kode OTP',
              style: FontStyle.headline6BoldWhite,
            ),
            flexibleSpace: Stack(
              children: [
                Image.asset(
                  'assets/backround/bg_kode_otp.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: Marginlayout.marginhorizontal.copyWith(
                        top: MediaQuery.of(context).size.height * 0.17),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jumlah yang dibayarkan',
                          style: FontStyle.subtitle1White,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Rp52.000',
                          style: FontStyle.headline5SemiBoldWhite,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.20)),
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Masukkan Kode OTP telah kami kirimkan ke E-Mail',
                    style: FontStyle.subtitle2,
                  ),
                  TextSpan(
                    text: ' andre*********@gmail.com',
                    style: FontStyle.subtitle2SemiBold,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: index == 3
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(right: 16),
                      child: Container(
                        height: 50,
                        width: 70,
                        decoration: BoxDecoration(
                            color: ColorApp.secondaryFF,
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            border: Border.all(
                                color: ColorApp.secondaryB2, width: 0.5)),
                      ),
                    ),
                  )),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Mohon tunggu',
                    style: FontStyle.caption,
                  ),
                  TextSpan(
                    text: ' 60',
                    style: FontStyle.subtitle2SemiBoldBlue,
                  ),
                  TextSpan(
                    text: ' detik untuk mengirim ulang',
                    style: FontStyle.caption,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: Marginlayout.marginhorizontal,
              child: ButtonCustom.buttonPrimary(
                  onTap: () {
                    RouteWidget.push(
                        context: context,
                        page: DetailTransactionPage(
                            image: 'assets/icons/success.png',
                            price: '',
                            // context
                            //           .read<ProductProviders>()
                            //           .formateQurency(
                            //               angka: data
                            //                   .listTransaction[index].amount!),
                            desc: '',
                            // 'Pembelian ${data.listTransaction[index].amount!}',
                            methodPayment: Text(
                              'Saldo Digo',
                              style: FontStyle.subtitle2SemiBold,
                            ),
                            status: '',
                            // data.listTransaction[index].status! ==
                            //         'SUCCEEDED'
                            //     ? 'Berhasil'
                            //     : data.listTransaction[index].status! ==
                            //             'PENDING'
                            //         ? 'Pending'
                            //         : 'Gagal',
                            date: '',
                            // context
                            //     .read<RewardsProviders>()
                            //     .parseDate(
                            //         data.listTransaction[index]
                            //             .createdAt!,
                            //         'dd MMMM yyyy'),
                            time: '',
                            // '${context.read<RewardsProviders>().parseDate(data.listTransaction[index].createdAt!, 'hh:mm')}  ${DateTime.parse(data.listTransaction[index].createdAt!).toLocal().timeZoneName} ',
                            total: ','
                            // context
                            //     .read<ProductProviders>()
                            //     .formateQurency(
                            //         angka: data
                            //             .listTransaction[index].amount!),
                            ));
                  },
                  colorBtn: ColorApp.primaryA3,
                  text: 'Verifikasi'),
            )
          ],
        ),
      ),
    );
  }
}
