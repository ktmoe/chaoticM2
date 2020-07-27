import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:m2mobile/models/help.dart';

class BoxHelp implements Disposable {
  @override
  void dispose() {
    _box.close();
  }

  Box<Help> _box;

  static var key = "helpBox";

  static String infoKey = "helpInfo";

  static BoxHelp _instance;

  BoxHelp._(this._box);

  //static BoxProduct get instance => _instance;

  static Future<BoxHelp> create() async {
    return _instance ??= BoxHelp._(await Hive.openBox(key));
  }

  ValueListenable<Box<Help>> get listenable => _box.listenable();

  Future save(Help help) async {
    await _box.put(infoKey, help);
  }

  void delete() => _box.delete(infoKey);
}
