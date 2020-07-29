import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/styles.dart';
import 'package:flutter_modular/flutter_modular.dart';

extension OneCallAwayWidget on BuildContext {
  void loadingDialog() {
    // return
    showDialog(
        context: this,
        barrierDismissible: false,
        child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.marginMedium2))),
            content: Container(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[CircularProgressIndicator()]),
            )));
  }

  Future<bool> appLeaveWarning({bool logOut = false}) {
    return showDialog(
          context: this,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.marginMedium2))),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: Dimens.marginMedium2),
                  child: SvgPicture.asset(
                    "lib/res/svgs/logout.svg",
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
                Text(
                  logOut
                      ? WarningDialogType.logoutDialog
                      : WarningDialogType.leaveAppDialog,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: Dimens.marginMedium2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      shape: Styles.m2ButtonShape,
                      elevation: Dimens.cardElevation,
                      onPressed: () => Navigator.of(context).pop(false),
                      padding: const EdgeInsets.only(
                          left: Dimens.marginMedium2,
                          right: Dimens.marginMedium2),
                      color: Colors.white,
                      textColor: Theme.of(context).buttonColor,
                      child: const Text("No"),
                    ),
                    RaisedButton(
                      shape: Styles.m2ButtonShape,
                      elevation: Dimens.cardElevation,
                      onPressed: () => Navigator.of(context).pop(true),
                      padding: const EdgeInsets.only(
                          left: Dimens.marginMedium2,
                          right: Dimens.marginMedium2),
                      color: Theme.of(context).buttonColor,
                      textColor: Colors.white,
                      child: const Text("Yes"),
                    )
                  ],
                )
              ],
            ),
          ),
        ) ??
        Future.value(false);
  }

  Future<bool> standardWarningDialog({@required String dialogType}) {
    return showDialog(
          barrierDismissible: true,
          context: this,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.marginMedium2))),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: Dimens.marginMedium2),
                Text(
                  dialogType,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: Dimens.marginMedium2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                        shape: Styles.m2ButtonShape,
                        elevation: Dimens.cardElevation,
                        onPressed: () => Modular.to.pop(false),
                        padding: const EdgeInsets.only(
                            left: Dimens.marginMedium2,
                            right: Dimens.marginMedium2),
                        color: Colors.white,
                        textColor: Theme.of(context).buttonColor,
                        child: const Text("No")),
                    RaisedButton(
                      shape: Styles.m2ButtonShape,
                      elevation: Dimens.cardElevation,
                      onPressed: () => Modular.to.pop(true),
                      padding: const EdgeInsets.only(
                          left: Dimens.marginMedium2,
                          right: Dimens.marginMedium2),
                      color: Color(0xFFF47208),
                      textColor: Colors.white,
                      child: const Text("Yes"),
                    )
                  ],
                )
              ],
            ),
          ),
        ) ??
        Future.value(false);
  }

  Future<bool> successFailDialog(
      {@required String dialogType, bool success = false}) {
    return showDialog(
          context: this,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.marginMedium2))),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(height: Dimens.marginMedium2),
                success
                    ? Lottie.asset(
                        "lib/res/lotties/done.json",
                        height: 100,
                        fit: BoxFit.cover,
                        repeat: false,
                      )
                    : const Text("Opps! Something Went Wrong.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: Dimens.textRegular3x,
                            fontWeight: FontWeight.w500)),
                const SizedBox(height: Dimens.marginMedium3),
                Text(dialogType),
                const SizedBox(height: Dimens.marginMedium3),
                RaisedButton(
                  shape: Styles.m2ButtonShape,
                  elevation: Dimens.cardElevation,
                  onPressed: () => Navigator.of(context).pop(true),
                  padding: const EdgeInsets.only(
                      left: Dimens.marginMedium2, right: Dimens.marginMedium2),
                  color: Theme.of(context).buttonColor,
                  textColor: Colors.white,
                  child: const Text("OK"),
                )
              ],
            ),
          ),
        ) ??
        Future.value(false);
  }

  /// Image Picker return 0 -> Pick From Gallery, 1-> Capture New Photo
  Future<int> imagePickerDialog() async {
    return showDialog(
        context: this,
        builder: (context) => AlertDialog(
                content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.of(this).pop(0);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(Dimens.marginMedium2),
                        child: const Text("Pick Image from Gallery."))),
                InkWell(
                    onTap: () {
                      Navigator.of(this).pop(1);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(Dimens.marginMedium2),
                        child: const Text("Take New Image.")))
              ],
            )));
  }
}

abstract class WarningDialogType {
  static const logoutDialog = 'Are you sure to Logout?';
  static const leaveAppDialog = 'You are leaving! Are you sure?';

  static const orderCancelDialog =
      'All filled informations will be lost. Are you sure?';

  static const forgotPasswordDialog =
      'Forgot Password အတွက် M2 Mobile သို့အောက်ဖော်ပြပါ ဖုန်းနံပါတ်ဖြင့်ဆက်သွယ်အကြောင်းကြားနိုင်သည်။\nဖုန်း - 09 790428136';

  static const loginFailedDialog = 'UserName or Password Wrong';
  static const forceUpdateDialog = 'The new version is available';

  static const userProfileSaved = 'User Profile is saved';
}
