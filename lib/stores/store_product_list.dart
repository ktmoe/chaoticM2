import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/boxes/box_products_by_category.dart';
import 'package:m2mobile/exceptions/app_exception.dart';

part 'store_product_list.g.dart';

class StoreProductList = _StoreProductListBase with _$StoreProductList;

abstract class _StoreProductListBase with Store {
  final ApiService _apiService = Modular.get<ApiService>();
  BoxProductByCategory _boxProductByCategory;

  @observable
  ObservableList<Product> products = ObservableList.of([]);

  @observable
  String subCategory = '';

  @observable
  bool initDone = false;

  @observable
  int latestCurrentPage = 0;

  @observable
  int latestTotalPage = 1;

  @observable
  AppException exception;

  @action
  Future<void> init() async {
    initDone = false;
    _boxProductByCategory = await BoxProductByCategory.create();
    updateProducts();
    _boxProductByCategory.listenable.addListener(updateProducts);
    initDone = true;
  }

  @action
  void updateProducts() {
    if (subCategory.isNotEmpty) {
      products = ObservableList.of(_boxProductByCategory.listenable.value.values
          .where((element) => element.subcategoryid == subCategory));
    }
  }

  @action
  Future<void> getProductsByCategory(String subcategoryId, bool refresh) async {
    if (refresh) {
      latestCurrentPage = 0;
    }
    try {
      latestCurrentPage += 1;
      subCategory = subcategoryId;
      if (latestCurrentPage <= latestTotalPage) {
        final response = await _apiService.getProductsByCategory(
            Modular.get<StoreApp>().userProfile.id,
            subcategoryId,
            latestCurrentPage);
        if (response.body.error == null &&
            response.body.message.toLowerCase() == 'success') {
          if (refresh) {
            _boxProductByCategory.deleteByCategory(subcategoryId);
          }
          latestTotalPage = response.body.lastPage;
          _boxProductByCategory.saveAll(response.body.product.toList());
        } else
          products = ObservableList.of([]);
      }
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }
}
