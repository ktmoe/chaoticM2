import 'package:m2mobile/models/product.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/data/api/api_service.dart';

part 'store_product_list.g.dart';

class StoreProductList = _StoreProductListBase with _$StoreProductList;

abstract class _StoreProductListBase with Store {
  final ApiService _apiService = Modular.get<ApiService>();

  @observable
  ObservableList<Product> products = ObservableList.of([]);

  @action
  Future<void> getProductsByCategory(String subcategoryId, bool refresh) async {
    final response = await _apiService.getProductsByCategory(subcategoryId);
    if (response.body.message.toLowerCase() == 'success') {
      products.clear();
      products.addAll(response.body.product);
    }
  }
}
