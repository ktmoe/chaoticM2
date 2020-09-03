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

  @observable
  int latestCurrentPage = 0;

  @observable
  int latestTotalPage = 1;

  @action
  Future<void> search(String keyword, bool refresh) async {
    if (refresh) {
      latestCurrentPage = 0;
    }
    try {
      latestCurrentPage += 1;
      if (latestCurrentPage <= latestTotalPage) {
        final response = await _apiService.searchProduct(
            keyword, Modular.get<StoreApp>().userProfile.id, latestCurrentPage);
        if (response.body.error == null) {
          latestTotalPage = response.body.lastPage;
          response.body.product.forEach((element) {
            if (!results.contains(element)) {
              results.add(element);
            }
          });
          // results = ObservableList.of(response.body.product);
        } else {
          results = ObservableList.of([]);
        }
      }
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }
}
