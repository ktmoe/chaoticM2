import 'package:mobx/mobx.dart';
import 'package:m2mobile/models/product.dart';
part 'store_cart.g.dart';

class StoreCart = _StoreCartBase with _$StoreCart;

abstract class _StoreCartBase with Store {
  @observable
  bool showSelect = false;

  @observable
  ObservableMap<Product, int> cartProducts = ObservableMap.of({});

  @observable
  ObservableList<Product> selectedProducts = ObservableList.of([]);

  @computed
  int get cartCount => cartProducts.isNotEmpty ? cartProducts.length : 0;

  @computed
  int get amount {
    int amount = 0;
    if (cartProducts.isNotEmpty) {
      cartProducts.keys.forEach((product) {
        amount += product.price * cartProducts[product];
      });
    }
    return amount;
  }

  @computed
  double get tax => (amount / 100) * 10;

  @computed
  double get total => amount + tax;

  @action
  void addToCart(Product product) {
    cartProducts.containsKey(product)
        ? cartProducts.update(product, (value) => ++value)
        : cartProducts.putIfAbsent(product, () => 1);
  }

  @action
  void removeFromCart(Product product, {bool all = false}) {
    all
        ? cartProducts.remove(product)
        : cartProducts[product] == 1
            ? cartProducts.remove(product)
            : cartProducts.update(product, (value) => --value);
  }
}
