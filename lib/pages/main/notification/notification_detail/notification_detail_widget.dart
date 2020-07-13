import 'package:flutter/material.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/styles.dart';

class NotificationDetailWidget extends StatefulWidget {
  static const route =
      "/login/authenticate/main/notification/notification_detail";
  @override
  _NotificationDetailWidgetState createState() =>
      _NotificationDetailWidgetState();
}

class _NotificationDetailWidgetState extends State<NotificationDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: M2AppBar(
            showSearch: false, title: "Notifications", deleteOnly: false),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Expanded(
              child: Stack(
                children: <Widget>[
                  _buildNotificationBanner(),
                  Positioned(
                      bottom: 0,
                      top: MediaQuery.of(context).size.height * 0.4 -
                          Dimens.marginMedium2,
                      child: _buildNotificationDetail())
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildNotificationDetail() => ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.marginMedium2),
            topRight: Radius.circular(Dimens.marginMedium2)),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(Dimens.marginMedium2),
                child: const Text('Moon Soon Promotion',
                    style: TextStyle(
                        fontSize: Dimens.textHeading1x,
                        fontWeight: FontWeight.w600)),
              ),
              Container(
                padding: const EdgeInsets.all(Dimens.marginMedium2),
                child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: Styles.m2TextTheme),
              )
            ],
          ),
        ),
      );

  Widget _buildNotificationBanner() => ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.marginMedium2),
            topRight: Radius.circular(Dimens.marginMedium2)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage("lib/res/images/earth.jpg"),
              image: NetworkImage("")),
        ),
      );
}
