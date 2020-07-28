import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/models/user_profile.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
part 'store_login.g.dart';

class StoreLogin = _StoreLoginBase with _$StoreLogin;

abstract class _StoreLoginBase with Store {
  final ApiService _apiService = Modular.get<ApiService>();
  AppBox _appBox;
  @observable
  String phone = "";

  @observable
  String password = "";

  @observable
  AppException exception;

  @observable
  bool loadingApi = false;

  @observable
  bool userProfileChanged = false;

  @action
  Future init() async {
    _appBox = await AppBox.create();
    _appBox.userProfileListenable.addListener(() {
      if (_appBox.userProfileListenable.value.get(AppBox.userProfileKey) !=
          null) {
        userProfileChanged = true;
      }
    });
  }

  @action
  Future login() async {
    if (phone.isNotEmpty && password.isNotEmpty) {
      await _proceedLogin();
    } else {
      exception = AppException(message: 'Please fill in all data.');
    }
  }

  @action
  Future _proceedLogin() async {
    loadingApi = true;
    try {
      final response =
          await _apiService.login(phone: this.phone, password: this.password);
      if (response.body.data != null) {
        await _getUserProfile(response.body.data);
      } else
        throw AppException(message: 'Phone number or Password wrong.');
    } catch (e) {
      loadingApi = false;
      exception = AppException(message: e.toString());
    }
  }

  @action
  Future _getUserProfile(String id) async {
    try {
      final profile = await _apiService.customerProfile(id);
      if (profile.body.data != null) {
        loadingApi = false;
        await _refreshUserProfile(profile.body.data);
      } else
        throw AppException(message: "User id doesn't exist.");
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }

  @action
  Future _refreshUserProfile(UserProfile userProfile) async {
    final rebuilt = userProfile.rebuild((b) => b..password = this.password);
    await _appBox.saveUserProfile(rebuilt);
  }
}
