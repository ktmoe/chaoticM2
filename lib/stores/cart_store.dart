import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/boxes/box_cart.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/models/requests/add_to_cart_request.dart';
import 'package:m2mobile/models/requests/delete_cart_items_request.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  final api = Modular.get<ApiService>();

  ObservableList<Product> cartItems = ObservableList.of([]);

  @observable
  String error = "";

  AppBox appBox;

  BoxCart _box;

  _CartStore() {
    init();
  }

  @action
  void updateCart() {
    print("cart items in box updated");
    cartItems = ObservableList.of(_box.listenable.value.values.toList());
  }

  @computed
  int get cartCount => cartItems.isEmpty ? 0 : cartItems.length;

  @computed
  int get amount => cartItems.fold(
      0, (val, cartItem) => val + (cartItem.price * cartItem.quantity));

  @computed
  double get tax => (amount / 100) * 10;

  @computed
  double get total => amount + tax;

  @action
  Future init() async {
    print("cart store init get called");
    appBox = await AppBox.create();
    _box = await BoxCart.create();
    updateCart();
    _box.listenable.addListener(updateCart);
    fetchCartItems(refresh: true);
  }

  @action
  bool containsInList(Product product) {
    bool found = false;
    print("added item id => ${product.productId}");
    cartItems.toList().forEach((item) {
      print("cart items id => ${item.productId}");
      if (item.productId == product.productId) {
        found = true;
      }
    });
    return found;
  }

  @action
  Future addToCart(Product product) async {
    try {
      //final item = CartItem((b)=>b..quantity = 1..productid = product.productId..customerid = appBox.getUserProfile().id);
      final addToCartRequest = AddToCartRequest((b) => b
        ..cartItem.productid = product.productId
        ..cartItem.customerid = appBox.getUserProfile().id
        ..cartItem.quantity = 1);
      api.addToCart(addToCartRequest.toJson());
      fetchCartItems(refresh: true);
    } catch (e) {
      print("add to cart error => ${e.toString()}");
    }
  }

  @action
  Future fetchCartItems({bool refresh = false}) async {
    print("fetch all cart items get called");
    try {
      String userId = appBox.getUserProfile().id;
      final response = await api.getCartList(userId);
      final cartItems = response.body.product.toList();
      if (refresh) _box.delete();
      _box.addAll(cartItems);
    } catch (e) {
      if (kDebugMode) print("error in product cart store => ${e.toString()}");
    }
  }

  @action
  Future updateCartItemQty(String cartId, String updateItem) async {
    try {
      await api.updateCart(cartId, updateItem);
    } catch (e) {
      print("update cart error => ${e.toString()}");
    }
  }

  @action
  int getProductCountById(String id) {
    final count = cartItems
        .toList()
        .singleWhere((product) => product.productId == id)
        .quantity;
    print("count by item id => $count");
    return count;
  }

  @action
  Future removeItemFromCart(String id) async {
    try {
      DeleteCartListRequest request =
          DeleteCartListRequest((b) => b..cartIdList.add(id));
      print("nums of item to delete => ${request.cartIdList.length}");
      await api.deleteCartItems(request.toJson());
    } catch (e) {
      print("remove from cart err => ${e.toString()}");
    }
  }
}
