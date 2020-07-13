import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/main/cart/order/order_widget.dart';

class OrderModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers =>
      [Router(Modular.initialRoute, child: (_, args) => OrderWidget())];
}
