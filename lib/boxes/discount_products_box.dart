import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:m2mobile/models/product.dart';

class DiscountProductBox implements Disposable {
  @override
  void dispose() {
    _box.close();
  }

  Box<Product> _box;

  static var key = "DiscountProductBox";

  static DiscountProductBox _instance;

  DiscountProductBox._(this._box);

  static Future<DiscountProductBox> create() async {
    return _instance ??= DiscountProductBox._(await Hive.openBox(key));
  }

  ValueListenable<Box<Product>> get listenable => _box.listenable();

  void save(Product data) {
    _box.put(data.productId, data);
  }

  void saveAll(List<Product> products) {
    products.forEach((element) {
      save(element);
    });
  }

  List<Product> getAllProducts() {
    List<Product> products = [];
    _box.keys.forEach((key) {
      products.add(_box.get(key));
    });
    return products;
  }

  void deleteAll() => _box.deleteAll(_box.keys);
}
