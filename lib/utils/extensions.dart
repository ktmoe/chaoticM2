import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

extension StringX on String {
  void makeSnack(GlobalKey<ScaffoldState> state) {
    state.currentState.showSnackBar(this.snackBar());
  }

  void showSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(this.snackBar());
  }

  SnackBar snackBar() =>
      SnackBar(content: Text(this), duration: Duration(seconds: 3));
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
