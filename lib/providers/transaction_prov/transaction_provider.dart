import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/models/transaction_model.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:flutter/material.dart';

class TransactionProviders extends ChangeNotifier {
  final ServiceApi _serviceApi = ServiceApi();

  List<TransactionModel> _listTransaction = [];
  List<TransactionModel> get listTransaction => _listTransaction;

  TransactionModel _detialTransaction = TransactionModel.fromJson({});
  TransactionModel get detialTransaction => _detialTransaction;

  bool _isloading = true;
  bool get isloading => _isloading;

  bool _detailLoading = true;
  bool get detailLoading => _detailLoading;

  Future getHistoryTransaction() async {
    _listTransaction = [];
    _isloading = true;
    try {
      final Map<String, dynamic> message =
          await _serviceApi.get(url: ApiUrl.transaction);
      if (message['code'] == 200 && message['errors'] == null) {
        for (var item in message['data']) {
          _listTransaction.add(TransactionModel.fromJson(item));
        }
      } else {
        _listTransaction = [];
      }
      _isloading = false;
    } catch (e) {
      _isloading = false;
      _listTransaction = [];
    }
    notifyListeners();
  }

  Future detailHistory({required String id}) async {
    _detailLoading = true;
    try {
      final Map<String, dynamic> message =
          await _serviceApi.get(url: '${ApiUrl.transaction}/$id');
      if (message['code'] == 200 && message['errors'] == null) {
        _detialTransaction = TransactionModel.fromJson(message['data']);
      } else {
        _detialTransaction = TransactionModel.fromJson({});
      }
      _detailLoading = false;
    } catch (e) {
      _detailLoading = false;
    }
    notifyListeners();
  }
}
