// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStore, Store {
  final _$errorAtom = Atom(name: '_CartStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_CartStore.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$fetchCartItemsAsyncAction = AsyncAction('_CartStore.fetchCartItems');

  @override
  Future<dynamic> fetchCartItems({bool refresh = false}) {
    return _$fetchCartItemsAsyncAction
        .run(() => super.fetchCartItems(refresh: refresh));
  }

  final _$_CartStoreActionController = ActionController(name: '_CartStore');

  @override
  void updateCart() {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.updateCart');
    try {
      return super.updateCart();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error}
    ''';
  }
}
