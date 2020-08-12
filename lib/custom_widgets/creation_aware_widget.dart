import 'package:flutter/material.dart';

class CreationAwareWidget extends StatefulWidget {
  final Widget child;
  final Function onCreate;

  const CreationAwareWidget({Key key, this.onCreate, this.child})
      : super(key: key);
  @override
  _CreationAwareWidgetState createState() => _CreationAwareWidgetState();
}

class _CreationAwareWidgetState extends State<CreationAwareWidget>
    with AutomaticKeepAliveClientMixin<CreationAwareWidget> {
  @override
  void initState() {
    widget.onCreate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
