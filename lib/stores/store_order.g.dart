// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_order.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreOrder on _StoreOrderBase, Store {
  final _$phoneNumberAtom = Atom(name: '_StoreOrderBase.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$otpCodeAtom = Atom(name: '_StoreOrderBase.otpCode');

  @override
  String get otpCode {
    _$otpCodeAtom.reportRead();
    return super.otpCode;
  }

  @override
  set otpCode(String value) {
    _$otpCodeAtom.reportWrite(value, super.otpCode, () {
      super.otpCode = value;
    });
  }

  final _$addressAtom = Atom(name: '_StoreOrderBase.address');

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$selectedPaymentMethodAtom =
      Atom(name: '_StoreOrderBase.selectedPaymentMethod');

  @override
  String get selectedPaymentMethod {
    _$selectedPaymentMethodAtom.reportRead();
    return super.selectedPaymentMethod;
  }

  @override
  set selectedPaymentMethod(String value) {
    _$selectedPaymentMethodAtom.reportWrite(value, super.selectedPaymentMethod,
        () {
      super.selectedPaymentMethod = value;
    });
  }

  final _$_StoreOrderBaseActionController =
      ActionController(name: '_StoreOrderBase');

  @override
  void init() {
    final _$actionInfo = _$_StoreOrderBaseActionController.startAction(
        name: '_StoreOrderBase.init');
    try {
      return super.init();
    } finally {
      _$_StoreOrderBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phoneNumber: ${phoneNumber},
otpCode: ${otpCode},
address: ${address},
selectedPaymentMethod: ${selectedPaymentMethod}
    ''';
  }
}
