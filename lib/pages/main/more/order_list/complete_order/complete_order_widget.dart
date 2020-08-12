import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:m2mobile/stores/store_order_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m2mobile/models/bank_account.dart';

class CompleteOrderWidget extends StatefulWidget {
  static const route = "/main/more/order_list/complete_order";

  @override
  _CompleteOrderWidgetState createState() => _CompleteOrderWidgetState();
}

class _CompleteOrderWidgetState extends State<CompleteOrderWidget> {
  StoreOrderList _storeOrderList = Modular.get<StoreOrderList>();

  List<Asset> _selectedImages = <Asset>[];

  @override
  void initState() {
    super.initState();
    _storeOrderList.init();
    _storeOrderList.getBankAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M2AppBar(
          showSearch: false,
          title: '‌ငွေလွှဲစလစ်ပို့ရန်',
          deleteOnly: false,
          onBackPressed: () => Modular.to.pop()),
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
        child: Observer(builder: (_) {
          return DropdownButton<BankAccount>(
              isExpanded: true,
              underline: Container(),
              hint: _storeOrderList.bankAccounts.isNotEmpty
                  ? Text(
                      '${_storeOrderList.bankAccounts.first.bank} (${_storeOrderList.bankAccounts.first.account})')
                  : Text(''),
              value: _storeOrderList.selectedBankAccount,
              onChanged: (bank) {
                _storeOrderList.selectedBankAccount = bank;
              },
              items: _storeOrderList.bankAccounts.map((BankAccount value) {
                return DropdownMenuItem<BankAccount>(
                  value: value,
                  child: Text('${value.bank} (${value.account})'),
                );
              }).toList());
        }),
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
                    image: AssetImage("lib/res/images/placeholder.png"),
                    placeholder: AssetImage("lib/res/images/placeholder.png"),
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
