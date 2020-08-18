import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/box_products.dart';
import 'package:m2mobile/boxes/discount_products_box.dart';
import 'package:m2mobile/boxes/box_fav_products.dart';
import 'package:m2mobile/boxes/box_products_by_category.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/models/responses/favorite_id.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:m2mobile/models/payloads/favorite_item_payload.dart';
import 'package:m2mobile/models/payloads/delete_favorite_item_payload.dart';
import 'package:m2mobile/models/payloads/favorite_item.dart';
import 'package:m2mobile/stores/store_search.dart';
import 'package:mobx/mobx.dart';

part 'store_home.g.dart';

class StoreHome = _StoreHome with _$StoreHome;

abstract class _StoreHome with Store {
  final ApiService _api = Modular.get<ApiService>();

  BoxProduct _boxProduct;
  DiscountProductBox _discountProductBox;
  BoxFav _boxFav;
  BoxProductByCategory _boxProductByCategory;

  @observable
  AppException exception;

  @observable
  int latestCurrentPage = 0;

  @observable
  int latestTotalPage = 1;

  @observable
  ObservableList<Product> products = ObservableList.of([]);

  @observable
  ObservableList<Product> discountProducts = ObservableList.of([]);

  @observable
  String selectedOrderId;

  @action
  Future init() async {
    _boxProduct = await BoxProduct.create();
    _discountProductBox = await DiscountProductBox.create();
    _boxFav = await BoxFav.create();
    _boxProductByCategory = await BoxProductByCategory.create();

    updateProducts();
    updateDiscountProducts();
    _boxProduct.listenable.addListener(updateProducts);
    _discountProductBox.listenable.addListener(updateDiscountProducts);
    await getDiscountProducts();
    await getLatestProducts(true);
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
  Future getLatestProducts(bool refresh) async {
    if (refresh) {
      latestCurrentPage = 0;
    }
    try {
      latestCurrentPage += 1;
      if (latestCurrentPage <= latestTotalPage) {
        final productResponse = await _api.getLatestProducts(
            customerId: Modular.get<StoreApp>().userProfile.id,
            currentPage: latestCurrentPage);
        latestTotalPage = productResponse.body.lastPage;
        final products = productResponse.body.product.toList();
        if (refresh && _boxProduct != null) _boxProduct.deleteAll();
        _boxProduct.saveAll(products);
      }
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
      final favoriteOperateResponse = ((product.favoriteId ?? "").isEmpty)
          ? await _api.addToFav(_getFavoriteItemPayload(product).toJson())
          : await _api
              .deleteFavorite(_getDeleteFavoriteItemPayload(product).toJson());
      if (favoriteOperateResponse.body.message.toLowerCase() == "success") {
        _onFavoriteSyncProducts(
            product, favoriteOperateResponse.body.favoriteId?.first);
      }
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }

  @action
  FavoriteItemPayload _getFavoriteItemPayload(Product product) {
    final favoriteItem = FavoriteItem((b) {
      b.customerid = Modular.get<StoreApp>().userProfile.id;
      b.productid = product.productId;
    });
    final payload = FavoriteItemPayload((builder) {
      builder.favoriteItem = favoriteItem.toBuilder();
    });
    return payload;
  }

  @action
  DeleteFavoriteItemPayload _getDeleteFavoriteItemPayload(Product product) {
    final payload = DeleteFavoriteItemPayload((b) {
      b.favoriteId = product.favoriteId;
    });
    return payload;
  }

  @action
  Future<void> _onFavoriteSyncProducts(
      Product product, FavoriteId favoriteId) async {
    final renewedProduct = product.rebuild((b) => b
      ..favorite = favoriteId == null ? false : true
      ..favoriteId = favoriteId == null ? "" : favoriteId.id);
    await _syncFavoriteBox(renewedProduct);
    //for discount products to be reactive
    if (product.discountPrice != 0) {
      _discountProductBox.save(renewedProduct);
    }
    //for latest products to be reactive
    if (_boxProduct.contain(product)) {
      _boxProduct.save(renewedProduct);
    }
    //for products by category to be reactive
    if (_boxProductByCategory.contain(product)) {
      _boxProductByCategory.save(renewedProduct);
    }
    //for searched products to be reactive
    if (Modular.get<StoreSearch>().results.isNotEmpty) {
      final searched = Modular.get<StoreSearch>().results.toList();
      if (searched.map((e) => e.productId).contains(product.productId)) {
        final index = searched
            .indexWhere((element) => element.productId == product.productId);
        searched.replaceRange(index, index + 1, [renewedProduct]);
        Modular.get<StoreSearch>().results = ObservableList.of(searched);
      }
    }
  }

  @action
  Future _syncFavoriteBox(Product product) async {
    if (product.favoriteId.isNotEmpty) {
      await _boxFav.add(product);
    } else {
      await _boxFav.remove(product);
    }
  }
}
