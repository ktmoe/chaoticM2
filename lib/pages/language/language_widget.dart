import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:m2mobile/res/colors.dart';
import 'package:mobx/mobx.dart';

class LanguageWidget extends StatefulWidget {
  static const route = "/language";

  @override
  _LanguageWidgetState createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  final StoreApp _storeApp = Modular.get<StoreApp>();
  List<ReactionDisposer> _disposers = [];

  ReactionDisposer _onChosenLanguage() {
    return reaction((_) => _storeApp.chosenLanguage, (language) {
      _storeApp.changeLanguagePref();
    });
  }

  @override
  void initState() {
    _disposers.addAll([_onChosenLanguage()]);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _disposers.forEach((element) {
      element();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(Modular.navigatorKey.currentState.canPop());
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Stack(
          children: <Widget>[
            ScreenBgCard(),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(Dimens.marginMedium2),
                child: Observer(
                  builder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: Dimens.marginMedium2),
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Image.asset(
                                  "lib/res/images/font_change.png")),
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        const Text('Choose Your Preffered Font'),
                        const SizedBox(height: 10),
                        Text('Please Select your Font',
                            style: TextStyle(color: Color(0xfff6ab4e))),
                        const SizedBox(height: 30),
                        _buildUnicodeBtn(),
                        const SizedBox(height: 10),
                        _buildZawGyiBtn(),
                        const SizedBox(height: 30),
                        _buildDoneBtn()
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildUnicodeBtn() {
    return Container(
      height: 85,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: _storeApp.chosenLanguage == Language.Unicode
            ? AppColors.colorLanguageSelected
            : AppColors.colorLanguageUnSelected,
        onPressed: () {
          _storeApp.chosenLanguage = Language.Unicode;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'မြန်မာ',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'ဂဃနဏဖတ်ခဲ့သည်။',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Visibility(
              visible: _storeApp.chosenLanguage == Language.Unicode,
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildZawGyiBtn() {
    return Container(
      height: 85,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: _storeApp.chosenLanguage == Language.Zawgyi
            ? AppColors.colorLanguageSelected
            : AppColors.colorLanguageUnSelected,
        onPressed: () {
          _storeApp.chosenLanguage = Language.Zawgyi;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'ျမန္မာ',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text('ဂဃနဏဖတ္ခဲ့သည္။', style: TextStyle(color: Colors.white))
                ],
              ),
            ),
            Visibility(
              visible: _storeApp.chosenLanguage == Language.Zawgyi,
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDoneBtn() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        margin: const EdgeInsets.only(bottom: Dimens.marginMedium2),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: Dimens.marginMedium2),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          color: AppColors.colorLanguageUnSelected,
          onPressed: _onDonePressed,
          child: Text(
            'Done',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            onTap: _leaveWidget,
            child: Icon(Icons.chevron_left,
                color: Theme.of(context).iconTheme.color)),
        title: const Text(
          'ဖောင့်ရွေးရန်',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      );

  Future<void> _onDonePressed() async {
    if (_storeApp.isFirstTime) {
      await _storeApp.changeFirstTime();
      Modular.to.popAndPushNamed('/');
    } else {
      Modular.to.pop();
    }
  }

  void _leaveWidget() {
    final pop = Modular.navigatorKey.currentState.canPop();
    if (pop) Modular.to.pop();
  }
}
