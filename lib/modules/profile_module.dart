import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/main/more/profile/edit_profile_widget.dart';
import 'package:m2mobile/pages/main/more/profile/profile_widget.dart';

class ProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProfileWidget()),
        Router("/edit_profile",
            child: (_, args) => EditProfileWidget(
                  register: args.data as bool,
                ))
      ];
}
