import 'package:mobx/mobx.dart';
import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/utils/connectivity_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'store_app.g.dart';

class StoreApp = _StoreApp with _$StoreApp;

abstract class _StoreApp with Store {
  AppBox _appBox;

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
  bool isFirstTime;

  @observable
  bool isLoggedIn = false;

  @action
  Future init() async {
    _appBox = await AppBox.create();
    readIsFirstTime();
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
