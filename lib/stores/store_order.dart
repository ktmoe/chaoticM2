import 'package:mobx/mobx.dart';
import 'package:m2mobile/models/ui_model/payment_methods_model.dart';
part 'store_order.g.dart';

class StoreOrder = _StoreOrderBase with _$StoreOrder;

abstract class _StoreOrderBase with Store {
  @observable
  String selectedPaymentMethod = PaymentMethodsModel.bankPay;
}
