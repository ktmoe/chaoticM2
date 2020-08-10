import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/pages/main/more/profile/edit_profile_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProfileWidget extends StatefulWidget {
  static const route = "/main/more/profile";
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final StoreApp _storeApp = Modular.get<StoreApp>();

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
          Observer(
            builder: (context) => _buildProfileInfoArea(),
          ),
        ],
      ),
    );
  }

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
                child: Text(
                  _storeApp.userProfile.name,
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
                    const Icon(M2Icon.phone, color: Colors.grey),
                    const SizedBox(width: Dimens.marginLarge),
                    Text(
                      _storeApp.userProfile.phone,
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
                    const Icon(M2Icon.location, color: Colors.grey),
                    const SizedBox(width: Dimens.marginLarge),
                    Expanded(
                      child: Text(
                        _storeApp.userProfile.address,
                        textAlign: TextAlign.start,
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

  Widget _buildCircleProfilePhoto() => Card(
        elevation: Dimens.cardElevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: _storeApp.userProfile.imageurl.isNotEmpty
              ? FadeInImage(
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder: AssetImage("lib/res/images/profile.png"),
                  image: NetworkImage(_storeApp.userProfile.imageurl))
              : AssetImage("lib/res/images/profile.png"),
        ),
      );

  Widget _buildBackgroundGradient() => Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFFFFC300), Color(0xFFFE6F00)])),
      );
}
