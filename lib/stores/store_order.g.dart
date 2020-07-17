// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_order.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreOrder on _StoreOrderBase, Store {
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

  @override
  String toString() {
    return '''
selectedPaymentMethod: ${selectedPaymentMethod}
    ''';
  }
}
