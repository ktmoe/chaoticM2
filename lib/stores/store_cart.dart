import 'package:mobx/mobx.dart';
part 'store_cart.g.dart';

class StoreCart = _StoreCartBase with _$StoreCart;

abstract class _StoreCartBase with Store {
  @observable
  ObservableList<Map<Product, int>> cartProducts;
}
