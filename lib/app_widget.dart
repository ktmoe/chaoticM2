import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/stores/store_app.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _appStore = Modular.get<StoreApp>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return MaterialApp(
            navigatorKey: Modular.navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'M2Mobile',
            initialRoute: '/',
            onGenerateRoute: Modular.generateRoute,
            theme: ThemeData(
                fontFamily: (_appStore.chosenLanguage == Language.Unicode)
                    ? 'MyFlutterApp'
                    : 'Zawgyi',
                primaryColor: Color(0xFFF47208),
                accentColor: Color(0xFFFE9F1B),
                scaffoldBackgroundColor: Color(0xFFE4E4E4),
                iconTheme: IconThemeData(color: Color(0xFFF47208)),
                buttonColor: Color(0xFFFE9F1B)));
      },
    );
  }
}
