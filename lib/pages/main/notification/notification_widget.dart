import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/notification_card.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/models/responses/noti.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/stores/store_noti.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/utils/extensions.dart';

class NotificationWidget extends StatefulWidget {
  static const route = "/main/notification";

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {

  final StoreNoti storeNoti = Modular.get<StoreNoti>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorState = GlobalKey();

  final List<ReactionDisposer> _disposer = [];

  ReactionDisposer _onException() {
    return reaction<AppException>((_) => storeNoti.exception, (exception) {
      exception.message.showSnack(context);
    });
  }

  @override
  void initState() {
    super.initState();
    _disposer.addAll([_onException()]);
    Future.wait([storeNoti.init(),storeNoti.fetchNotis(refresh: true)]); //not sure refreshing here is good
  }

  @override
  void dispose() {
    super.dispose();
    for(final d in _disposer){
      d();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M2AppBar(
          showSearch: false,
          title: "Notification",
          deleteOnly: false,
          onBackPressed: () => Modular.to.pop()),
      body: RefreshIndicator(
        key: _refreshIndicatorState,
        onRefresh: () async{
          print("refresh get called");
          await storeNoti.fetchNotis(refresh: true);
        },
        child: Stack(
          children: <Widget>[
            ScreenBgCard(),
            Container(
              margin: const EdgeInsets.all(Dimens.marginMedium),
              child: Observer(
                builder: (_) {
                  List<Noti> notis = storeNoti.notis.toList();
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
