import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:mobx/mobx.dart';
part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  AppBox _appBox;

  @observable
  AppException exception;

  @observable
  Observable<bool> isFirstTime;

  @action
  Future init() async {
    _appBox = await AppBox.create();
    readIsFirstTime();
  }

  @action
  void readIsFirstTime() => isFirstTime = Observable(_appBox.getIsFirstTime());

  @action
  Future changeFirstTime() async {
    await _appBox.changeFirstTime(false);
  }

  @action
  void dispose() {
    _appBox.dispose();
  }
}
