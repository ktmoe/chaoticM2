// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_order_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreOrderList on _StoreOrderListBase, Store {
  final _$exceptionAtom = Atom(name: '_StoreOrderListBase.exception');

  @override
  AppException<dynamic> get exception {
    _$exceptionAtom.reportRead();
    return super.exception;
  }

  @override
  set exception(AppException<dynamic> value) {
    _$exceptionAtom.reportWrite(value, super.exception, () {
      super.exception = value;
    });
  }

  final _$bankAccountsAtom = Atom(name: '_StoreOrderListBase.bankAccounts');

  @override
  ObservableList<BankAccount> get bankAccounts {
    _$bankAccountsAtom.reportRead();
    return super.bankAccounts;
  }

  @override
  set bankAccounts(ObservableList<BankAccount> value) {
    _$bankAccountsAtom.reportWrite(value, super.bankAccounts, () {
      super.bankAccounts = value;
    });
  }

  final _$selectedBankAccountAtom =
      Atom(name: '_StoreOrderListBase.selectedBankAccount');

  @override
  BankAccount get selectedBankAccount {
    _$selectedBankAccountAtom.reportRead();
    return super.selectedBankAccount;
  }

  @override
  set selectedBankAccount(BankAccount value) {
    _$selectedBankAccountAtom.reportWrite(value, super.selectedBankAccount, () {
      super.selectedBankAccount = value;
    });
  }

  final _$hasInitializedAtom = Atom(name: '_StoreOrderListBase.hasInitialized');

  @override
  bool get hasInitialized {
    _$hasInitializedAtom.reportRead();
    return super.hasInitialized;
  }

  @override
  set hasInitialized(bool value) {
    _$hasInitializedAtom.reportWrite(value, super.hasInitialized, () {
      super.hasInitialized = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_StoreOrderListBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$getBankAccountsAsyncAction =
      AsyncAction('_StoreOrderListBase.getBankAccounts');

  @override
  Future<void> getBankAccounts() {
    return _$getBankAccountsAsyncAction.run(() => super.getBankAccounts());
  }

  final _$_StoreOrderListBaseActionController =
      ActionController(name: '_StoreOrderListBase');

  @override
  void _onBoxBankAccountsChanged() {
    final _$actionInfo = _$_StoreOrderListBaseActionController.startAction(
        name: '_StoreOrderListBase._onBoxBankAccountsChanged');
    try {
      return super._onBoxBankAccountsChanged();
    } finally {
      _$_StoreOrderListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exception: ${exception},
bankAccounts: ${bankAccounts},
selectedBankAccount: ${selectedBankAccount},
hasInitialized: ${hasInitialized}
    ''';
  }
}
