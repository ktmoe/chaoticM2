import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:m2mobile/models/sub_category.dart';

class BoxSubCategory implements Disposable {
  Box<SubCategory> _box;

  static var key = "subCategoryBox";

  static BoxSubCategory _instance;

  BoxSubCategory._(this._box);

  static Future<BoxSubCategory> create() async {
    return _instance ??= BoxSubCategory._(await Hive.openBox(key));
  }

  ValueListenable<Box<SubCategory>> get listenable => _box.listenable();

  @override
  void dispose() {
    _box.close();
  }

  Future saveAll(List<SubCategory> subCategories) async {
    for (final sc in subCategories) {
      await save(sc);
    }
  }

  List<SubCategory> getAllSCategories() {
    List<SubCategory> subCategories = [];
    _box.keys.forEach((key) {
      subCategories.add(_box.get(key));
    });
    return subCategories;
  }

  Future save(SubCategory subCategory) async {
    await _box.put(subCategory.id, subCategory);
  }

  void deleteAll() => _box.deleteAll(_box.keys);
}
