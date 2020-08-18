import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:m2mobile/models/responses/noti.dart';

class BoxNoti implements Disposable{

  Box<Noti> _box;

  static var key = "notiBox";

  static BoxNoti _instance;

  BoxNoti._(this._box);

  static Future<BoxNoti> create() async {
    return _instance ??= BoxNoti._(await Hive.openBox(key));
  }

  ValueListenable<Box<Noti>> get listenable => _box.listenable();

  @override
  void dispose() {
   _box.close();
  }

  Future saveAll(List<Noti> notis) async {
    for (final c in notis) {
      await save(c);
    }
  }

  List<Noti> getAllNotis() {
    List<Noti> notis = [];
    _box.keys.forEach((key) {
      notis.add(_box.get(key));
    });
    return notis;
  }

  Future save(Noti noti) async {
    await _box.put(noti.id, noti);
  }

  void deleteAll() => _box.deleteAll(_box.keys);

}