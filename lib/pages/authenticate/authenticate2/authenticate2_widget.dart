import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/stores/authenticate_store.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Authenticate2Widget extends StatefulWidget {
  final Function(String, BuildContext) registerUser;

  const Authenticate2Widget({Key key, this.registerUser}) : super(key: key);
  @override
  _Authenticate2WidgetState createState() => _Authenticate2WidgetState();
}

class _Authenticate2WidgetState extends State<Authenticate2Widget> {
  final _authenticateStore = Modular.get<AuthenticateStore>();
  final _optController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            "lib/res/svgs/m2_logo.svg",
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          Container(
            padding: const EdgeInsets.only(
                top: Dimens.marginLarge,
                left: Dimens.marginLarge,
                right: Dimens.marginLarge),
            child: Text(
              'We have sent an OTP to your number ${_authenticateStore.fullPhone}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: Dimens.textRegular2_5x,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: Dimens.marginLargeX,
          ),
          _optWidget(),
          const SizedBox(
            height: Dimens.marginMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(Dimens.marginMedium),
                child: Text("Didn't receive OTP?"),
              ),
              InkWell(
                onTap: () =>
                    widget.registerUser(_authenticateStore.fullPhone, context),
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.marginMedium),
                  child: Text(
                    "Resend OTP.",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: Dimens.marginLargeX,
          ),
        ],
      ),
    );
  }

  Widget _optWidget() {
    return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 0.0, horizontal: Dimens.marginLarge),
        child: PinCodeTextField(
          length: 6,
          obsecureText: false,
          autoFocus: true,
          animationType: AnimationType.scale,
          textInputType: TextInputType.number,
          pinTheme: PinTheme(
              fieldHeight: 48,
              fieldWidth: 40,
              shape: PinCodeFieldShape.underline,
              disabledColor: Colors.grey,
              inactiveColor: Colors.grey,
              inactiveFillColor: Colors.transparent,
              selectedColor: Colors.grey,
              selectedFillColor: Colors.transparent,
              activeFillColor: Colors.transparent,
              activeColor: Colors.grey),
          animationDuration: Duration(milliseconds: 250),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          controller: _optController,
          onCompleted: (v) {
            _authenticateStore.inputOtp = v;
          },
          onChanged: (value) {},
        ));
  }
}
