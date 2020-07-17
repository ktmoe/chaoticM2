import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/utils/flutter_mdetect.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:package_info/package_info.dart';

part 'store_app.g.dart';

class StoreApp = _StoreApp with _$StoreApp;

abstract class _StoreApp with Store {
  AppBox _appBox;

  final ApiService _apiService = Modular.get<ApiService>();

  @observable
  AppException exception;

  @observable
  bool forceUpdate = false;

  @observable
  bool isFirstTime;

  @observable
  Language chosenLanguage = MDetect.isUnicode()? Language.Unicode : Language.Zawgyi ?? Language.Unicode;

  @action
  void changeLanguagePref(Language language){
    chosenLanguage = (language == Language.Zawgyi)? Language.Zawgyi : Language.Unicode;
  }

  @action
  Future init() async {
    _appBox = await AppBox.create();
    readIsFirstTime();
  }

  @action
  Future checkForceUpdate() async{
    final packageInfo = await PackageInfo.fromPlatform();
   final versionCode = packageInfo.buildNumber;

    print("version code -> $versionCode");

    final forceUpdateResponse =  (Platform.isAndroid)? await _apiService.forceUpdateAndroid(int.parse(versionCode))
        : await _apiService.forceUpdateIOS(int.parse(versionCode));

    forceUpdate = forceUpdateResponse.body.forceUpdate.forceUpdate;

  }

  @action
  void readIsFirstTime() {
    isFirstTime = _appBox.getIsFirstTime();
  }

  //Call this method after Selecting Language
  @action
  Future changeFirstTime() async {
    await _appBox.changeFirstTime(false);
  }

  @action
  void dispose() {
    _appBox.dispose();
  }
}

enum Language{
  Zawgyi,Unicode
}
