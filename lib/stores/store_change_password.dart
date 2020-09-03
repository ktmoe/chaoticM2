import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/models/payloads/change_pwd_payload.dart';
import 'package:m2mobile/models/payloads/change_pwd_payload_wrapper.dart';
import 'package:m2mobile/stores/store_app.dart';

part 'store_change_password.g.dart';

class StoreChangePassword = _StoreChangePasswordBase with _$StoreChangePassword;

abstract class _StoreChangePasswordBase with Store {
  final ApiService _apiService = Modular.get<ApiService>();

  @observable
  String oldPassword = "";

  @observable
  String newPassword = "";

  @observable
  String retypePassword = "";

  @observable
  bool changePasswordSuccess;

  @computed
  bool get matchedPwd => newPassword == retypePassword;

  @computed
  bool get validate =>
      oldPassword.isNotEmpty &&
      newPassword.isNotEmpty &&
      retypePassword.isNotEmpty;

  @action
  Future changePassword() async {
    final response =
        await _apiService.changePassword(_getChangePwdPayload().toJson());
    if (response.body.message != null) {
      changePasswordSuccess = true;
    } else
      changePasswordSuccess = false;
  }

  @action
  ChangePwdPayloadWrapper _getChangePwdPayload() {
    var _changePwdPayload = ChangePwdPayload((b) {
      b.customerId = Modular.get<StoreApp>().userProfile.id;
      b.oldPassword = oldPassword;
      b.newPassword = newPassword;
    });
    var _payloadWrapper = ChangePwdPayloadWrapper((b) {
      b.changePwdPayload = _changePwdPayload.toBuilder();
    });
    return _payloadWrapper;
  }
}
