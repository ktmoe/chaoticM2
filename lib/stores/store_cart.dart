import 'package:m2mobile/stores/store_app.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/boxes/box_cart.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/models/payloads/add_to_cart_request.dart';
import 'package:m2mobile/models/payloads/update_cart_request.dart';
import 'package:m2mobile/models/payloads/update_item.dart';
import 'package:m2mobile/models/payloads/delete_cart_items_request.dart';

part 'store_cart.g.dart';

class StoreCart = _StoreCartBase with _$StoreCart;

abstract class _StoreCartBase with Store {
  final _apiService = Modular.get<ApiService>();

  BoxCart _boxCart;

  @observable
  bool showSelect = false;

  @observable
  ObservableMap<String, Product> cartProducts = ObservableMap.of({});

  @observable
  ObservableList<String> selectedProductIds = ObservableList.of([]);

  @computed
  int get cartCount => cartProducts.isNotEmpty ? cartProducts.length : 0;

  @observable
  AppException exception;

  Future init() async {
    _boxCart = await BoxCart.create();
    _onBoxCartChanged();
    _boxCart.listenable.addListener(_onBoxCartChanged);
    await getCartItems();
  }

  @action
  void _onBoxCartChanged() {
    cartProducts = ObservableMap.of(
        {for (var p in _boxCart.listenable.value.values) p.productId: p});
  }

  @computed
  int get amount {
    int amount = 0;
    if (cartProducts.isNotEmpty) {
      cartProducts.values.forEach((product) {
        final price =
            product.discountPrice == 0 ? product.price : product.discountPrice;
        amount += price * product.quantity;
      });
    }
    return amount;
  }

  @computed
  double get tax => (amount / 100) * Modular.get<StoreApp>().companyInfo.tax;

  @computed
  double get total => amount + tax;

  @action
  Future<void> addToCart(Product product) async {
    if (cartProducts.containsKey(product.productId)) {
      final renewed =
          product.rebuild((b) => b..quantity = product.quantity + 1);
      await _apiService.updateCart(_boxCart.getCartId(renewed.productId),
          _updateCartRequest(renewed).toJson());
      _boxCart.save(renewed);
    } else {
      final response =
          await _apiService.addToCart(_addToCartRequest(product).toJson());
      final renewed = product.rebuild((b) => b
        ..quantity = 1
        ..cartId = response.body.cartItem.first.id);
      _boxCart.save(renewed);
    }
  }

  @action
  Future removeFromCart(Product product, {bool all = false}) async {
    if (all) {
      await _apiService
          .deleteCartItems(_deleteCartListRequest(product).toJson());
      _boxCart.remove(product);
    } else {
      if ((product.quantity ?? 1) > 1) {
        final renewed =
            product.rebuild((b) => b.quantity = product.quantity - 1);
        await _apiService.updateCart(_boxCart.getCartId(renewed.productId),
            _updateCartRequest(renewed).toJson());
        _boxCart.save(renewed);
      } else {
        await _apiService
            .deleteCartItems(_deleteCartListRequest(product).toJson());
        _boxCart.remove(product);
      }
    }
  }

  @action
  AddToCartRequest _addToCartRequest(Product p) => AddToCartRequest((b) => b
    ..cartItem.productid = p.productId
    ..cartItem.customerid = Modular.get<StoreApp>().userProfile.id
    ..cartItem.quantity = 1);

  @action
  UpdateCartRequest _updateCartRequest(Product p) {
    final updateItem = UpdateItem((b) => b..quantity = p.quantity);
    return UpdateCartRequest((b) => b..updateItem = updateItem.toBuilder());
  }

  @action
  DeleteCartListRequest _deleteCartListRequest(Product p) =>
      DeleteCartListRequest((b) => b
        ..customerId = Modular.get<StoreApp>().userProfile.id
        ..productIdList.add(p.productId));

  @action
  Product cartProductById(String id) {
    return cartProducts.values.firstWhere((element) => element.productId == id);
  }

  @action
  Future getCartItems() async {
    try {
      final response =
          await _apiService.getCartList(Modular.get<StoreApp>().userProfile.id);
      _boxCart.delete();
      _boxCart.addAll(response.body.product.toList());
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }

  @action
  void emptyTheCart() {
    _boxCart.delete();
  }
}
