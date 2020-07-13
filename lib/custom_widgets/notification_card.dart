import 'package:flutter/material.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/styles.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/main/notification/notification_detail/notification_detail_widget.dart';

class NotificationCard extends StatefulWidget {
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
          onTap: () => Modular.to.pushNamed(NotificationDetailWidget.route),
          child: Container(
            padding: const EdgeInsets.all(Dimens.marginMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(Dimens.marginMedium),
                    child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: Styles.m2TextTheme)),
                const Divider(
                    height: 3,
                    thickness: 1,
                    indent: Dimens.marginMedium2,
                    endIndent: Dimens.marginMedium2),
                Container(
                    padding: const EdgeInsets.all(Dimens.marginMedium),
                    child: Text('5 Jan 2020 / 9 : 00 AM',
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
