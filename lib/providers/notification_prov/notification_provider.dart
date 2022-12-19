import 'dart:convert';

import 'package:agent_mobile_app/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationDataProvider extends ChangeNotifier {
  final List<NotificationModel> _listNotification = [];

  List<NotificationModel> _dataNotification = [];
  List<NotificationModel> get dataNotification => _dataNotification;
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  Future getData() async {
    _isLoading = true;
    try {
      var data = await rootBundle
          .loadString('assets/dumy_data/notification_data.json');
      final List message = json.decode(data);
      for (var item in message) {
        _listNotification.add(NotificationModel.fromJson(item));
      }
      filterDataNotif(query: '');
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
    }
    notifyListeners();
  }

  void filterDataNotif({required String query}) {
    List<NotificationModel> resultFilter = _listNotification
        .where((element) => element.type!.toLowerCase() == query.toLowerCase())
        .toList();
    print(resultFilter);
    print(query);
    if (query != '') {
      _dataNotification = resultFilter;
    } else {
      _dataNotification = _listNotification;
    }
    notifyListeners();
  }
}
