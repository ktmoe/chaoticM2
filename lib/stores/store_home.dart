import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:m2mobile/boxes/box_products.dart';
import 'package:m2mobile/boxes/discount_products_box.dart';
import 'package:m2mobile/boxes/box_fav_products.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:m2mobile/models/payloads/favorite_item_payload.dart';
import 'package:m2mobile/models/payloads/favorite_item.dart';
import 'package:mobx/mobx.dart';

part 'store_home.g.dart';

class StoreHome = _StoreHome with _$StoreHome;

abstract class _StoreHome with Store {
  final ApiService _api = Modular.get<ApiService>();

  BoxProduct _boxProduct;
  DiscountProductBox _discountProductBox;
  BoxFav _boxFav;

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
    _boxFav = await BoxFav.create();
    updateProducts();
    updateDiscountProducts();
    _boxProduct.listenable.addListener(updateProducts);
    _discountProductBox.listenable.addListener(updateDiscountProducts);
    Future.wait([getLatestProducts(), getDiscountProducts()]);
  }

  @action
  void updateProducts() {
    products = ObservableList.of(_boxProduct.listenable.value.values);
  }

  @action
  void updateDiscountProducts() {
    discountProducts =
        ObservableList.of(_discountProductBox.listenable.value.values);
  }

  @action
  Future getLatestProducts({bool refresh = true}) async {
    try {
      final productResponse =
          await _api.getLatestProducts(Modular.get<StoreApp>().userProfile.id);
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
      final productResponse = await _api
          .getDiscountProducts(Modular.get<StoreApp>().userProfile.id);
      final products = productResponse.body.product.toList();
      if (refresh && _discountProductBox != null)
        _discountProductBox.deleteAll();
      _discountProductBox.saveAll(products);
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }

  @action
  Future operateFavorite(Product product) async {
    try {
      final userId = Modular.get<StoreApp>().userProfile.id;

      final favoriteItem = FavoriteItem((b) {
        b.customerid = userId;
        b.productid = product.productId;
      });
      final payload = FavoriteItemPayload((builder) {
        builder.favoriteItem = favoriteItem.toBuilder();
      });

      final favoriteOperateResponse = await _api.addToFav(payload.toJson());
      Modular.get<Logger>().d(
          "body ${favoriteOperateResponse.body}\n error ${favoriteOperateResponse.error}");

      // if (favoriteOperateResponse.body.message.toLowerCase() == "success") {
      //   _onFavoriteSyncProducts(product);
      // }
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }

  @action
  Future<void> _onFavoriteSyncProducts(Product product) async {
    final renewedProduct = product.rebuild((b) => b.favorite = !b.favorite);
    Modular.get<Logger>().d(renewedProduct.toString());
    await _syncFavoriteBox(renewedProduct);
    if (product.discountPrice != null) {
      _discountProductBox.save(renewedProduct);
    } else {
      _boxProduct.save(renewedProduct);
    }
  }

  @action
  Future _syncFavoriteBox(Product product) async {
    if (product.favorite) {
      await _boxFav.add(product);
    } else {
      await _boxFav.remove(product);
    }
  }
}
