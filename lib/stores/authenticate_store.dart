import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/data/dummy/vos/user_profile.dart';
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
  String otp = "";

  @observable
  Observable<UserProfile> userProfile;

  @observable
  AppException exception;

  @computed
  Observable<String> get fullPhone =>
      Observable("+" + countryCode.dialingCode + phone);

  @computed
  bool get validPhone => countryCode != null && phone.trim().isNotEmpty;

  @action
  Future init() async {
    _appBox = await AppBox.create();
    readUserProfile();
  }

  @computed
  String get userId => userProfile.value.id;

  @action
  void readUserProfile() => userProfile = Observable(_appBox.getUserProfile());

  @action
  Future saveUserProfile(UserProfile userProfile) async {
    await _appBox.saveUserProfile(userProfile);
  }

  @action
  void dispose() {
    _appBox.dispose();
  }
}
