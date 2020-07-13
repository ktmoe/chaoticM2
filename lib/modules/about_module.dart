import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/main/more/about/about_widget.dart';

class AboutModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers =>
      [Router(Modular.initialRoute, child: (_, args) => AboutWidget())];
}
