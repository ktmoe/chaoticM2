import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/models/user_profile.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:mobx/mobx.dart';
part 'authenticate_store.g.dart';

class AuthenticateStore = _AuthenticateStoreBase with _$AuthenticateStore;

abstract class _AuthenticateStoreBase with Store {
  final ApiService _apiService = Modular.get<ApiService>();
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

  @observable
  bool duplicatePhone;

  @computed
  String get fullPhone =>
      phone.startsWith('09') ? '+95${phone.substring(1)}' : '+95$phone';

  @computed
  bool get validPhone => countryCode != null && phone.trim().isNotEmpty;

  @action
  Future init() async {
    _appBox = await AppBox.create();
  }

  @action
  Future savePhoneNumber() async {
    final tosave = phone.startsWith('09') ? phone : '0$phone';
    await _appBox.savePhoneNumber(tosave);
  }

  @action
  Future checkDuplicatePhoneNumber() async {
    final tocheck = phone.startsWith('09') ? phone : '0$phone';
    final response = await _apiService.checkDuplicatePhoneNumber(tocheck);
    duplicatePhone = response.body.data;
  }

  @action
  void dispose() {
    _appBox.dispose();
  }
}
