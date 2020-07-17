import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/pages/main/more/about/about_widget.dart';
import 'package:m2mobile/pages/main/more/help/help_widget.dart';
import 'package:m2mobile/pages/main/more/profile/profile_widget.dart';
import 'package:m2mobile/pages/main/more/favourite/favourite_widget.dart';
import 'package:m2mobile/pages/main/more/order_list/order_list_widget.dart';
import 'package:m2mobile/pages/main/more/settings/settings_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/custom_widgets/one_call_away_widget.dart';
import 'package:m2mobile/stores/store_app.dart';

class MoreWidget extends StatefulWidget {
  static const route = "/main/more";
  @override
  _MoreWidgetState createState() => _MoreWidgetState();
}

final _optionMap = {
  'Profile': ProfileWidget.route,
  'အော်ဒါ': OrderListWidget.route,
  'ဆိုင်အကြောင်း': AboutWidget.route,
  'သင်ကြိုက်နှစ်သက်သောပစ္စည်းများ': FavouriteWidget.route,
  'အကူအညီရယူရန်': HelpWidget.route,
  'ပြင်ဆင်ရန်': SettingsWidget.route,
  'အကောင့်ထွက်ရန်': ''
};

List<IconData> icons = [
  M2Icon.user,
  M2Icon.list,
  null,
  M2Icon.favourite,
  M2Icon.information,
  M2Icon.setting,
  M2Icon.logout
];

class _MoreWidgetState extends State<MoreWidget> {
  final StoreApp _storeApp = Modular.get<StoreApp>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ScreenBgCard(),
        Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              separatorBuilder: (context, _) => const Divider(
                    color: Color(0xDE000000),
                    endIndent: 8,
                    indent: 8,
                    height: 0,
                  ),
              itemCount: _optionMap.keys.toList().length,
              itemBuilder: (_, index) {
                return Material(
                  color: Colors.white,
                  child: ListTile(
                    onTap: () async {
                      final route = _optionMap.values.toList()[index];
                      if (route.isNotEmpty) {
                        Modular.to.pushNamed(route);
                      } else {
                        final logout =
                            await context.appLeaveWarning(logOut: true);
                        if (logout) {
                          _logOutApp();
                        }
                      }
                    },
                    contentPadding: const EdgeInsets.all(Dimens.marginSmall),
                    leading: (icons[index] == null)
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimens.marginMedium),
                            child: Hero(
                              tag: AboutWidget.heroTag,
                              child: SvgPicture.asset(
                                "lib/res/svgs/m2_logo.svg",
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimens.marginMedium2),
                            child: Icon(
                              icons[index],
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                    title: Text(_optionMap.keys.toList()[index],
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                );
              }),
        ),
      ],
    );
  }

  void _logOutApp() {
    _storeApp.isLoggedIn = false;
    Modular.to.pushReplacementNamed('/');
  }
}
