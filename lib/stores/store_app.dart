import 'package:mobx/mobx.dart';
import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/exceptions/app_exception.dart';

part 'store_app.g.dart';

class StoreApp = _StoreApp with _$StoreApp;

abstract class _StoreApp with Store {
  AppBox _appBox;

  _StoreApp() {
    init();
  }

  @observable
  AppException exception;

  @action
  Future init() async {
    _appBox = await AppBox.create();
  }

  @action
  bool readIsFirstTime() => _appBox.getIsFirstTime();

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
