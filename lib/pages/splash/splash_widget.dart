import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/pages/login/login_widget.dart';
import 'package:m2mobile/pages/language/language_widget.dart';
import 'package:m2mobile/stores/splash_store.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/utils/extensions.dart';

class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  SplashStore _splashStore = Modular.get<SplashStore>();
  List<ReactionDisposer> _disposers = [];

  ReactionDisposer _onFirstTimeRead() =>
      reaction<bool>((_) => _splashStore.isFirstTime.value, (firstTime) {
        Timer(Duration(seconds: 2), () {
          if (firstTime) {
            Modular.to.pushReplacementNamed(LanguageWidget.route);
            _splashStore.changeFirstTime();
          } else {
            Modular.to.pushReplacementNamed(LoginWidget.route);
          }
        });
      });

  ReactionDisposer _onException() {
    return reaction<AppException>((_) => _splashStore.exception, (e) {
      e.message.showSnackBar(context);
    });
  }

  @override
  void initState() {
    super.initState();
    _disposers.addAll([_onFirstTimeRead(), _onException()]);
    _splashStore.init();
  }

  @override
  void dispose() {
    super.dispose();
    _splashStore.dispose();
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
