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
import 'package:m2mobile/stores/store_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:m2mobile/utils/extensions.dart';

class AuthenticateWidget extends StatefulWidget {
  static const route = "/authenticate";
  @override
  _AuthenticateWidgetState createState() => _AuthenticateWidgetState();
}

class _AuthenticateWidgetState extends State<AuthenticateWidget> {
  final _pageController = PageController();
  final AuthenticateStore _storeAuthenticate = Modular.get<AuthenticateStore>();
  final StoreApp _storeApp = Modular.get<StoreApp>();

  Future _registerUser(String mobile, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.verifyPhoneNumber(
        phoneNumber: mobile,
        timeout: Duration(seconds: 60),
        verificationCompleted: (_authCredential) async {
          _auth.signInWithCredential(_authCredential).then((_authResult) {
            if (_authResult.user != null) {
              _storeApp.isLoggedIn = true;
              Modular.to.pushReplacementNamed(EditProfileWidget.route,
                  arguments: true);
            }
          });
        },
        verificationFailed: (_authException) {
          _authException.message.showSnack(context);
        },
        codeSent: (_code, [_forceResendingToken]) {
          _storeAuthenticate.validOtp = _code;
          _nextAuth();
        },
        codeAutoRetrievalTimeout: (_code) {
          debugPrint("TimeOut...");
        });
  }

  @override
  void initState() {
    _storeAuthenticate.init();
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
                    child: _buildPageView(),
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.1),
                    child: _buildIndicators(),
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.1),
                    child: _buildAuthenticateBtn(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: Dimens.marginLarge, right: Dimens.marginLarge),
          child: Authenticate1Widget(),
        ),
        Authenticate2Widget(registerUser: _registerUser)
      ],
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget _buildIndicators() {
    return DotsIndicator(
      controller: _pageController,
      itemCount: 2,
      color: Colors.grey,
      onPageSelected: (_) => _storeAuthenticate.validPhone ? _nextAuth : null,
    );
  }

  Widget _buildAuthenticateBtn() {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      padding: const EdgeInsets.only(
          left: Dimens.marginLargeX, right: Dimens.marginLargeX),
      color: Theme.of(context).buttonColor,
      textColor: Colors.white,
      disabledTextColor: Colors.white,
      onPressed: () async {
        await _onAuthenticateBtnPressed();
      },
      child: _storeAuthenticate.page.value == 0
          ? const Text("Get OTP")
          : const Text("Verify OTP"),
    );
  }

  Future _onAuthenticateBtnPressed() async {
    if (_storeAuthenticate.page.value == 0) {
      if (_storeAuthenticate.validPhone) {
        await _registerUser(_storeAuthenticate.fullPhone, context);
        _nextAuth();
      } else {
        "Something went wrong. Please Try again.".showSnack(context);
      }
    } else
      await _verifySmsCode();
  }

  Future _verifySmsCode() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    AuthCredential _credential = PhoneAuthProvider.getCredential(
        verificationId: _storeAuthenticate.validOtp,
        smsCode: _storeAuthenticate.inputOtp);
    await _auth.signInWithCredential(_credential).then((_authResult) {
      if (_authResult.user != null) {
        _storeAuthenticate.savePhoneNumber(_storeAuthenticate.phone);
        Modular.to
            .pushReplacementNamed(EditProfileWidget.route, arguments: true);
      }
    });
  }

  void _nextAuth() {
    _storeAuthenticate.changePage();
    _pageController.animateToPage(1,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }
}
