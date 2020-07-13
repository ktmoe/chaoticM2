import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:m2mobile/data/dummy/vos/user_profile.dart';

class AppBox implements Disposable {
  static const String _name = "app-box-key";

  static const String firstTimeKey = "first-time-key";

  static const String userProfileKey = "user-profile-key";

  final Box _box;
  AppBox._(this._box);

  static Future<AppBox> create() async {
    return AppBox._(await Hive.openBox(_name));
  }

  ValueListenable<Box> get listenable => _box.listenable();

  Future changeFirstTime(bool isFirstTime) async {
    await _box.put(firstTimeKey, isFirstTime);
  }

  bool getIsFirstTime() {
    return _box.get(firstTimeKey) ?? true;
  }

  Future saveUserProfile(UserProfile userProfile) async {
    await _box.put(userProfileKey, userProfile);
  }

  UserProfile getUserProfile() {
    return _box.get(userProfileKey) ?? UserProfile();
  }

  Future clear() async {
    await _box.clear();
  }

  @override
  void dispose() {
    _box.close();
  }
}
