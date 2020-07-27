import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/stores/authenticate_store.dart';
import 'package:mobx/mobx.dart';
part 'store_profile.g.dart';

class StoreProfile = _StoreProfileBase with _$StoreProfile;

abstract class _StoreProfileBase with Store {
  AppBox _appBox;
  @observable
  String name = "";

  @observable
  String imageUrl = "";

  @observable
  String phoneNo = "";

  @observable
  String address = "";

  @observable
  String password = "";

  bool hasInialized = false;

  @action
  Future init(bool isRegister) async {
    if (!hasInialized) {
      _appBox = await AppBox.create();
      if (isRegister) {
        phoneNo = Modular.get<AuthenticateStore>().phone;
      } else {
        _reloadOldProfile();
      }
      hasInialized = true;
    }
  }

  @action
  void _reloadOldProfile() {
    final profile = _appBox.getUserProfile();
    name = profile.name;
    imageUrl = profile.image;
    phoneNo = profile.phone;
    address = profile.address;
  }
}
