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

  void addAll(List<Product> favs) {
    for (final fav in favs) {
      _box.add(fav);
    }
  }

  void delete() => _box.delete(_box.keys);
}
