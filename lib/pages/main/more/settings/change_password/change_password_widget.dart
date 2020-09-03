import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/custom_widgets/one_call_away_widget.dart';
import 'package:m2mobile/stores/store_change_password.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/styles.dart';
import 'package:mobx/mobx.dart';

class ChangePasswordWidget extends StatefulWidget {
  static const route = "/main/more/settings/change_password";

  @override
  _ChangePasswordWidgetState createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  final StoreChangePassword _storeChangePassword =
      Modular.get<StoreChangePassword>();

  final List<ReactionDisposer> _disposers = [];

  final TextEditingController _oldPwdFieldController = TextEditingController();
  final TextEditingController _newPwdFieldController = TextEditingController();
  final TextEditingController _retypePwdFieldController =
      TextEditingController();

  ReactionDisposer _changePwdSuccess() {
    return reaction<bool>((_) => _storeChangePassword.changePasswordSuccess,
        (success) async {
      if (success) {
        context
            .successFailDialog(
                dialogType: "Password Changed Successfully.", success: true)
            .then((value) => Modular.to.pop());
      } else
        context.successFailDialog(dialogType: "Old Password is not correct.");
    });
  }

  @override
  void initState() {
    _disposers.addAll([_changePwdSuccess()]);
    super.initState();
  }

  @override
  void dispose() {
    _disposers.forEach((d) {
      d();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M2AppBar(
          showSearch: false,
          title: 'Change Password ',
          deleteOnly: false,
          onBackPressed: () => Modular.to.pop()),
      body: Stack(
        children: <Widget>[
          ScreenBgCard(),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: Dimens.marginLargeXX,
                horizontal: Dimens.marginMedium),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _buildOldPasswordField(),
                  const SizedBox(height: Dimens.marginLarge),
                  _buildNewPasswordField(),
                  const SizedBox(height: Dimens.marginLarge),
                  _buildRetypePasswordField(),
                  const SizedBox(height: Dimens.marginLargeX),
                  _buildChangePwdBtn()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOldPasswordField() => Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimens.marginLarge),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          controller: _oldPwdFieldController,
          decoration: InputDecoration(hintText: "Old Password"),
          onChanged: (value) {
            _storeChangePassword.oldPassword = value;
          },
          onFieldSubmitted: (value) {
            _storeChangePassword.oldPassword = value;
            FocusScope.of(context).nextFocus();
          },
        ),
      );

  Widget _buildNewPasswordField() => Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimens.marginLarge),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          controller: _newPwdFieldController,
          decoration: InputDecoration(hintText: "New Password"),
          onChanged: (value) {
            _storeChangePassword.newPassword = value;
          },
          onFieldSubmitted: (value) {
            _storeChangePassword.newPassword = value;
            FocusScope.of(context).nextFocus();
          },
        ),
      );

  Widget _buildRetypePasswordField() => Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimens.marginLarge),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          controller: _retypePwdFieldController,
          decoration: InputDecoration(hintText: "Retype Password"),
          onChanged: (value) {
            _storeChangePassword.retypePassword = value;
          },
          onFieldSubmitted: (value) {
            _storeChangePassword.retypePassword = value;
            FocusScope.of(context).nextFocus();
          },
        ),
      );

  Widget _buildChangePwdBtn() => Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: Dimens.marginLarge),
        child: RaisedButton(
          shape: Styles.m2ButtonShape,
          color: Theme.of(context).buttonColor,
          textColor: Colors.white,
          disabledTextColor: Colors.white,
          onPressed: () async {
            if (!_storeChangePassword.validate) {
              context.successFailDialog(
                  dialogType: "Please fill in all fields");
            } else if (!_storeChangePassword.matchedPwd) {
              context.successFailDialog(
                  dialogType: "Passwords are not matched.");
            } else {
              await _storeChangePassword.changePassword();
            }
          },
          child: const Text("Change Password"),
        ),
      );
}
