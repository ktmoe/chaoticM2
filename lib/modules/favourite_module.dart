import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/main/more/favourite/favourite_widget.dart';
import 'package:m2mobile/stores/store_fav.dart';

class FavouriteModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => StoreFav())];

  @override
  List<Router> get routers =>
      [Router(Modular.initialRoute, child: (_, args) => FavouriteWidget())];
}
