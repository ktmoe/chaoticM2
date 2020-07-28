import 'package:flutter/material.dart';
import 'package:m2mobile/utils/constants.dart';
import 'package:intl/intl.dart';

extension StringX on String {
  void makeSnack(GlobalKey<ScaffoldState> state) {
    state.currentState.showSnackBar(this.snackBar());
  }

  void showSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(this.snackBar());
  }

  SnackBar snackBar() =>
      SnackBar(content: Text(this), duration: Duration(seconds: 3));

  String createImageUrl() => "$baseUrl/$this";
}

extension DoubleX on num {
  String money() {
    final format = NumberFormat("#,###");
    return format.format(this);
  }
}
