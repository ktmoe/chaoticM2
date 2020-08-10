import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
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
  Future fetchFavList({bool refresh = true}) async {
    try {
      final favResponse =
          await apiService.getFavList(Modular.get<StoreApp>().userProfile.id);
      final favItems = favResponse.body.product.toList();
      Modular.get<Logger>().i("Favorite count ${favItems.length}");
      _boxFav.delete();
      _boxFav.addAll(favItems);
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }
}
