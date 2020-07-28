import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m2mobile/custom_widgets/one_call_away_widget.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/pages/main/main_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/pages/authenticate/authenticate_widget.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/res/styles.dart';
import 'package:m2mobile/stores/store_login.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:m2mobile/utils/constants.dart';
import 'package:m2mobile/res/strings.dart';

class LoginWidget extends StatefulWidget {
  static const route = "/login";
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final StoreApp _storeApp = Modular.get<StoreApp>();
  final StoreLogin _storeLogin = Modular.get<StoreLogin>();
  final _phoneFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

  bool _obscure = true;

  List<ReactionDisposer> _disposers = [];

  ReactionDisposer _onAppException() =>
      reaction<AppException>((_) => _storeLogin.exception, (e) {
        context.successFailDialog(dialogType: e.message);
      });

  ReactionDisposer _onLoadingApiChanged() {
    return reaction<bool>((_) => _storeLogin.loadingApi, (loading) {
      if (loading) {
        context.loadingDialog();
      } else {
        Navigator.of(context).pop();
      }
    });
  }

  ReactionDisposer _onUserProfileChanged() {
    return reaction<bool>((_) => _storeApp.isLoggedIn, (loggedin) async {
      if (loggedin) {
        await context.successFailDialog(
            dialogType: "Logged in as ${_storeApp.userProfile.name}",
            success: true);
        Modular.to.pushReplacementNamed(MainWidget.route);
      }
    });
  }

  ReactionDisposer _onConnectivityChanged() => autorun((_) {
        if (!_storeApp.isNetworkOn)
          "You are offline.".makeSnack(_scaffoldState);
      });

  @override
  void initState() {
    super.initState();
    _disposers.addAll([
      _onConnectivityChanged(),
      _onAppException(),
      _onLoadingApiChanged(),
      _onUserProfileChanged()
    ]);
    _storeLogin.init();
  }

  @override
  void dispose() {
    super.dispose();
    _disposers.forEach((element) {
      element();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        margin: const EdgeInsets.symmetric(horizontal: Dimens.marginLarge),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SvgPicture.asset(
                  "lib/res/svgs/m2_logo.svg",
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                Container(
                  padding: const EdgeInsets.only(top: Dimens.marginLarge),
                  child: Text(
                    'Welcome! Signin to continue.',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: Dimens.textHeading1x,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: Dimens.marginLarge,
                ),
                _buildMobileNumberField(),
                const SizedBox(
                  height: Dimens.marginMedium2,
                ),
                _buildPasswordField(),
                const SizedBox(
                  height: Dimens.marginLargeX,
                ),
                _buildLoginBtn(),
                _buildForgotPassword()
              ],
            ),
            _buildSignUpText()
          ],
        )),
      ),
    );
  }

  Widget _buildMobileNumberField() => Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimens.marginLarge),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          controller: _phoneFieldController,
          keyboardType: TextInputType.number,
          maxLength: maxPhoneLength,
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
              hintText: "Mobile Number",
              errorText: _phoneFieldController.text.isEmpty
                  ? Strings.errorTextFieldEmpty
                  : null),
          validator: (value) => (value.isEmpty || value == null)
              ? Strings.errorTextFieldEmpty
              : null,
          onChanged: (value) {
            _storeLogin.phone = value;
          },
          onFieldSubmitted: (value) {
            _storeLogin.phone = value;
            FocusScope.of(context).nextFocus();
          },
        ),
      );

  Widget _buildPasswordField() => Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimens.marginLarge),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          controller: _passwordFieldController,
          obscureText: _obscure,
          decoration: InputDecoration(
              hintText: "Password",
              errorText: _passwordFieldController.text.isEmpty
                  ? Strings.errorTextFieldEmpty
                  : null,
              suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                  child: _obscure
                      ? Icon(M2Icon.visibility_off)
                      : Icon(M2Icon.visibility))),
          validator: (value) => (value.isEmpty || value == null)
              ? Strings.errorTextFieldEmpty
              : null,
          onChanged: (value) {
            _storeLogin.password = value;
          },
          onFieldSubmitted: (value) {
            _storeLogin.password = value;
            FocusScope.of(context).nextFocus();
          },
        ),
      );

  Widget _buildLoginBtn() => RaisedButton(
        shape: Styles.m2ButtonShape,
        padding: const EdgeInsets.only(
            left: Dimens.marginLargeX, right: Dimens.marginLargeX),
        color: Theme.of(context).buttonColor,
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        onPressed: () async {
          await _storeLogin.login();
        },
        child: const Text("Login"),
      );

  Widget _buildSignUpText() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: Dimens.marginLarge),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "I am new User. ",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Dimens.textRegular2x),
              ),
              InkWell(
                  onTap: () {
                    Modular.to.pushReplacementNamed(AuthenticateWidget.route);
                  },
                  child: Text(
                    "Sign Up.",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimens.textRegular2x),
                  )),
            ],
          ),
        ),
      );

  Widget _buildForgotPassword() => Align(
        alignment: Alignment.centerRight,
        child: Container(
            margin: const EdgeInsets.only(top: Dimens.marginMedium2),
            child: InkWell(
                onTap: () async {
                  final yes = await context.standardWarningDialog(
                      dialogType: WarningDialogType.forgotPasswordDialog);
                  if (yes) {
                    await _phoneCallWorks();
                  }
                },
                child: const Text("Forgot Password?"))),
      );

  Future<void> _phoneCallWorks() async {
    final status = await Permission.phone.status;
    if (!status.isGranted) {
      await _requestAndMakeCall();
    } else {
      await launch('tel:09790428136');
    }
  }

  Future<void> _requestAndMakeCall() async {
    final newStatus = await Permission.phone.request();
    if (newStatus.isGranted) {
      await launch('tel:09790428136');
    }
  }
}
