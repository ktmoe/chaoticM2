import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/pages/language/language_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/styles.dart';

class SettingsWidget extends StatefulWidget {
  static const route = "/main/more/settings";

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M2AppBar(
          showSearch: false,
          title: 'ပြင်ဆင်ရန် ',
          deleteOnly: false,
          onBackPressed: () => Modular.to.pop()),
      body: Stack(
        children: <Widget>[
          ScreenBgCard(),
          Container(
            padding: const EdgeInsets.only(top: Dimens.marginMedium2),
            child: Column(
              children: <Widget>[
                ListTile(
                    onTap: () {
                      Modular.to.pushNamed(LanguageWidget.route);
                    },
                    title: Text('ဖောင့်ရွေးရန်',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Dimens.textRegular2x)),
                    dense: true),
                const Divider(height: 2),
                ListTile(
                    title: const Text('App Version', style: Styles.m2TextTheme),
                    trailing: const Text('1.0.0', style: Styles.m2TextTheme)),
                const Divider(height: 2),
                ListTile(
                    title:
                        const Text('Developed by', style: Styles.m2TextTheme),
                    trailing:
                        Image.asset('lib/res/images/nwtlogo.png', width: 100))
              ],
            ),
          )
        ],
      ),
    );
  }
}
