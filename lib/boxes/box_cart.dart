import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:m2mobile/models/product.dart';

class BoxCart implements Disposable {
  @override
  void dispose() {
    _box.close();
  }

  Box<Product> _box;

  static var key = "BoxCartBox";

  static BoxCart _instance;

  BoxCart._(this._box);

  static Future<BoxCart> create() async {
    return _instance ??= BoxCart._(await Hive.openBox(key));
  }

  ValueListenable<Box<Product>> get listenable => _box.listenable();

  void save(Product data) {
    _box.put(data.cartId, data);
  }

  void addAll(List<Product> items) {
    items.forEach((element) {
      save(element);
    });
  }

  List<Product> getAll() {
    List<Product> value = [];
    _box.keys.forEach((element) {
      value.add(_box.get(element));
    });
    return value;
  }

  String getCartId(String productId) {
    return _box.values
        .firstWhere((element) => element.productId == productId)
        .cartId;
  }

  void remove(Product product) {
    final toDelete = _box.values
        .firstWhere((element) => element.productId == product.productId);
    if (toDelete != null) {
      var index = _box.values.toList().indexOf(toDelete);
      _box.deleteAt(index);
    }
  }

  void delete() {
    print("delete all get called");
    _box.deleteAll(_box.keys);
  }
}
