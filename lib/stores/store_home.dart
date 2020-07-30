import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/box_products.dart';
import 'package:m2mobile/boxes/discount_products_box.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/models/product.dart';
import 'package:mobx/mobx.dart';

part 'store_home.g.dart';

class StoreHome = _StoreHome with _$StoreHome;

abstract class _StoreHome with Store {
  final ApiService _api = Modular.get<ApiService>();
  BoxProduct _boxProduct;

  DiscountProductBox _discountProductBox;

  _StoreHome() {
    init();
  }

  @observable
  AppException exception;

  @observable
  ObservableList<Product> products = ObservableList.of([]);

  @observable
  ObservableList<Product> discountProducts = ObservableList.of([]);

  @action
  Future init() async {
    _boxProduct = await BoxProduct.create();
    _discountProductBox = await DiscountProductBox.create();
    updateProducts();
    updateDiscountProdcucts();
    _boxProduct.listenable.addListener(updateProducts);
    _discountProductBox.listenable.addListener(updateDiscountProdcucts);
    Future.wait([getLatestProducts(),getDiscountProducts()]);
  }

  @action
  void updateProducts() {
    products = ObservableList.of(_boxProduct.listenable.value.values);
  }

  @action
  void updateDiscountProdcucts(){
    discountProducts = ObservableList.of(_discountProductBox.listenable.value.values);
  }

  @action
  Future getLatestProducts({bool refresh = true}) async {
    try {
      final productResponse = await _api.getLatestProducts();
      final products = productResponse.body.product.toList();
      if (refresh && _boxProduct != null) _boxProduct.deleteAll();
      _boxProduct.saveAll(products);
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }

  @action
  Future getDiscountProducts({bool refresh = true}) async {
    try {
      final productResponse = await _api.getDiscountProducts();
      final products = productResponse.body.product.toList();
      if (refresh && _discountProductBox != null) _discountProductBox.deleteAll();
      _discountProductBox.saveAll(products);
    } catch (e) {
      print("err in getting discount products => ${e.toString()}");
     //exception = AppException(message: e.toString());
    }
  }


}
