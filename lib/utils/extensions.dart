import 'package:flutter/material.dart';

extension StringX on String {
  void showSnackBar(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(this)));
  }
}
