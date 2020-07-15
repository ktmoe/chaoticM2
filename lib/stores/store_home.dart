import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/box_products.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/models/responses/product.dart';
import 'package:mobx/mobx.dart';

part 'store_home.g.dart';

class StoreHome = _StoreHome with _$StoreHome;

abstract class _StoreHome with Store {
  final ApiService _api = Modular.get<ApiService>();
  BoxProduct _boxProduct;

  _StoreHome() {
    init();
  }

  @observable
  AppException exception;

  @observable
  ObservableList<Product> products = ObservableList();

  @action
  Future init() async {
    _boxProduct = await BoxProduct.create();
    updateProducts();
    _boxProduct.listenable.addListener(updateProducts);
  }

  @action
  void updateProducts() {
    products = ObservableList.of(_boxProduct.listenable.value.values);
  }

  @action
  Future getProductList({bool refresh = false}) async {
    try {
      final productResponse = await _api.getProducts();
      final products = productResponse.body.product.toList();
      if (refresh) _boxProduct.deleteAll();
      _boxProduct.saveAll(products);
    } catch (e) {
      debugPrint("${e.toString()}");
      exception = AppException(message: e.toString());
    }
  }
}
