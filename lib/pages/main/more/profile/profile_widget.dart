import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/pages/main/more/profile/edit_profile_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';

class ProfileWidget extends StatefulWidget {
  static const route = "/login/authenticate/main/more/profile";
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M2GradientAppBar(
        title: 'Profile',
        gradient:
            LinearGradient(colors: [Color(0xFFFFC300), Color(0xFFFE6F00)]),
        onBackPressed: () => Modular.to.pop(),
      ),
      body: Stack(
        children: <Widget>[
          _buildBackgroundGradient(),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
              child: ScreenBgCard()),
          _buildProfileInfoArea(),
        ],
      ),
    );
  }

  Widget _buildCircleProfilePhoto() => Card(
        elevation: Dimens.cardElevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: FadeInImage(
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              placeholder: AssetImage("lib/res/images/earth.jpg"),
              image: NetworkImage(
                  "https://pyxis.nymag.com/v1/imgs/57d/5f1/4e4dae00f150e36a22a13ffa956d4301d8-07-timothee-chalamet.rvertical.w600.jpg")),
        ),
      );

  Widget _buildProfileInfoArea() => Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: Dimens.marginLargeX),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: _buildCircleProfilePhoto(),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimens.marginMedium2),
                child: const Text(
                  "Ko Khin Maung Soe",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Dimens.textHeading1x),
                ),
              ),
              SizedBox(height: Dimens.marginLargeXX),
              Container(
                margin: const EdgeInsets.only(bottom: Dimens.marginLarge),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Icon(
                      M2Icon.phone,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: Dimens.marginLarge,
                    ),
                    const Text(
                      "09 49350513",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: Dimens.marginLarge),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Icon(
                      M2Icon.location,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: Dimens.marginLarge,
                    ),
                    Expanded(
                      child: const Text(
                        "အမှတ် ၁၆၊ (၃) ရပ်ကွက်၊ မင်းညိုစံလမ်း နှင့် အောင်ဇေယျလမ်း ထောင့်၊ ရွှေဘိုမြို့။",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: Dimens.marginLargeX),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                elevation: Dimens.cardElevation,
                padding: const EdgeInsets.only(
                    left: Dimens.marginLargeX, right: Dimens.marginLargeX),
                color: Theme.of(context).buttonColor,
                textColor: Colors.white,
                disabledTextColor: Colors.white,
                onPressed: () {
                  Modular.to
                      .pushNamed(EditProfileWidget.route, arguments: false);
                },
                child: const Text("Edit Profile"),
              )
            ],
          ),
        ),
      );

  Widget _buildBackgroundGradient() => Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFFFFC300), Color(0xFFFE6F00)])),
      );
}
