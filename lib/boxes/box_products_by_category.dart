import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:m2mobile/models/product.dart';

class BoxProductByCategory implements Disposable {
  Box<Product> _box;

  static var key = "productBoxByCategory";

  static BoxProductByCategory _instance;

  BoxProductByCategory._(this._box);

  static Future<BoxProductByCategory> create() async {
    return _instance ??= BoxProductByCategory._(await Hive.openBox(key));
  }

  ValueListenable<Box<Product>> get listenable => _box.listenable();

  @override
  void dispose() {
    _box.close();
  }

  void saveAll(List<Product> products) {
    products.forEach((element) {
      save(element);
    });
  }

  List<Product> getByCategory(String subcategoryId) {
    return _box.values
        .where((element) => element.subcategoryid == subcategoryId);
  }

  List<Product> getAllProducts() {
    List<Product> products = [];
    _box.keys.forEach((key) {
      products.add(_box.get(key));
    });
    return products;
  }

  void save(Product product) {
    _box.put(product.productId, product);
  }

  List<Product> getProductsBySubCategory(String subcategoryId) {
    return _box.values
        .where((element) => element.subcategoryid == subcategoryId);
  }

  bool contain(Product product) => _box.containsKey(product.productId);

  void deleteByCategory(String subcategoryId) {
    final toDelete =
        _box.values.where((element) => element.subcategoryid == subcategoryId);
    _box.deleteAll(toDelete.map((e) => e.productId));
  }

  void deleteAll() => _box.deleteAll(_box.keys);
}
