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
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/res/strings.dart';
import 'package:mobx/mobx.dart';

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
  final List<ReactionDisposer> _disposers = [];

  bool _obscure = true;

  ReactionDisposer _onOldDataLoadingChanged() {
    return reaction<bool>((_) => _storeProfile.oldDataLoaded,(done){
      print("old data loaded => $done");
      if (done) {
        _autofillOldData();
      }
    });
  }

  ReactionDisposer _onApiLoadingChanged() {
    return reaction<bool>((_) => _storeProfile.apiLoading, (loading) {
      if (loading) {
        context.loadingDialog();
      } else
        Navigator.of(context).pop();
    });
  }

  ReactionDisposer _onAppExceptionChanged() {
    return reaction<AppException>((_) => _storeProfile.exception, (e) {
      debugPrint(e.message);
      context.successFailDialog(dialogType: e.message);
    });
  }



  @override
  void initState() {
    super.initState();
    _disposers.addAll([
      _onAppExceptionChanged(),
      _onOldDataLoadingChanged(),
      _onApiLoadingChanged()
    ]);
    Future.wait([_storeProfile.initEditProfile(widget.register)]);
  }

  void _autofillOldData() {
    _nameController.text = _storeProfile.name;
    _phoneController.text = _storeProfile.phoneNo;
    _addressController.text = _storeProfile.address;
  }

  @override
  void dispose() {
    _disposers.forEach((element) {
      element();
    });
    _storeProfile.oldDataLoaded = false;
    super.dispose();
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
              final file = source == 0
                  ? await ImagePickerUtils.getImagePicker(gallery: true)
                  : await ImagePickerUtils.getImagePicker(gallery: false);
              if (file != null) {
                await _storeProfile.uploadProfileImage(file);
              }
            },
            child: Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15 - 50),
              child: _storeProfile.imageUrl.isEmpty
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
                            image: NetworkImage(_storeProfile.imageUrl)),
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
                : Container(),
            SizedBox(height: Dimens.marginLargeX),
            _buildCorrectDoneButton()
          ],
        ),
      );

  Widget _buildNameTextField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: _nameController,
      decoration: InputDecoration(
          hintText: "Name",
          errorText: _nameController.text.isEmpty
              ? Strings.errorTextFieldEmpty
              : null),
      validator: (value) =>
          (value.isEmpty || value == null) ? Strings.errorTextFieldEmpty : null,
      onChanged: (value) {
        _storeProfile.name = value;
      },
      onFieldSubmitted: (value) {
        _storeProfile.name = value;
        FocusScope.of(context).nextFocus();
      },
    );
  }

  Widget _buildPhoneNoTextField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: _phoneController,
      decoration: InputDecoration(
          hintText: "Phone No.",
          errorText: _phoneController.text.isEmpty
              ? Strings.errorTextFieldEmpty
              : null),
      validator: (value) =>
          (value.isEmpty || value == null) ? Strings.errorTextFieldEmpty : null,
      onChanged: (value) {
        _storeProfile.phoneNo = value;
      },
      onFieldSubmitted: (value) {
        _storeProfile.phoneNo = value;
        FocusScope.of(context).nextFocus();
      },
    );
  }

  Widget _buildAddressTextField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: _addressController,
      decoration: InputDecoration(
          hintText: "Address",
          errorText: _addressController.text.isEmpty
              ? Strings.errorTextFieldEmpty
              : null),
      validator: (value) =>
          (value.isEmpty || value == null) ? Strings.errorTextFieldEmpty : null,
      onChanged: (value) {
        _storeProfile.address = value;
      },
      onFieldSubmitted: (value) {
        _storeProfile.address = value;
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
            errorText: _passwordController.text.isEmpty
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
          _storeProfile.password = value;
        },
        onFieldSubmitted: (value) {
          _storeProfile.password = value;
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
      onPressed: () async {
        await _storeProfile.uploadProfile(widget.register, () async {
          await context.successFailDialog(
              dialogType: WarningDialogType.userProfileSaved, success: true);
          if (widget.register) {
            Modular.to.pushReplacementNamed(MainWidget.route);
          } else {
            Modular.to.pop();
          }
        });
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
