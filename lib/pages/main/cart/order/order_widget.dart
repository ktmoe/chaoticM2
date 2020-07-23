import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/m2_stepper.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/pages/main/more/order_list/order_list_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/custom_widgets/one_call_away_widget.dart';
import 'package:m2mobile/models/ui_model/payment_methods_model.dart';
import 'package:m2mobile/stores/store_order.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OrderWidget extends StatefulWidget {
  static const route = "/main/cart/order";

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  final StoreOrder _storeOrder = Modular.get<StoreOrder>();
  int currentStep;
  bool complete = false;

  @override
  void initState() {
    super.initState();
    currentStep = 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await context.standardWarningDialog(
            dialogType: WarningDialogType.orderCancelDialog);
      },
      child: Scaffold(
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
                          style: TextStyle(fontSize: Dimens.textRegular2x)),
                      state: currentStep > 0
                          ? M2StepState.complete
                          : M2StepState.indexed,
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text("Please fill in phone number."),
                          const SizedBox(height: Dimens.marginMedium),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                                labelText: 'Phone Number'),
                          ),
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
                          style: TextStyle(fontSize: Dimens.textRegular2x)),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                              "We have send an OTP to your number\n +95 9790428136"),
                          const SizedBox(height: Dimens.marginMedium),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                                labelText: 'OTP Code'),
                          ),
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
                      subtitle: const Text(
                          "Address - Cloud 9, Eutopia, Euphoria Country.",
                          overflow: TextOverflow.visible,
                          style: TextStyle(fontSize: Dimens.textRegular2x)),
                      content: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            labelText: 'Address'),
                      ),
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
                onStepContinue: next,
                onStepTapped: (step) => goTo(step),
                onStepCancel: cancel,
              );
            })
          ],
        ),
      ),
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

  next() {
    currentStep + 1 != 5
        ? goTo(currentStep + 1)
        : Modular.to.pushReplacementNamed(OrderListWidget.route);
  }

  cancel() async {
    final willCancel = await context.standardWarningDialog(
        dialogType: WarningDialogType.orderCancelDialog);
    if (willCancel) Modular.to.pop();
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }
}
