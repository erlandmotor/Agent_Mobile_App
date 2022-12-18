import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:flutter/material.dart';

dialogServerError(BuildContext context) {
  Future.delayed(const Duration(seconds: 3), () {
    Navigator.pop(context);
  });
  return showModalBottomSheet<void>(
    context: context,
    barrierColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    isDismissible: false,
    builder: (BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(bottom: 30, left: 50, right: 50),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorApp.primaryA3.withOpacity(0.7),
          boxShadow: [
            BoxShadow(color: ColorApp.secondaryEA, blurRadius: 3),
          ],
        ),
        child: const Text(
          'Terjadi Kesalahan Saat Memuat Data, Ulangi Kembali Beberapa Saat',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    },
  );
}
