import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/modules/about_module.dart';
import 'package:m2mobile/modules/help_module.dart';
import 'package:m2mobile/modules/profile_module.dart';
import 'package:m2mobile/modules/product_detail_module.dart';
import 'package:m2mobile/modules/product_list_module.dart';
import 'package:m2mobile/modules/settings_module.dart';
import 'package:m2mobile/pages/main/main_widget.dart';
import 'package:m2mobile/modules/cart_module.dart';
import 'package:m2mobile/modules/notification_module.dart';
import 'package:m2mobile/modules/favourite_module.dart';
import 'package:m2mobile/modules/order_list_module.dart';
import 'package:m2mobile/stores/store_home.dart';
import 'package:m2mobile/stores/store_cart.dart';
import 'package:m2mobile/stores/store_order.dart';

class MainScreenModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StoreHome()),
        Bind((i) => StoreCart()),
        Bind((i) => StoreOrder())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, __) => MainWidget()),
        Router('/more/profile', module: ProfileModule()),
        Router('/more/favourite', module: FavouriteModule()),
        Router('/more/order_list', module: OrderListModule()),
        Router('/more/help', module: HelpModule()),
        Router('/more/about', module: AboutModule()),
        Router('/more/settings', module: SettingsModule()),
        Router('/categories/product_list', module: ProductListModule()),
        Router('/product_detail', module: ProductDetailModule()),
        Router('/cart', module: CartModule()),
        Router('/notification', module: NotificationModule())
      ];
}
