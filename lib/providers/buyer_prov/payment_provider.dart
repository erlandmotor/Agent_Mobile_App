import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/main.dart';
import 'package:agent_mobile_app/models/products_model.dart';
import 'package:agent_mobile_app/pages/desc_product/desc_transaction_page.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:agent_mobile_app/widget_reusable/snacbar_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentMethodProvider extends ChangeNotifier {
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  final ServiceApi _serviceApi = ServiceApi();
  Future createTransaction(
      {required int id, required String type, required String number}) async {
    _isLoading.value = true;
    try {
      final Map<String, dynamic> message = await _serviceApi
          .postData(urlPath: ApiUrl.transaction, body: {"product_id": id});
      if (message['code'] == 201 && message['errors'] == null) {
        if (type.toLowerCase() == 'credit'.toLowerCase()) {
          await paymentCredit(id: message['data']['id'], idProduct: id);
        } else if (type.toLowerCase() == 'DANA'.toLowerCase()) {
          await paymentDana(id: message['data']['id'], idProduct: id);
        } else if (type.toLowerCase() == 'OVO'.toLowerCase()) {
          await paymentOvo(
              id: message['data']['id'], numberPhone: number, idProduct: id);
        } else if (type.toLowerCase() == 'Shopee Pay'.toLowerCase()) {
          await paymentShopeePay(id: message['data']['id'], idProduct: id);
        }
      } else {
        SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
            message: 'Transaksi Gagal, Coba lagi nanti');
      }
      _isLoading.value = false;
    } catch (e) {
      _isLoading.value = false;
      SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
          message: 'Transaksi Gagal, Coba lagi nanti');
    }
  }

  Future paymentCredit({required int id, required int idProduct}) async {
    try {
      final Map<String, dynamic> message = await _serviceApi.postData(
        urlPath: ApiUrl.credit,
        body: {"transaction_id": id},
      );
      if (message['code'] == 200 && message['message']) {
        RouteWidget.push(
            context: contextNav.currentContext!,
            page: DescTransactionProductPage(
              id: idProduct,
            ));
      } else if (message['code'] == 500 &&
          message['errors'][0]['value'] == 'record not found') {
        SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
            message: 'Transaksi Gagal, Coba ulangi nanti');
      } else if (message['code'] == 500 &&
          message['errors'][0]['value'] == 'not enough credit') {
        SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
            message: 'Transaksi Gagal, Saldo anda tidak cukup');
      } else {
        SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
            message: 'Transaksi Gagal, Coba lagi nanti');
      }
    } catch (e) {
      SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
          message: 'Transaksi Gagal, Coba lagi nanti');
    }
  }

  Future paymentDana({
    required int id,
    required int idProduct,
  }) async {
    try {
      final Map<String, dynamic> message = await _serviceApi.postData(
        urlPath: ApiUrl.dana,
        body: {"transaction_id": id},
      );
      if (message['code'] == 200) {
        await launchUrl(
            Uri.parse(message['data']['actions']['mobile_web_checkout_url']),
            mode: LaunchMode.externalNonBrowserApplication);
        RouteWidget.pushReplacment(
            context: contextNav.currentContext!,
            page: DescTransactionProductPage(
              id: idProduct,
            ));
      } else {
        SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
            message: 'Proses tansaksi lanjutan gagal');
      }
    } catch (e) {
      SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
          message: 'Transaksi Gagal, Coba lagi nanti');
    }
  }

  Future paymentOvo(
      {required int id,
      required String numberPhone,
      required int idProduct}) async {
    try {
      final Map<String, dynamic> message = await _serviceApi.postData(
        urlPath: ApiUrl.ovo,
        body: {"transaction_id": id, "mobile_number": numberPhone},
      );
      if (message['code'] == 200) {
        RouteWidget.push(
            context: contextNav.currentContext!,
            page: DescTransactionProductPage(
              id: idProduct,
            ));
      } else {
        SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
            message: 'Proses tansaksi lanjutan gagal');
      }
    } catch (e) {
      SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
          message: 'Transaksi Gagal, Coba lagi nanti');
    }
  }

  Future paymentShopeePay({required int id, required int idProduct}) async {
    try {
      final Map<String, dynamic> message = await _serviceApi.postData(
        urlPath: ApiUrl.shopeePay,
        body: {"transaction_id": id},
      );
      if (message['code'] == 200) {
        await launchUrl(
            Uri.parse(
                message['data']['actions']['mobile_deeplink_checkout_url']),
            mode: LaunchMode.externalNonBrowserApplication);
        RouteWidget.pushReplacment(
            context: contextNav.currentContext!,
            page: DescTransactionProductPage(
              id: idProduct,
            ));
      } else {
        SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
            message: 'Proses tansaksi lanjutan gagal');
      }
    } catch (e) {
      SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
          message: 'Transaksi Gagal, Coba lagi nanti');
    }
  }
}
