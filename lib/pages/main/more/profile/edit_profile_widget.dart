import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/pages/main/main_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';

class EditProfileWidget extends StatefulWidget {
  static const route = "/login/authenticate/main/more/profile/edit_profile";

  final bool register;

  const EditProfileWidget({Key key, this.register = false}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    debugPrint("${Modular.to.path}");

    ///login/authenticate/main/more/profile/edit_profile
    return Scaffold(
      key: _scaffoldKey,
      appBar: M2GradientAppBar(
        title: widget.register ? "Register" : "Profile",
        gradient:
            LinearGradient(colors: [Color(0xFFFFC300), Color(0xFFFE6F00)]),
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

  Widget _buildCircleProfilePhoto() => widget.register
      ? Card(
          elevation: Dimens.cardElevation,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Container(
            width: 100,
            height: 100,
            child: Icon(
              M2Icon.camera_1,
              color: Color(0x99000000),
            ),
          ),
        )
      : Card(
          elevation: Dimens.cardElevation,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
                  "Upload Profile Photo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Dimens.textRegular2x),
                ),
              ),
              SizedBox(
                height: Dimens.marginLargeXX,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: Dimens.marginMedium2),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                  validator: (value) => (value.isEmpty || value == null)
                      ? "Should not be empty"
                      : null,
                  onChanged: (value) {
                    // _authenticateStore.phone = value;
                  },
                  onFieldSubmitted: (value) {
                    // _authenticateStore.phone = value;
                    FocusScope.of(context).nextFocus();
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: Dimens.marginMedium2),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: "Phone No.",
                  ),
                  validator: (value) => (value.isEmpty || value == null)
                      ? "Should not be empty"
                      : null,
                  onChanged: (value) {
                    // _authenticateStore.phone = value;
                  },
                  onFieldSubmitted: (value) {
                    // _authenticateStore.phone = value;
                    FocusScope.of(context).nextFocus();
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: Dimens.marginMedium2),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintText: "Address",
                  ),
                  validator: (value) => (value.isEmpty || value == null)
                      ? "Should not be empty"
                      : null,
                  onChanged: (value) {
                    // _authenticateStore.phone = value;
                  },
                  onFieldSubmitted: (value) {
                    // _authenticateStore.phone = value;
                    FocusScope.of(context).nextFocus();
                  },
                ),
              ),
              SizedBox(
                height: Dimens.marginLargeX,
              ),
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
                  if (widget.register) {
                    Modular.to.pushReplacementNamed(MainWidget.route);
                    // Modular.to.pop();
                  } else {
                    Modular.to.pop();
                  }
                },
                child: widget.register
                    ? const Text("Create Account")
                    : const Text("Save Profile"),
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
