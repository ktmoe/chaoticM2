import 'package:flutter/material.dart';
import 'package:m2mobile/models/responses/noti.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/styles.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/main/notification/notification_detail/notification_detail_widget.dart';

class NotificationCard extends StatefulWidget {

  Noti _noti;

  NotificationCard(this._noti);

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Dimens.marginMedium2),
      child: Card(
        elevation: Dimens.cardElevation * 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.marginMedium2)),
        child: InkWell(
          onTap: () => Modular.to.pushNamed(NotificationDetailWidget.route,arguments: widget._noti),
          child: Container(
            padding: const EdgeInsets.all(Dimens.marginMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(Dimens.marginMedium),
                    child: Text(
                        widget._noti.description,
                        style: Styles.m2TextTheme)),
                const Divider(
                    height: 3,
                    thickness: 1,
                    indent: Dimens.marginMedium2,
                    endIndent: Dimens.marginMedium2),
                Container(
                    padding: const EdgeInsets.all(Dimens.marginMedium),
                    child: Text(widget._noti.date.dateTimeFromString().dateAndTime(),
                        style: Styles.m2TextTheme.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: Dimens.textRegular2x)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
