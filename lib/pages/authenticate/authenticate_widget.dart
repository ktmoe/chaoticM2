import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/dots_indicator.dart';
import 'package:m2mobile/pages/login/login_widget.dart';
import 'package:m2mobile/pages/authenticate/authenticate1/authenticate1_widget.dart';
import 'package:m2mobile/pages/authenticate/authenticate2/authenticate2_widget.dart';
import 'package:m2mobile/pages/main/more/profile/edit_profile_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/stores/authenticate_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AuthenticateWidget extends StatefulWidget {
  static const route = "/authenticate";
  @override
  _AuthenticateWidgetState createState() => _AuthenticateWidgetState();
}

class _AuthenticateWidgetState extends State<AuthenticateWidget> {
  final _pageController = PageController();
  final _authenticateStore = Modular.get<AuthenticateStore>();

  @override
  void initState() {
    _authenticateStore.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Modular.to.pushReplacementNamed(LoginWidget.route);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Observer(
          builder: (_) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                      minHeight: MediaQuery.of(context).size.height * 0.7,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: PageView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.marginLarge,
                              right: Dimens.marginLarge),
                          child: Authenticate1Widget(),
                        ),
                        Authenticate2Widget()
                      ],
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.1),
                    child: DotsIndicator(
                      controller: _pageController,
                      itemCount: 2,
                      color: Colors.grey,
                      onPageSelected: (_) =>
                          _authenticateStore.validPhone ? _nextAuth : null,
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.1),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding: const EdgeInsets.only(
                          left: Dimens.marginLargeX,
                          right: Dimens.marginLargeX),
                      color: Theme.of(context).buttonColor,
                      textColor: Colors.white,
                      disabledTextColor: Colors.white,
                      onPressed: _onAuthenticateBtnPressed,
                      child: _authenticateStore.page.value == 0
                          ? const Text("Get OTP")
                          : const Text("Verify OTP"),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onAuthenticateBtnPressed() {
    if (_authenticateStore.page.value == 0) {
      if (_authenticateStore.validPhone) {
        _nextAuth();
      } else {}
    } else {
      debugPrint("page:  ${_authenticateStore.otp}");
      // if (_authenticateStore.otp.isNotEmpty) {
      //   if (_authenticateStore.userProfile == null)
      //     Modular.to.popAndPushNamed(EditProfileWidget.route);
      //   else
      //     Modular.to.popAndPushNamed(MainWidget.route);
      // } else {}
      Modular.to.pushReplacementNamed(EditProfileWidget.route, arguments: true);
    }
  }

  void _nextAuth() {
    _authenticateStore.changePage();
    _pageController.animateToPage(1,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }
}
