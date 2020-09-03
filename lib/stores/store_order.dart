import 'package:mobx/mobx.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:m2mobile/stores/store_home.dart';
import 'package:m2mobile/stores/store_cart.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/models/user_profile.dart';
import 'package:m2mobile/models/ui_model/payment_methods_model.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/models/payloads/order_customer_info.dart';
import 'package:m2mobile/models/payloads/order_customer_info_payload.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
part 'store_order.g.dart';

class StoreOrder = _StoreOrderBase with _$StoreOrder;

abstract class _StoreOrderBase with Store {
  final StoreApp _storeApp = Modular.get<StoreApp>();
  final ApiService _apiService = Modular.get<ApiService>();

  @observable
  String phoneNumber = "";

  @observable
  String otpCode = "";

  @observable
  String address = "";

  @observable
  String selectedPaymentMethod = PaymentMethodsModel.bankPay;

  @observable
  bool showLoading = false;

  @observable
  bool orderPostSuccess = false;

  @observable
  AppException exception;

  @action
  void init() {
    final UserProfile _userProfile = _storeApp.userProfile;
    phoneNumber = _userProfile.phone;
    address = _userProfile.address;
  }

  @action
  Future<void> postOrder() async {
    showLoading = true;
    orderPostSuccess = false;
    try {
      final response =
          await _apiService.postOrder(_getOrderCustomerInfoPayload().toJson());
      if (response.body.message.toLowerCase() == "success") {
        Modular.get<StoreHome>().selectedOrderId =
            response.body.wrapper.order.id;
        showLoading = false;
        orderPostSuccess = true;
      }
    } catch (e) {
      showLoading = false;
      exception = AppException(message: e.toString());
    }
  }

  @action
  OrderCustomerInfoPayload _getOrderCustomerInfoPayload() {
    var _orderCustomerInfo = OrderCustomerInfo((b) {
      b.customerid = Modular.get<StoreApp>().userProfile.id;
      b.phone = phoneNumber;
      b.address = address;
      b.tax = Modular.get<StoreCart>().tax.toInt();
    });
    var _orderCustomerInfoPayload = OrderCustomerInfoPayload((b) {
      b.orderCustomerInfo = _orderCustomerInfo.toBuilder();
    });
    return _orderCustomerInfoPayload;
  }
}
