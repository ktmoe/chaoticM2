import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/m2_stepper.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/pages/main/cart/cart_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/custom_widgets/one_call_away_widget.dart';
import 'package:m2mobile/models/ui_model/payment_methods_model.dart';
import 'package:m2mobile/stores/store_order.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/exceptions/app_exception.dart';

class OrderWidget extends StatefulWidget {
  static const route = "/main/cart/order";

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  final StoreOrder _storeOrder = Modular.get<StoreOrder>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

  final List<ReactionDisposer> _disposers = [];

  int currentStep;
  bool complete = false;

  ReactionDisposer _onException() =>
      reaction<AppException>((_) => _storeOrder.exception, (e) {
        e.message.showSnack(context);
      });

  ReactionDisposer _onShowLoading() =>
      reaction<bool>((_) => _storeOrder.showLoading, (show) {
        if (show) {
          context.loadingDialog();
        } else
          Modular.to.pop();
      });

  ReactionDisposer _onOrderPostSuccess() =>
      reaction<bool>((_) => _storeOrder.orderPostSuccess, (success) async {
        if (success) {
          final a = await context.successFailDialog(
              dialogType: 'Your Order is posted!', success: true);
          if (a) {
            Modular.to.pushReplacementNamed(CartWidget.route, arguments: true);
          }
        }
      });

  @override
  void initState() {
    super.initState();
    currentStep = 0;
    _disposers
        .addAll([_onException(), _onOrderPostSuccess(), _onShowLoading()]);
    _storeOrder.init();
    _autoFillOldData();
  }

  @override
  void dispose() {
    _disposers.forEach((element) {
      element();
    });
    super.dispose();
  }

  void _autoFillOldData() {
    _phoneController.text = _storeOrder.phoneNumber;
    _addressController.text = _storeOrder.address;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await context.standardWarningDialog(
            dialogType: WarningDialogType.orderCancelDialog);
      },
      child: Scaffold(
        key: _scaffoldState,
        appBar: M2AppBar(
          showSearch: false,
          title: "Order",
          deleteOnly: false,
          onBackPressed: cancel,
        ),
        body: Stack(
          children: <Widget>[
            ScreenBgCard(),
            Observer(builder: (context) {
              return M2Stepper(
                steps: [
                  M2Step(
                      isActive: currentStep == 0,
                      title: const Text('Phone Number',
                          style: TextStyle(fontSize: Dimens.textRegular2x)),
                      subtitle: const Text("ဖုန်းနံပါတ် - 09XXXXXXXX",
                          style: TextStyle(fontSize: Dimens.textRegular)),
                      state: currentStep > 0
                          ? M2StepState.complete
                          : M2StepState.indexed,
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                              "အော်ဒါပစ္စည်းများ လက်ခံမည့်ဖုန်းနံပါတ်ထည့်ပေးပါရန်"),
                          const SizedBox(height: Dimens.marginMedium),
                          _buildPhoneTextField()
                        ],
                      ),
                      isLast: false),
                  M2Step(
                      isActive: currentStep == 1,
                      state: currentStep > 1
                          ? M2StepState.complete
                          : M2StepState.indexed,
                      title: const Text('OTP Code',
                          style: TextStyle(fontSize: Dimens.textRegular2x)),
                      subtitle: const Text("One Time Password Code",
                          style: TextStyle(fontSize: Dimens.textRegular)),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              "We have send an OTP to your number\n ${_storeOrder.phoneNumber}"),
                          const SizedBox(height: Dimens.marginMedium),
                          _buildOtpTextField()
                        ],
                      ),
                      isLast: false),
                  M2Step(
                      isActive: currentStep == 2,
                      state: currentStep > 2
                          ? M2StepState.complete
                          : M2StepState.indexed,
                      title: const Text('Address',
                          style: TextStyle(fontSize: Dimens.textRegular2x)),
                      subtitle: Text(
                          currentStep != 2
                              ? "Address - ${_storeOrder.address}."
                              : "အော်ဒါပစ္စည်းများ ပေးပို့ရမည့်လိပ်စာထည့်ပေးပါရန်",
                          overflow: TextOverflow.visible,
                          style: TextStyle(fontSize: Dimens.textRegular)),
                      content: _buildAddressTextField(),
                      isLast: false),
                  M2Step(
                      isActive: currentStep == 3,
                      state: currentStep > 3
                          ? M2StepState.complete
                          : M2StepState.indexed,
                      title: const Text('Payment Method',
                          style: TextStyle(fontSize: Dimens.textRegular2x)),
                      content: _buildPaymentRadioList(),
                      isLast: false),
                  M2Step(
                      isActive: currentStep == 4,
                      state: currentStep == 4
                          ? M2StepState.complete
                          : M2StepState.indexed,
                      title: const Text('Confirm Order',
                          style: TextStyle(fontSize: Dimens.textRegular2x)),
                      content: Container(),
                      isLast: true),
                ],
                currentStep: currentStep,
                onStepContinue: () async {
                  await next();
                },
                onStepTapped: (step) {
                  if (step < currentStep) {
                    goTo(step);
                  }
                },
                onStepCancel: cancel,
              );
            })
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneTextField() {
    return TextFormField(
        controller: _phoneController,
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            suffixIcon: const Icon(M2Icon.edit),
            labelText: 'Phone Number'),
        onChanged: (value) => _storeOrder.phoneNumber = value,
        onFieldSubmitted: (value) => _storeOrder.phoneNumber = value);
  }

  Widget _buildOtpTextField() {
    return TextFormField(
        controller: _otpController,
        keyboardType: TextInputType.number,
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            labelText: 'OTP Code'),
        onChanged: (value) => _storeOrder.otpCode = value,
        onFieldSubmitted: (value) => _storeOrder.otpCode = value);
  }

  Widget _buildAddressTextField() {
    return TextFormField(
      controller: _addressController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1),
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          suffixIcon: const Icon(M2Icon.edit),
          labelText: 'Address'),
      onChanged: (value) => _storeOrder.address = value,
      onFieldSubmitted: (value) => _storeOrder.address = value,
    );
  }

  Widget _buildPaymentRadioList() => Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 3,
                  minWidth: MediaQuery.of(context).size.width / 3),
              child: RadioListTile<String>(
                  dense: true,
                  value: PaymentMethodsModel.kbzPay,
                  groupValue: _storeOrder.selectedPaymentMethod,
                  selected: _storeOrder.selectedPaymentMethod ==
                      PaymentMethodsModel.kbzPay,
                  onChanged: (value) =>
                      _storeOrder.selectedPaymentMethod = value,
                  title: Text(PaymentMethodsModel.kbzPay)),
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 3,
                  minWidth: MediaQuery.of(context).size.width / 3),
              child: RadioListTile<String>(
                  dense: true,
                  value: PaymentMethodsModel.bankPay,
                  groupValue: _storeOrder.selectedPaymentMethod,
                  selected: _storeOrder.selectedPaymentMethod ==
                      PaymentMethodsModel.bankPay,
                  onChanged: (value) =>
                      _storeOrder.selectedPaymentMethod = value,
                  title: Text(PaymentMethodsModel.bankPay)),
            )
          ]);

  next() async {
    currentStep + 1 != 5 ? goTo(currentStep + 1) : await _nextPage();
  }

  _nextPage() async {
    await _storeOrder.postOrder();
  }

  cancel() async {
    final willCancel = await context.standardWarningDialog(
        dialogType: WarningDialogType.orderCancelDialog);
    if (willCancel) Modular.to.pop();
  }

  goTo(int step) {
    var validity = _validateStep(step);
    if (validity) {
      setState(() => currentStep = step);
    } else
      "Please fill full info.".makeSnack(_scaffoldState);
  }

  bool _validateStep(int step) {
    switch (step) {
      case 1:
        {
          return _storeOrder.phoneNumber.isEmpty ? false : true;
        }
      case 2:
        {
          return _storeOrder.otpCode.isEmpty ? false : true;
        }
      case 3:
        {
          return _storeOrder.address.isEmpty ? false : true;
        }
      case 4:
        {
          return _storeOrder.selectedPaymentMethod.isEmpty ? false : true;
        }
      default:
        return true;
    }
  }
}
