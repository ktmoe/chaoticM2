import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/styles.dart';

extension OneCallAwayWidget on BuildContext {
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
                        onPressed: () => Navigator.of(context).pop(false),
                        padding: const EdgeInsets.only(
                            left: Dimens.marginMedium2,
                            right: Dimens.marginMedium2),
                        color: Colors.white,
                        textColor: Theme.of(context).buttonColor,
                        child: const Text("No")),
                    RaisedButton(
                      shape: Styles.m2ButtonShape,
                      elevation: Dimens.cardElevation,
                      onPressed: () => Navigator.of(context).pop(true),
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
}

abstract class WarningDialogType {
  static const logoutDialog = 'Are you sure to Logout?';
  static const leaveAppDialog = 'You are leaving! Are you sure?';

  static const orderCancelDialog =
      'You are about to cancel your order. Are you sure?';

  static const loginFailedDialog = 'UserName or Password Wrong';
}
