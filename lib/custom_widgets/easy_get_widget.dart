import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m2mobile/res/dimens.dart';

extension EasyGetWidget on BuildContext {
  Future<bool> onBackPressed() {
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
                const Text(
                  'You are leaving! Are you sure?',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: Dimens.marginMedium2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      elevation: Dimens.cardElevation,
                      onPressed: () => Navigator.of(context).pop(false),
                      padding: const EdgeInsets.only(
                          left: Dimens.marginMedium2,
                          right: Dimens.marginMedium2),
                      color: Colors.white,
                      textColor: Color(0xFFF47208),
                      child: const Text("No"),
                    ),
                    RaisedButton(
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

  Future<bool> onOrderBackPressed() {
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
                const Text(
                  'You are about to cancel your order. Are you sure?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: Dimens.marginMedium2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      elevation: Dimens.cardElevation,
                      onPressed: () => Navigator.of(context).pop(false),
                      padding: const EdgeInsets.only(
                          left: Dimens.marginMedium2,
                          right: Dimens.marginMedium2),
                      color: Colors.white,
                      textColor: Color(0xFFF47208),
                      child: const Text("No"),
                    ),
                    RaisedButton(
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
}
