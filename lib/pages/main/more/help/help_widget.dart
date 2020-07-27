import 'package:flutter/material.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/res/styles.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/stores/store_help.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/utils/extensions.dart';

class HelpWidget extends StatefulWidget {
  static const route = "/main/more/help";

  @override
  _HelpWidgetState createState() => _HelpWidgetState();
}

class _HelpWidgetState extends State<HelpWidget> {
  final StoreHelp _storeHelp = Modular.get<StoreHelp>();
  List<ReactionDisposer> _disposers = [];

  ReactionDisposer _onAppException() =>
      reaction((_) => _storeHelp.exception, (e) {
        e.toString().showSnack(context);
      });

  @override
  void initState() {
    super.initState();
    _storeHelp.init();
    _disposers.addAll([_onAppException()]);
  }

  @override
  void dispose() {
    _disposers.forEach((element) {
      element();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M2AppBar(
        showSearch: false,
        title: 'အကူအညီရယူရန်',
        deleteOnly: false,
        onBackPressed: () => Modular.to.pop(),
      ),
      body: Stack(
        children: <Widget>[
          ScreenBgCard(),
          Container(
            margin: const EdgeInsets.all(Dimens.marginLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimens.marginMedium2),
                        topRight: Radius.circular(Dimens.marginMedium2)),
                    child: Image.asset('lib/res/images/customer_support.png',
                        fit: BoxFit.contain),
                  ),
                ),
                Text('Customer Service',
                    style: Styles.m2TextTheme.copyWith(
                        fontSize: Dimens.textRegular2x,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: Dimens.marginMedium2),
                Observer(builder: (_) {
                  return Wrap(
                      alignment: WrapAlignment.start,
                      spacing: Dimens.marginLarge,
                      direction: Axis.horizontal,
                      children: _storeHelp.phones
                          .map((e) => _phoneNoChipWidget(e, (phNO) async {
                                final status = await Permission.phone.status;
                                if (status.isUndetermined) {
                                  await Permission.phone.request();
                                  await launch("tel:$e");
                                } else if (status.isDenied) {
                                  await Permission.phone.request();
                                  await launch("tel:$e");
                                } else {
                                  await launch("tel:$e");
                                }
                              }))
                          .toList());
                })
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _phoneNoChipWidget(String phNo, Function(String) callPhone) {
    return RaisedButton(
        color: Theme.of(context).accentColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              M2Icon.phone,
              color: Colors.white,
            ),
            const SizedBox(width: 5),
            Text(
              phNo,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: () {
          callPhone(phNo);
        });
  }
}
