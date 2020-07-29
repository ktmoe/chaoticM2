import 'package:mobx/mobx.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/models/user_profile.dart';
part 'store_order.g.dart';

class StoreOrder = _StoreOrderBase with _$StoreOrder;

abstract class _StoreOrderBase with Store {
  final StoreApp _storeApp = Modular.get<StoreApp>();

  @observable
  String phoneNumber;

  @observable
  String otpCode;

  @observable
  String address;

  @observable
  String selectedPaymentMethod = '';

  @action
  void init() {
    final UserProfile _userProfile = _storeApp.userProfile;
    phoneNumber = _userProfile.phone;
    address = _userProfile.address;
  }
}
