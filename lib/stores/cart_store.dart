import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/boxes/box_cart.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/models/cart_item.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/models/requests/add_to_cart_request.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  final api = Modular.get<ApiService>();

  ObservableList<Product> cartItems = ObservableList.of([]);

  @observable
  String error = "";

  _CartStore._();

  AppBox appBox;

  BoxCart _box;

  _CartStore(){
    init();
  }

  @action
  void updateCart(){
    cartItems = ObservableList.of(_box.listenable.value.values.toList());
  }

  @action
  Future init() async {
    print("cart store init get called");
    appBox = await AppBox.create();
    _box = await BoxCart.create();
    updateCart();
    _box.listenable.addListener(updateCart);
    fetchCartItems(refresh: true);
  }

  Future addToCart(Product product) async{
    try{
      final item = CartItem((b)=>b..quantity = 1..productid = product.productId..customerid = appBox.getUserProfile().id);
      final addToCartRequest = AddToCartRequest((b)=>b..cartItem.productid = product.productId..cartItem.customerid = appBox.getUserProfile().id
        ..cartItem.quantity = 1);
      api.addToCart(addToCartRequest.toJson());
    }catch(e){
      print("add to cart error => ${e.toString()}");
    }
  }


  @action
  Future fetchCartItems({bool refresh = false}) async{
    try {
      String userId = appBox.getUserProfile().id;
      final response = await api.getCartList(userId);
      final cartItems = response.body.product.toList();
      if (refresh) _box.delete();
      _box.addAll(cartItems);
    } catch (e) {
      if(kDebugMode)  print("error in product cart store => ${e.toString()}");
    }
  }

}
