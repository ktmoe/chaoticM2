import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/utils/connectivity_service.dart';
import 'package:package_info/package_info.dart';

part 'store_app.g.dart';

class StoreApp = _StoreApp with _$StoreApp;

abstract class _StoreApp with Store {
  AppBox _appBox;

  final ApiService _apiService = Modular.get<ApiService>();

  @observable
  ObservableStream<bool> connectivity =
      ObservableStream(Modular.get<ConnectivityService>().connectivityStream);

  @computed
  bool get isNetworkOn => connectivity.value;

  @computed
  String get connectivityMessage => connectivity.hasError || !connectivity.value
      ? "You're offline"
      : "You're online";

  @observable
  AppException exception;

  @observable
  Observable<bool> forceUpdate;

  @observable
  bool isFirstTime;

  @observable
  Language chosenLanguage;

  @action
  void changeLanguagePref() {
    print("will change language");
    _appBox.changeIsUnicode(!_appBox.getIsUnicode());
  }

  bool isLoggedIn = false;

  @action
  Future init() async {
    _appBox = await AppBox.create();
    _appBox.listenable.addListener(() {
      _appBoxChanged();
    });
    readIsFirstTime();
    readIsUnicode();
  }

  @action
  Future checkForceUpdate() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final versionCode = packageInfo.buildNumber;

    final forceUpdateResponse = (Platform.isAndroid)
        ? await _apiService.forceUpdateAndroid(int.parse(versionCode))
        : await _apiService.forceUpdateIOS(int.parse(versionCode));

    forceUpdate = Observable(forceUpdateResponse.body.forceUpdate.forceUpdate);
    // forceUpdate = Observable(true);
  }

  @action
  void _appBoxChanged() {
    isFirstTime = _appBox.listenable.value.get(AppBox.firstTimeKey);
    chosenLanguage = _appBox.listenable.value.get(AppBox.isUnicodeKey)
        ? Language.Unicode
        : Language.Zawgyi;
  }

  @action
  void readIsFirstTime() {
    print("isFirstTime read");
    isFirstTime = _appBox.getIsFirstTime() ?? true;
  }

  @action
  void readIsUnicode() {
    chosenLanguage = _appBox.getIsUnicode()
        ? Language.Unicode
        : Language.Zawgyi ?? Language.Unicode;
  }

  //Call this method after Selecting Language
  @action
  Future changeFirstTime() async {
    if (isFirstTime) {
      await _appBox.changeFirstTime(false);
    }
  }

  @action
  void dispose() {
    _appBox.dispose();
  }
}

enum Language { Zawgyi, Unicode }
