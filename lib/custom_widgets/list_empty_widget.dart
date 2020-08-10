import 'package:flutter/material.dart';

class ListEmptyWidget extends StatelessWidget {
  final String message;

  const ListEmptyWidget({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset("lib/res/images/no_item.png",
              width: MediaQuery.of(context).size.width * 0.5),
          Text(message, style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
