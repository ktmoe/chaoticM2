import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:m2mobile/models/product.dart';

class BoxFav implements Disposable {
  @override
  void dispose() {
    _box.close();
  }

  Box<Product> _box;

  static var key = "favBox";

  static BoxFav _instance;

  BoxFav._(this._box);

  static Future<BoxFav> create() async {
    return _instance ??= BoxFav._(await Hive.openBox(key));
  }

  ValueListenable<Box<Product>> get listenable => _box.listenable();

  Future<void> addAll(List<Product> favs) async {
    for (final fav in favs) {
      await add(fav);
    }
  }

  Future<void> add(Product product) async {
    await _box.put(product.productId, product);
  }

  Future<void> remove(Product product) async {
    await _box.delete(product.productId);
  }

  void delete() => _box.deleteAll(_box.keys);
}
