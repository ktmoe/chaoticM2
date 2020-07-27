import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:m2mobile/models/m2_category.dart';

class BoxCategory implements Disposable {
  Box<M2Category> _box;

  static var key = "categoryBox";

  static BoxCategory _instance;

  BoxCategory._(this._box);

  static Future<BoxCategory> create() async {
    return _instance ??= BoxCategory._(await Hive.openBox(key));
  }

  ValueListenable<Box<M2Category>> get listenable => _box.listenable();

  @override
  void dispose() {
    _box.close();
  }

  Future saveAll(List<M2Category> categories) async {
    for (final c in categories) {
      await save(c);
    }
  }

  List<M2Category> getAllCategories() {
    List<M2Category> categories = [];
    _box.keys.forEach((key) {
      categories.add(_box.get(key));
    });
    return categories;
  }

  Future save(M2Category category) async {
    await _box.put(category.id, category);
  }

  void deleteAll() => _box.deleteAll(_box.keys);
}
