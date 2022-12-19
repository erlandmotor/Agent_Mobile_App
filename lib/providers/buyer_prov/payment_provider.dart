import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/main.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:agent_mobile_app/widget_reusable/snacbar_error.dart';
import 'package:flutter/foundation.dart';

class PaymentMethodProvider extends ChangeNotifier {
  final ServiceApi _serviceApi = ServiceApi();
  Future createTransaction() async {
    try {
      final Map<String, dynamic> message =
          await _serviceApi.get(url: ApiUrl.transaction);
      if (message['code'] == 200 && message['errors'] == null) {
      } else {}
    } catch (e) {}
    notifyListeners();
  }

  Future paymentCredit({required int id}) async {
    try {
      final Map<String, dynamic> message = await _serviceApi.postData(
        urlPath: ApiUrl.credit,
        body: {"transaction_id": id},
      );
      if (message['code'] == 200 && message['message']) {
      } else if (message['code'] == 500 &&
          message['errors'][0]['value'] == 'record not found') {
        SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
            message: 'Transaksi Gagal, Coba ulangi nanti');
      } else if (message['code'] == 500 &&
          message['errors'][0]['value'] == 'not enough credit') {
        SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
            message: 'Transaksi Gagal, Saldo anda tidak cukup');
      }
    } catch (e) {
      SnackbarCustom()
          .erorrSnacbar(contextNav.currentContext!, message: 'Transaksi Gagal');
    }
  }

  Future paymentDana({required int id}) async {
    try {
      final Map<String, dynamic> message = await _serviceApi.postData(
        urlPath: ApiUrl.dana,
        body: {"transaction_id": id},
      );
      print(message);
    } catch (e) {
      SnackbarCustom()
          .erorrSnacbar(contextNav.currentContext!, message: 'Transaksi Gagal');
    }
  }

  Future paymentOvo({required int id, required String numberPhone}) async {
    try {
      final Map<String, dynamic> message = await _serviceApi.postData(
        urlPath: ApiUrl.ovo,
        body: {"transaction_id": id, "mobile_number": numberPhone},
      );
      print(message);
    } catch (e) {
      SnackbarCustom()
          .erorrSnacbar(contextNav.currentContext!, message: 'Transaksi Gagal');
    }
  }

  Future paymentShopeePay({required int id}) async {
    try {
      final Map<String, dynamic> message = await _serviceApi.postData(
        urlPath: ApiUrl.shopeePay,
        body: {"transaction_id": id},
      );
      print(message);
    } catch (e) {
      SnackbarCustom()
          .erorrSnacbar(contextNav.currentContext!, message: 'Transaksi Gagal');
    }
  }
}
