import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/custom_widgets/one_call_away_widget.dart';
import 'package:m2mobile/pages/main/main_widget.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/stores/store_order_list.dart';
import 'package:m2mobile/stores/store_home.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m2mobile/models/bank_account.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/utils/image_picker_utils.dart';
import 'package:m2mobile/exceptions/app_exception.dart';

class CompleteOrderWidget extends StatefulWidget {
  static const route = "/main/more/order_list/complete_order";

  const CompleteOrderWidget({Key key}) : super(key: key);

  @override
  _CompleteOrderWidgetState createState() => _CompleteOrderWidgetState();
}

class _CompleteOrderWidgetState extends State<CompleteOrderWidget> {
  final StoreOrderList _storeOrderList = Modular.get<StoreOrderList>();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  final List<ReactionDisposer> _disposers = [];

  ReactionDisposer _onException() {
    return reaction<AppException>((_) => _storeOrderList.exception, (e) {
      e.message.makeSnack(_scaffoldState);
    });
  }

  ReactionDisposer _onShowLoading() =>
      reaction<bool>((_) => _storeOrderList.showLoading, (show) {
        if (show) {
          context.loadingDialog();
        } else
          Modular.to.pop();
      });

  ReactionDisposer _onPayOrderSuccess() =>
      reaction<bool>((_) => _storeOrderList.payOrderSuccess, (paid) async {
        if (paid) {
          final a = await context.successFailDialog(
              dialogType: "You sent slip voucher.", success: true);
          if (a) {
            Modular.to.popUntil(ModalRoute.withName(MainWidget.route));
          }
        }
      });

  @override
  void initState() {
    super.initState();
    _disposers.addAll([_onException(), _onShowLoading(), _onPayOrderSuccess()]);
    Future.wait([
      _storeOrderList.init(),
      _storeOrderList.getBankAccounts(),
    ]);
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
      key: _scaffoldState,
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
              onPressed: () async {
                await _storeOrderList
                    .payOrder(Modular.get<StoreHome>().selectedOrderId);
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
            final source = await context.imagePickerDialog();
            _storeOrderList.slipImage = source == 0
                ? await ImagePickerUtils.getImagePicker(gallery: true)
                : await ImagePickerUtils.getImagePicker(gallery: false);
          },
          child: Observer(
              builder: (_) => _storeOrderList.slipImage == null
                  ? Icon(M2Icon.camera_1, color: Colors.black)
                  : Image.file(_storeOrderList.slipImage)),
        ));
  }
}
