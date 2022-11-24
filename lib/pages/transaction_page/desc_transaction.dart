import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/material.dart';

class DescTransaction extends StatelessWidget {
  const DescTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 24,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorApp.secondaryFF,
                          border: Border.all(
                              color: ColorApp.secondary00, width: 2)),
                      child: Icon(
                        Icons.question_mark,
                        size: 18,
                      ))
                ],
              ),
              SizedBox(
                height: 16,
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: ColorApp.primaryA3,
                child: Image.asset(
                  'assets/icons/wallet.png',
                  color: ColorApp.secondaryFF,
                  height: 50,
                  width: 50,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  '-Rp50.000',
                  style: FontStyle.headline5,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  'Pembelian Pulsa Indosat',
                  style: FontStyle.headline6,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Rincian Transaksi',
                style: FontStyle.subtitle1,
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pembayaran',
                    style: FontStyle.subtitle2,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/logo/dana.png',
                        width: 18,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Dana',
                        style: FontStyle.subtitle2SemiBold,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status',
                    style: FontStyle.subtitle2,
                  ),
                  Text(
                    'SUKSES',
                    style: FontStyle.subtitle2SemiBold,
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Waktu',
                    style: FontStyle.subtitle2,
                  ),
                  Text(
                    '14.06 WIB',
                    style: FontStyle.subtitle2SemiBold,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tanggal',
                    style: FontStyle.subtitle2,
                  ),
                  Text(
                    '17 November 2022',
                    style: FontStyle.subtitle2SemiBold,
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'No Invoice',
                    style: FontStyle.subtitle2,
                  ),
                  Row(
                    children: [
                      Text(
                        '1233423483347...',
                        style: FontStyle.subtitle2SemiBold,
                      ),
                      Image.asset('assets/icons/copy.png')
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jumlah',
                    style: FontStyle.subtitle2,
                  ),
                  Text(
                    'Rp50.000',
                    style: FontStyle.subtitle2SemiBold,
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: FontStyle.headline6SemiBold,
                  ),
                  Text(
                    'Rp50.000',
                    style: FontStyle.headline6SemiBold,
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(6)),
                child: Center(
                  child: Text(
                    'Unduh Bukti Pembayaran',
                    style: FontStyle.button2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
