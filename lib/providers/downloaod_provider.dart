import 'dart:io';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/main.dart';
import 'package:agent_mobile_app/widget_reusable/dialog_custom.dart';
import 'package:app_settings/app_settings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadProvider extends ChangeNotifier {
  Future processDownload({required String url, required nameFolder}) async {
    Directory? fileRoot = await getExternalStorageDirectory();

    final _path = File(fileRoot!.path + p.basename(url));

    try {
      ScaffoldMessenger.of(contextNav.currentContext!).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Downloading••••',
                style: FontStyle.button3,
              ),
              SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: ColorApp.primaryA3,
                ),
              )
            ],
          ),
          dismissDirection: DismissDirection.startToEnd,
          backgroundColor: Colors.white,
          behavior: SnackBarBehavior.floating,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
      );
      final response = await Dio().get(
        url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0),
      );

      final raf = _path.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      if (response.data != null) {
        DialogCustom.choiceActionButton(
          context: contextNav.currentContext!,
          textButton: 'Lihat File',
          leading: [],
          textContent: 'Download file berhasil BUkti Transaksi',
          function: () {
            Navigator.pop(contextNav.currentContext!);
            OpenFile.open(_path.path);
          },
        );
      } else {
        ScaffoldMessenger.of(contextNav.currentContext!).showSnackBar(SnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.redAccent,
          elevation: 0,
          content: Text(
            "Terjadi kesalahan saat unduh file. Mohon ulangi!",
            style: FontStyle.caption,
          ),
        ));
      }
      ScaffoldMessenger.of(contextNav.currentContext!).hideCurrentSnackBar();
    } catch (e) {
      ScaffoldMessenger.of(contextNav.currentContext!).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
        elevation: 0,
        content: Text(
          "Gagal unduh file. Mohon ulangi!",
          style: FontStyle.caption,
        ),
      ));
      ScaffoldMessenger.of(contextNav.currentContext!).hideCurrentSnackBar();
    }
    ScaffoldMessenger.of(contextNav.currentContext!).hideCurrentSnackBar();
  }

  Future download({required String url, required nameFolder}) async {
    Permission.storage.request().then((value) {
      if (value == PermissionStatus.granted) {
        processDownload(
            url:
                'https://poltekparmakassar.ac.id/wp-content/uploads/2020/10/Contoh-File-Download.pdf',
            nameFolder: p.basename(
                'https://poltekparmakassar.ac.id/wp-content/uploads/2020/10/Contoh-File-Download.pdf'));
      } else if (value == PermissionStatus.permanentlyDenied) {
        DialogCustom.dialogAlertPop(
            context: contextNav.currentContext!,
            function: () async {
              Navigator.pop(contextNav.currentContext!);
              AppSettings.openAppSettings();
            },
            leading: [],
            textContent: 'Aktifkan permission, Masuk Ke Pengaturan ',
            textButton: 'Beri Akses');
      } else if (value == PermissionStatus.denied) {
        download(
            url:
                'https://poltekparmakassar.ac.id/wp-content/uploads/2020/10/Contoh-File-Download.pdf',
            nameFolder: p.basename(
                'https://poltekparmakassar.ac.id/wp-content/uploads/2020/10/Contoh-File-Download.pdf'));
      }
    });
  }
}
