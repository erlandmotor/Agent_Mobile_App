import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:flutter/material.dart';

dialogTimeOutService(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    barrierColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    isDismissible: false,
    builder: (BuildContext context) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pop(context);
      });
      return Container(
        width: 100,
        margin: const EdgeInsets.only(bottom: 30, left: 55, right: 55),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorApp.primaryA3.withOpacity(0.7),
          boxShadow: [
            BoxShadow(color: ColorApp.secondaryB2, blurRadius: 3),
          ],
        ),
        child: Row(
          children: const [
            Text(
              '😥',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                'Jaringan Terputus, Periksa Koneksi Kamu Ya',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
