import 'dart:convert';

import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/main.dart';
import 'package:agent_mobile_app/models/history_rewards_model.dart';
import 'package:agent_mobile_app/models/rewards_model.dart';
import 'package:agent_mobile_app/pages/poin_page/check_redem_page.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:agent_mobile_app/widget_reusable/snacbar_error.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RewardsProviders extends ChangeNotifier {
  final ServiceApi _serviceApi = ServiceApi();

  List<RewardsModel> _dataRewards = [];
  List<RewardsModel> get dataRewards => _dataRewards;

  List<HistoryRewardsModel> _dataHistory = [];
  List<HistoryRewardsModel> get dataHistory => _dataHistory;

  RewardsModel _dataDetail = RewardsModel.fromJson({});
  RewardsModel get dataDetail => _dataDetail;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _loadingDetail = true;
  bool get loadingDetail => _loadingDetail;

  bool _loadingHistory = true;
  bool get loadingHistory => _loadingHistory;

  ValueNotifier<bool> _processRedeem = ValueNotifier<bool>(false);
  ValueNotifier<bool> get processRedeem => _processRedeem;

  /// untuk mengambil data rewads disimpan pada variabel [_dataRewards]
  Future getDataRewards() async {
    _dataRewards = [];
    _isLoading = true;
    try {
      final Map<String, dynamic> message =
          await _serviceApi.get(url: ApiUrl.rewards);
      if (message['code'] == 200) {
        for (var rewards in message['data']) {
          _dataRewards.add(RewardsModel.fromJson(rewards));
        }
      } else {
        _dataRewards = [];
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      _dataRewards = [];
    }
    notifyListeners();
  }

  /// untuk mengambil data detail rewards disimpan pada variabel [_dataDetail]
  Future detailReward({required String id}) async {
    _loadingDetail = true;
    try {
      final Map<String, dynamic> message = await _serviceApi.get(
        url: ApiUrl.rewards + '/' + id,
      );
      if (message['code'] == 200) {
        _dataDetail = RewardsModel.fromJson(message['data']);
      } else {
        _dataDetail = RewardsModel.fromJson({});
      }
      _loadingDetail = false;
    } catch (e) {
      _loadingDetail = false;
      _dataDetail = RewardsModel.fromJson({});
    }
    notifyListeners();
  }

  /// untuk mengambil data rewads disimpan pada variabel [_dataRewards]
  Future historyPoinSpent() async {
    _dataHistory = [];
    _loadingHistory = true;
    try {
      final Map<String, dynamic> message =
          await _serviceApi.get(url: ApiUrl.redeems);
      if (message['code'] == 200) {
        for (var rewards in message['data']) {
          _dataHistory.add(HistoryRewardsModel.fromJson(rewards));
        }
      } else {}
      _loadingHistory = false;
    } catch (e) {
      _dataHistory = [];
      _loadingHistory = false;
    }
    notifyListeners();
  }

  /// untuk menukarkan reward dengan point
  Future redeemReward({required String id}) async {
    _processRedeem.value = true;
    try {
      final Map<String, dynamic> message = await _serviceApi.postData(
        urlPath: ApiUrl.redeems,
        body: redeemModelToJson(RedeemModel(rewardId: int.parse(id))),
      );

      if (message['code'] == 201) {
        Navigator.pop(contextNav.currentContext!);
        RouteWidget.push(
            context: contextNav.currentContext!,
            page: const CheckDetailRedeemPage());
      } else {
        Navigator.pop(contextNav.currentContext!);
        SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
            message: 'Gagal melakukan transaksi');
      }
      _processRedeem.value = false;
    } catch (e) {
      _processRedeem.value = false;
      Navigator.pop(contextNav.currentContext!);
      SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
          message: 'Gagal melakukan transaksi');
    }
  }

  String parseDate(String date, String formate) {
    String years = date[0] + date[1] + date[2] + date[3];
    String month = date[5] + date[6];
    String day = date[8] + date[9];
    String hourse = date[11] + date[12];
    String minute = date[14] + date[15];

    return DateFormat(formate, 'id_ID')
        .format(DateTime.parse('$years-$month-$day $hourse:$minute'))
        .toString();
  }
}
