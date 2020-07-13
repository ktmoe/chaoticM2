import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class CompleteOrderWidget extends StatefulWidget {
  static const route =
      "/login/authenticate/main/more/order_list/complete_order";

  @override
  _CompleteOrderWidgetState createState() => _CompleteOrderWidgetState();
}

class _CompleteOrderWidgetState extends State<CompleteOrderWidget> {
  List<Asset> _selectedImages = <Asset>[];
  List<String> _bankList = [
    'KBZ Bank (0002-302-19284735)',
    'AYA Bank (0002-302-19284735)',
    'UAB Bank (0002-302-19284735)'
  ];
  String _selectedBank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M2AppBar(
          showSearch: false, title: '‌ငွေလွှဲစလစ်ပို့ရန်', deleteOnly: false),
      body: Stack(
        children: <Widget>[ScreenBgCard(), _buildBillingInfo()],
      ),
    );
  }

  Widget _buildBillingInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: Dimens.marginMedium2, horizontal: Dimens.marginLarge),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: const Text("ဘဏ်အမည်",
                    style: TextStyle(fontWeight: FontWeight.w600))),
            _buildBankSpinner(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('ဘဏ်မှချလံကို ဓါတ်ပုံရိုက်ပို့ပေးပါရန်',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const Icon(M2Icon.make_picture, size: 20, color: Colors.grey)
              ],
            ),
            Center(child: _buildChoosePhoto()),
            Center(
                child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              padding: const EdgeInsets.only(
                  left: Dimens.marginLargeXX, right: Dimens.marginLargeXX),
              color: Theme.of(context).buttonColor,
              textColor: Colors.white,
              disabledTextColor: Colors.white,
              onPressed: () {
                Modular.to.pop();
              },
              child: const Text("Send"),
            ))
          ]),
    );
  }

  Widget _buildBankSpinner() {
    return Card(
      elevation: Dimens.cardElevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: DropdownButton<String>(
            isExpanded: true,
            underline: Container(),
            hint: Text(_bankList[0]),
            value: _selectedBank,
            onChanged: (bank) {
              setState(() {
                _selectedBank = bank;
              });
            },
            items: _bankList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()),
      ),
    );
  }

  Widget _buildChoosePhoto() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: Dimens.marginLargeXX),
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.width * 0.6,
        color: Colors.grey[300],
        child: InkWell(
          onTap: () async {
            _selectImages();
          },
          child: _selectedImages.isEmpty
              ? Icon(M2Icon.camera_1, color: Colors.black)
              : AssetThumb(
                  asset: _selectedImages[0],
                  width: 250,
                  height: 250,
                  spinner: FadeInImage(
                    fit: BoxFit.cover,
                    image: AssetImage("lib/res/images/earth.jpg"),
                    placeholder: AssetImage("lib/res/images/earth.jpg"),
                  )),
        ));
  }

  Future<void> _selectImages() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
        materialOptions: MaterialOptions(startInAllView: true),
        enableCamera: true,
        selectedAssets: [],
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }

    if (!mounted) return;

    setState(() {
      _selectedImages = resultList;
    });
  }
}
