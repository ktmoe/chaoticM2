import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

extension StringX on String {
  void showSnackBar(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(this)));
  }

  SnackBar snackBar() => SnackBar(content: Text(this));
}

extension DoubleX on double {
  String money() =>
      FlutterMoneyFormatter(amount: this)
          .output
          .symbolOnRight
          .split('.')
          .first +
      ' MMK';
}
