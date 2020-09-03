import 'package:mobx/mobx.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/stores/store_home.dart';
import 'package:m2mobile/models/order_item.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/utils/extensions.dart';

part 'store_order_detail.g.dart';

class StoreOrderDetail = _StoreOrderDetailBase with _$StoreOrderDetail;

abstract class _StoreOrderDetailBase with Store {
  ApiService _apiService = Modular.get<ApiService>();

  @observable
  ObservableList<OrderItem> orderItems = ObservableList.of([]);

  @computed
  ObservableList<Product> get productsFromOrderItmes => ObservableList.of(
      orderItems.toList().map((item) => item.productFromOrderItem));

  @computed
  int get amount {
    int amount = 0;
    if (orderItems.isNotEmpty) {
      orderItems.forEach((order) {
        amount += order.price * order.quantity;
      });
    }
    return amount;
  }

  @computed
  double get tax => (amount / 100) * Modular.get<StoreApp>().companyInfo.tax;

  @computed
  double get total => amount + tax;

  @action
  Future getOrderDetail() async {
    final response = await _apiService
        .getOrderDetail(Modular.get<StoreHome>().selectedOrderId);
    if (response.body.message.toLowerCase() == "success") {
      orderItems =
          ObservableList.of(response.body.orderItemWrapper.orderItem.toList());
    }
  }
}
