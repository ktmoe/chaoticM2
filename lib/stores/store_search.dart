import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/exceptions/app_exception.dart';

part 'store_search.g.dart';

class StoreSearch = _StoreSearchBase with _$StoreSearch;

abstract class _StoreSearchBase with Store {
  final ApiService _apiService = Modular.get<ApiService>();

  @observable
  ObservableList<Product> results = ObservableList.of([]);

  @observable
  AppException exception;

  @action
  Future<void> search(String keyword) async {
    try {
      final response = await _apiService.searchProduct(
          keyword, Modular.get<StoreApp>().userProfile.id);
      if (response.body.error == null) {
        results = ObservableList.of(response.body.product);
      } else {
        results = ObservableList.of([]);
      }
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }
}
