import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/res/dimens.dart';

class LanguageWidget extends StatefulWidget {
  static const route = "/language";

  @override
  _LanguageWidgetState createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'ဖောင့်ရွေးရန်',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
          height: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Color(0xFFF6F6F6),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset("lib/res/images/font_change.png")),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Choose Your Preffered Font'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Please Select your Font',
                      style: TextStyle(color: Color(0xfff6ab4e)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Text(
                                  'ဂဃနဏဖတ်ခဲ့သည်။',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: true,
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Color(0xFFf6c24e),
                      onPressed: () {},
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Text('ဂဃနဏဖတ္ခဲ့သည္။',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                          Visibility(
                            visible: false,
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width - 10,
                  child: RaisedButton(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimens.marginMedium2),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    color: Theme.of(context).buttonColor,
                    onPressed: () {
                      Modular.to.pushReplacementNamed('/');
                    },
                    child: Text(
                      'Done',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
