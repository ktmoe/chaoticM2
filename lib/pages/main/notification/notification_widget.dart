import 'package:flutter/material.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/notification_card.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/res/dimens.dart';

class NotificationWidget extends StatefulWidget {
  static const route = "/login/authenticate/main/notification";

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          M2AppBar(showSearch: false, title: "Notification", deleteOnly: false),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Stack(
          children: <Widget>[
            ScreenBgCard(),
            Container(
              margin: const EdgeInsets.all(Dimens.marginMedium),
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return NotificationCard();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
