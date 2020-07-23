import 'package:flutter/material.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m2mobile/pages/main/main_widget.dart';
import 'package:m2mobile/custom_widgets/one_call_away_widget.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:mobx/mobx.dart';
import 'package:store_redirect/store_redirect.dart';

class SplashWidget extends StatefulWidget {
  static const route = "/";
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with WidgetsBindingObserver {
  final StoreApp _storeApp = Modular.get<StoreApp>();
  final List<ReactionDisposer> _disposers = [];

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _storeApp.checkForceUpdate();
    }
  }

  ReactionDisposer _onForceUpdateChanged() {
    return autorun((_) async {
      if (_storeApp.forceUpdate != null) {
        if (_storeApp.forceUpdate.value) {
          final a = await context.successFailDialog(
              dialogType: WarningDialogType.forceUpdateDialog);
          //TODO add iosAppId Here
          if (a) {
            StoreRedirect.redirect(
                androidAppId: "com.gnwt.m2mobile", iOSAppId: "");
          }
        } else {
          Future.delayed(Duration(seconds: 2)).whenComplete(() {
            try {
              Modular.to.pushReplacementNamed(MainWidget.route);
            } catch (e) {}
          });
        }
      }
    });
  }

  ReactionDisposer _onConnectivityChanged() => autorun((_) async {
        if (_storeApp.isNetworkOn != null) {
          if (!_storeApp.isNetworkOn)
            "You are offline.".showSnack(context);
          else
            await _storeApp.checkForceUpdate();
        }
      });

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _storeApp.init();
    _disposers.addAll([_onConnectivityChanged(), _onForceUpdateChanged()]);
  }

  @override
  void dispose() {
    super.dispose();
    _disposers.forEach((element) {
      element();
    });

    WidgetsBinding.instance.removeObserver(this);
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
