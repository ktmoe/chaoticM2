import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/main/cart/cart_widget.dart';
import 'package:m2mobile/modules/order_module.dart';

class CartModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (context, args) => CartWidget(isSummary: args.data as bool)),
        Router('/order', module: OrderModule())
      ];
}
