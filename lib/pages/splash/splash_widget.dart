import 'dart:async';

import 'package:flutter/material.dart';
import 'package:m2mobile/pages/login/login_widget.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m2mobile/pages/main/main_widget.dart';
import 'package:mobx/mobx.dart';

class SplashWidget extends StatefulWidget {
  static const route = "/";
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  final StoreApp _storeApp = Modular.get<StoreApp>();
  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    super.initState();
    print('Splash init');
    // _disposers.addAll([_onIsFirstTimeRead()]);
    _storeApp.init();
    Future.delayed(Duration(seconds: 1)).whenComplete(() {
      try {
        Modular.to.pushReplacementNamed(MainWidget.route);
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    super.dispose();
    _disposers.forEach((element) {
      element.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          "lib/res/svgs/m2_logo.svg",
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
