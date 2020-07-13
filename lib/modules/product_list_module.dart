import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/main/categories/product_list/product_list_widget.dart';

class ProductListModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ProductListWidget(
                  productName: args.data as ProductNameArgs,
                )),
      ];
}
