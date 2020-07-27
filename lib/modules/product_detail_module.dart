import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/pages/main/product_detail/product_detail_widget.dart';

class ProductDetailModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (context, args) {
            return ProductDetailWidget(
              product: args.data as Product,
            );
          },
        )
      ];
}
