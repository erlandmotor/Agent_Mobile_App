import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/models/products_model.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class ProductProviders extends ChangeNotifier {
  final ServiceApi _serviceApi = ServiceApi();

  List<ProductsModel> _dataProducts = [];
  List<ProductsModel> get dataProducts => _dataProducts;

  ProductsModel _dataDetail = ProductsModel.fromJson({});
  ProductsModel get dataDetail => _dataDetail;

  bool _isloading = true;
  bool get isloading => _isloading;

  bool _loadingDetail = true;
  bool get loadingDetail => _loadingDetail;

  Future getDataProduct({required String query}) async {
    _isloading = true;
    _dataProducts = [];
    try {
      final Map<String, dynamic> message =
          await _serviceApi.get(url: ApiUrl.products);
      if (message['code'] == 200) {
        for (var item in message['data']) {
          if (item['category']['name'] == query) {
            _dataProducts.add(ProductsModel.fromJson(item));
          }
        }
      } else {
        _dataProducts = [];
      }
      _isloading = false;
    } catch (e) {
      _dataProducts = [];
      _isloading = false;
    }
  }

  Future detailProduct({required int id}) async {
    _loadingDetail = true;
    try {
      final Map<String, dynamic> message =
          await _serviceApi.get(url: '${ApiUrl.products}/$id');
      if (message['code'] == 200) {
        _dataDetail = ProductsModel.fromJson(message['data']);
      } else {
        _dataDetail = ProductsModel.fromJson({});
        ;
      }
      _loadingDetail = false;
    } catch (e) {
      _dataDetail = ProductsModel.fromJson({});
      ;
      _loadingDetail = false;
    }
  }

  String formateQurency({required int angka}) {
    NumberFormat currencyFormatter =
        NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);

    return currencyFormatter.format(angka);
  }
}
