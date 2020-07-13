import 'package:flutter/material.dart';
import 'package:m2mobile/res/dimens.dart';

class M2ColoredButton extends StatefulWidget {
  final Function onPressed;
  final String text;
  final Color buttonColor;

  const M2ColoredButton({Key key, this.onPressed, this.text, this.buttonColor})
      : super(key: key);
  @override
  _M2ColoredButtonState createState() => _M2ColoredButtonState();
}

class _M2ColoredButtonState extends State<M2ColoredButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.only(
          left: Dimens.marginLargeX, right: Dimens.marginLargeX),
      color: widget.buttonColor,
      textColor: Colors.white,
      disabledTextColor: Colors.white,
      onPressed: widget.onPressed(),
      child: Text(widget.text),
    );
  }
}
