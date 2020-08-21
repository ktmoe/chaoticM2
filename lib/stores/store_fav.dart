import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/box_fav_products.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:mobx/mobx.dart';

part 'store_fav.g.dart';

class StoreFav = _StoreFav with _$StoreFav;

abstract class _StoreFav with Store {
  final ApiService apiService = Modular.get<ApiService>();

  BoxFav _boxFav;

  @observable
  ObservableList<Product> favs = ObservableList.of([]);

  @observable
  int latestCurrentPage = 0;

  @observable
  int latestTotalPage = 1;

  @observable
  AppException exception;

  @action
  void updateFavs() {
    favs = ObservableList.of(_boxFav.listenable.value.values.toList());
  }

  @action
  Future init() async {
    _boxFav = await BoxFav.create();
    updateFavs();
    _boxFav.listenable.addListener(updateFavs);
  }

  @action
  Future fetchFavList(bool refresh) async {
    if (refresh) {
      latestCurrentPage = 0;
    }
    try {
      latestCurrentPage += 1;
      if (latestCurrentPage <= latestTotalPage) {
        final favResponse = await apiService.getFavList(
            Modular.get<StoreApp>().userProfile.id, latestCurrentPage);
        if (refresh) {
          _boxFav.delete();
        }
        if (favResponse.error == null) {
          latestTotalPage = favResponse.body.lastPage;
          final favItems = favResponse.body.product.toList();
          _boxFav.addAll(favItems);
        } else {
          favs = ObservableList.of([]);
        }
      }
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }
}
