import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m2mobile/pages/main/main_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/pages/authenticate/authenticate_widget.dart';

class LoginWidget extends StatefulWidget {
  static const route = "/login";
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _phoneFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.only(
              bottom: Dimens.marginMedium2,
              left: Dimens.marginLarge,
              right: Dimens.marginLarge),
          child: Column(
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
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: Dimens.marginLarge),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _phoneFieldController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: "Mobile Number",
                  ),
                  validator: (value) => (value.isEmpty || value == null)
                      ? "Should not be empty"
                      : null,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).nextFocus();
                  },
                ),
              ),
              const SizedBox(
                height: Dimens.marginMedium2,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: Dimens.marginLarge),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _passwordFieldController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                  validator: (value) => (value.isEmpty || value == null)
                      ? "Should not be empty"
                      : null,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).nextFocus();
                  },
                ),
              ),
              const SizedBox(
                height: Dimens.marginLargeX,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                padding: const EdgeInsets.only(
                    left: Dimens.marginLargeX, right: Dimens.marginLargeX),
                color: Theme.of(context).buttonColor,
                textColor: Colors.white,
                disabledTextColor: Colors.white,
                onPressed: () {
                  Modular.to.pushReplacementNamed(MainWidget.route);
                },
                child: const Text("Login"),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    margin: const EdgeInsets.only(top: Dimens.marginMedium2),
                    child: InkWell(
                        onTap: () {}, child: const Text("Forgot Password?"))),
              )
            ],
          ),
        ),
        _buildSignUpText()
      ]),
    );
  }

  Widget _buildSignUpText() => Container(
        margin: const EdgeInsets.only(bottom: Dimens.marginLarge),
        child: Align(
          alignment: Alignment.bottomCenter,
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
}
