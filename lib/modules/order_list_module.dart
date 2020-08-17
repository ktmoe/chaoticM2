import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/main/more/order_list/order_list_widget.dart';
import 'package:m2mobile/pages/main/more/order_list/complete_order/complete_order_widget.dart';
import 'package:m2mobile/pages/main/more/order_list/order_detail/order_detail_widget.dart';
import 'package:m2mobile/stores/store_order_list.dart';
import 'package:m2mobile/stores/store_order_detail.dart';
import 'package:m2mobile/models/order.dart';

class OrderListModule extends ChildModule {
  @override
  List<Bind> get binds =>
      [Bind((i) => StoreOrderList()), Bind((i) => StoreOrderDetail())];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => OrderListWidget()),
        Router("/order_detail",
            child: (_, args) => OrderDetailWidget(order: args.data as Order)),
        Router("/complete_order", child: (_, args) => CompleteOrderWidget())
      ];
}
