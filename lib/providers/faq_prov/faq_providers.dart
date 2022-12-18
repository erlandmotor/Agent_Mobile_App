import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/models/faq_model.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:flutter/foundation.dart';

class FAQProviders extends ChangeNotifier {
  final ServiceApi _serviceApi = ServiceApi();

  List<FaqModel> _listFaq = [];

  List<FaqModel> _filterFaq = [];
  List<FaqModel> get filterFaq => _filterFaq;

  bool _isloading = true;
  bool get isloading => _isloading;

  Future dataAllFAQ() async {
    _isloading = true;
    _listFaq = [];
    try {
      final Map<String, dynamic> message =
          await _serviceApi.get(url: ApiUrl.faqs);
      if (message['code'] == 200) {
        _listFaq.add(faqModelFromJson(message['data']));
      } else {
        _listFaq = [];
      }
      _isloading = false;
    } catch (e) {
      _isloading = false;
      _listFaq = [];
    }
    notifyListeners();
  }

  void filterDataFaq({required String query}) {
    List<FaqModel> resultFilter =
        _listFaq.where((element) => element.question!.contains(query)).toList();
    if (query != '') {
      _filterFaq = resultFilter;
    } else {
      _filterFaq = _listFaq;
    }

    notifyListeners();
  }
}
