import 'package:flutter/material.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/models/responses/noti.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/styles.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/utils/extensions.dart';

class NotificationDetailWidget extends StatefulWidget {

  Noti noti;

  NotificationDetailWidget({this.noti});

  static const route = "/main/notification/notification_detail";
  @override
  _NotificationDetailWidgetState createState() =>
      _NotificationDetailWidgetState();
}

class _NotificationDetailWidgetState extends State<NotificationDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: M2AppBar(
            showSearch: false,
            title: "Notifications",
            deleteOnly: false,
            onBackPressed: () => Modular.to.pop()),
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
                child: Text(widget.noti.title,
                    style: TextStyle(
                        fontSize: Dimens.textHeading1x,
                        fontWeight: FontWeight.w600)),
              ),
              Container(
                padding: const EdgeInsets.all(Dimens.marginMedium2),
                child: Text(
                    widget.noti.description,
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
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage("lib/res/images/placeholder.png"),
                image: NetworkImage(widget.noti.imageurl.createImageUrl())),
          ),
        ),
      );
}
