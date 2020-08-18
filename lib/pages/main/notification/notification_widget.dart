import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/notification_card.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/stores/store_noti.dart';

class NotificationWidget extends StatefulWidget {
  static const route = "/main/notification";

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {

  final StoreNoti storeNoti = Modular.get<StoreNoti>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M2AppBar(
          showSearch: false,
          title: "Notification",
          deleteOnly: false,
          onBackPressed: () => Modular.to.pop()),
      body: RefreshIndicator(
        onRefresh: (){
         return Future.wait([storeNoti.fetchNotis(refresh: true)]);
        },
        child: Stack(
          children: <Widget>[
            ScreenBgCard(),
            Container(
              margin: const EdgeInsets.all(Dimens.marginMedium),
              child: Observer(
                builder: (_) {
                  final notis = storeNoti.notis.toList();
                  return ListView.builder(
                    itemCount: notis.length,
                    itemBuilder: (_, index) {
                      return NotificationCard(notis[index]);
                    });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
