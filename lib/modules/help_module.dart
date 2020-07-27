import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/main/more/help/help_widget.dart';
import 'package:m2mobile/stores/store_help.dart';

class HelpModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => StoreHelp())];

  @override
  List<Router> get routers =>
      [Router(Modular.initialRoute, child: (_, args) => HelpWidget())];
}
