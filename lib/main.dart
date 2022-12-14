import 'package:agent_mobile_app/pages/desc_product/checkout_product.dart';
import 'package:agent_mobile_app/pages/desc_product/desc_transaction_page.dart';
import 'package:agent_mobile_app/pages/desc_product/e-wallet/e-wallet.dart';
import 'package:agent_mobile_app/pages/desc_product/e-wallet/e_wallet_list.dart';
import 'package:agent_mobile_app/pages/desc_product/e-wallet/e_wallet_page.dart';

import 'package:agent_mobile_app/pages/desc_product/paket_data/paket_data.dart';
import 'package:agent_mobile_app/pages/desc_product/pulsa/pulsa_page.dart';
import 'package:agent_mobile_app/pages/detail_transaction/detail_transaction_page.dart';
import 'package:agent_mobile_app/pages/splash_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DIGO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EWallet(),
    );
  }
}
