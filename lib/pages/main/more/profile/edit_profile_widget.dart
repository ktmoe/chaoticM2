import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/pages/main/main_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/custom_widgets/one_call_away_widget.dart';
import 'package:m2mobile/utils/image_picker_utils.dart';
import 'package:m2mobile/stores/store_profile.dart';

class EditProfileWidget extends StatefulWidget {
  static const route = "/main/more/profile/edit_profile";

  final bool register;

  const EditProfileWidget({Key key, this.register = false}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final StoreProfile _storeProfile = Modular.get<StoreProfile>();

  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _storeProfile.init(widget.register);
  }

  @override
  Widget build(BuildContext context) {
    ///login/authenticate/main/more/profile/edit_profile
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: M2GradientAppBar(
            title: widget.register ? "Register" : "Profile",
            gradient:
                LinearGradient(colors: [Color(0xFFFFC300), Color(0xFFFE6F00)]),
            onBackPressed: () {
              if (!widget.register) Modular.to.pop();
            },
          ),
          body: Stack(
            children: <Widget>[
              _buildBackgroundGradient(),
              Observer(builder: (_) {
                return SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      _buildCircleProfilePhoto(),
                      _buildProfileInfoArea()
                    ],
                  ),
                );
              }),
            ],
          ),
        ));
  }

  Widget _buildCircleProfilePhoto() => Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          ),
          InkWell(
            onTap: () async {
              // 0 -> from gallery, 1-> camera
              final source = await context.imagePickerDialog();
              source == 0
                  ? ImagePickerUtils.getGalleryImage()
                  : ImagePickerUtils.getGalleryImage();
            },
            child: Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15 - 50),
              child: widget.register
                  ? Card(
                      elevation: Dimens.cardElevation,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        M2Icon.camera_1,
                        color: Color(0x99000000),
                      ),
                    )
                  : Card(
                      elevation: Dimens.cardElevation,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: AssetImage("lib/res/images/earth.jpg"),
                            image: NetworkImage(
                                "https://pyxis.nymag.com/v1/imgs/57d/5f1/4e4dae00f150e36a22a13ffa956d4301d8-07-timothee-chalamet.rvertical.w600.jpg")),
                      ),
                    ),
            ),
          )
        ],
      );

  Widget _buildProfileInfoArea() => Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.15,
            right: Dimens.marginLargeX,
            left: Dimens.marginLargeX),
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
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
            Container(
                margin: const EdgeInsets.only(bottom: Dimens.marginMedium2),
                child: _buildNameTextField()),
            Container(
                margin: const EdgeInsets.only(bottom: Dimens.marginMedium2),
                child: _buildPhoneNoTextField()),
            Container(
                margin: const EdgeInsets.only(bottom: Dimens.marginMedium2),
                child: _buildAddressTextField()),
            widget.register
                ? Container(
                    margin: const EdgeInsets.only(bottom: Dimens.marginMedium2),
                    child: _buildPasswordTextField())
                : Container(
                    margin: const EdgeInsets.only(bottom: Dimens.marginMedium2),
                    child: _buildPasswordTextField()),
            SizedBox(height: Dimens.marginLargeX),
            _buildCorrectDoneButton()
          ],
        ),
      );

  Widget _buildNameTextField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: _nameController..text = _storeProfile.name,
      decoration: InputDecoration(
        hintText: "Name",
      ),
      validator: (value) =>
          (value.isEmpty || value == null) ? "Should not be empty" : null,
      onChanged: (value) {
        // _authenticateStore.phone = value;
      },
      onFieldSubmitted: (value) {
        // _authenticateStore.phone = value;
        FocusScope.of(context).nextFocus();
      },
    );
  }

  Widget _buildPhoneNoTextField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: _phoneController..text = _storeProfile.phoneNo,
      decoration: InputDecoration(
        hintText: "Phone No.",
      ),
      validator: (value) =>
          (value.isEmpty || value == null) ? "Should not be empty" : null,
      onChanged: (value) {
        // _authenticateStore.phone = value;
      },
      onFieldSubmitted: (value) {
        // _authenticateStore.phone = value;
        FocusScope.of(context).nextFocus();
      },
    );
  }

  Widget _buildAddressTextField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: _addressController..text = _storeProfile.address,
      decoration: InputDecoration(
        hintText: "Address",
      ),
      validator: (value) =>
          (value.isEmpty || value == null) ? "Should not be empty" : null,
      onChanged: (value) {
        // _authenticateStore.phone = value;
      },
      onFieldSubmitted: (value) {
        // _authenticateStore.phone = value;
        FocusScope.of(context).nextFocus();
      },
    );
  }

  Widget _buildPasswordTextField() => TextFormField(
        textInputAction: TextInputAction.next,
        controller: _passwordController,
        obscureText: _obscure,
        decoration: InputDecoration(
            hintText: "Password",
            errorText:
                _passwordController.text.isEmpty ? "Should not be empty" : null,
            suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
                child: _obscure
                    ? Icon(M2Icon.visibility_off)
                    : Icon(M2Icon.visibility))),
        validator: (value) =>
            (value.isEmpty || value == null) ? "Should not be empty" : null,
        onFieldSubmitted: (value) {
          FocusScope.of(context).nextFocus();
        },
      );

  Widget _buildCorrectDoneButton() {
    return RaisedButton(
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
        } else {
          Modular.to.pop();
        }
      },
      child: widget.register
          ? const Text("Create Account")
          : const Text("Save Profile"),
    );
  }

  Widget _buildBackgroundGradient() => Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFFFFC300), Color(0xFFFE6F00)])),
      );

  Future<bool> _onBackPressed() {
    if (widget.register) {
      return context.appLeaveWarning();
    } else
      return Future.value(true);
  }
}
