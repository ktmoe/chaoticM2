import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:m2mobile/models/ads.dart';

class BoxAds implements Disposable {
  Box<Ads> _box;

  static var key = "adsBox";

  static BoxAds _instance;

  BoxAds._(this._box);

  static Future<BoxAds> create() async {
    return _instance ??= BoxAds._(await Hive.openBox(key));
  }

  ValueListenable<Box<Ads>> get listenable => _box.listenable();

  @override
  void dispose() {
    _box.close();
  }

  Future saveAll(List<Ads> ads) async {
    for (final c in ads) {
      await save(c);
    }
  }

  List<Ads> getAllAds() {
    List<Ads> ads = [];
    _box.keys.forEach((key) {
      ads.add(_box.get(key));
    });
    return ads;
  }

  Future save(Ads ads) async {
    await _box.put(ads.id, ads);
  }

  void deleteAll() => _box.deleteAll(_box.keys);
}
