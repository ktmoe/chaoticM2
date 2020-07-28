import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/models/user_profile.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:mobx/mobx.dart';
part 'authenticate_store.g.dart';

class AuthenticateStore = _AuthenticateStoreBase with _$AuthenticateStore;

abstract class _AuthenticateStoreBase with Store {
  AppBox _appBox;

  @observable
  Observable<int> page = Observable(0);

  @action
  void changePage() => page = Observable(1);

  @observable
  Country countryCode = Country.MM;

  @observable
  String phone = "";

  @observable
  String validOtp = "";

  @observable
  String inputOtp = "";

  @observable
  Observable<UserProfile> userProfile = Observable(null);

  @observable
  AppException exception;

  @computed
  String get fullPhone => "+" + countryCode.dialingCode + phone;

  @computed
  bool get validPhone => countryCode != null && phone.trim().isNotEmpty;

  @action
  Future init() async {
    _appBox = await AppBox.create();
  }

  @action
  Future savePhoneNumber() async {
    await _appBox.savePhoneNumber(fullPhone);
  }

  @action
  void dispose() {
    _appBox.dispose();
  }
}
