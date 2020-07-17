import 'package:mobx/mobx.dart';
part 'store_order.g.dart';

class StoreOrder = _StoreOrderBase with _$StoreOrder;

abstract class _StoreOrderBase with Store {
  @observable
  String selectedPaymentMethod = '';
}
