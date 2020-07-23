import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/utils/constants.dart';
import 'package:m2mobile/stores/authenticate_store.dart';

class Authenticate1Widget extends StatefulWidget {
  @override
  _Authenticate1WidgetState createState() => _Authenticate1WidgetState();
}

class _Authenticate1WidgetState extends State<Authenticate1Widget> {
  final _authenticateStore = Modular.get<AuthenticateStore>();
  final _phoneFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
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
                  'We will send OTP to authenticate your account.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: Dimens.textRegular2_5x,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: Dimens.marginLargeX,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CountryPicker(
                    onChanged: (country) {
                      _authenticateStore.countryCode = country;
                    },
                    showName: false,
                    showFlag: false,
                    showDialingCode: true,
                    selectedCountry: _authenticateStore.countryCode,
                  ),
                  const SizedBox(
                    width: Dimens.marginMedium,
                  ),
                  Expanded(
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      controller: _phoneFieldController,
                      keyboardType: TextInputType.number,
                      maxLength: maxPhoneLength,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: "Your Mobile Number",
                      ),
                      validator: (value) => (value.isEmpty || value == null)
                          ? "Should not be empty"
                          : null,
                      onChanged: (value) {
                        _authenticateStore.phone = value;
                      },
                      onFieldSubmitted: (value) {
                        _authenticateStore.phone = value;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimens.marginLargeX,
              ),
            ],
          ),
        );
      },
    );
  }
}
