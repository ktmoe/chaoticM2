// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStore, Store {
  Computed<int> _$cartCountComputed;

  @override
  int get cartCount => (_$cartCountComputed ??=
          Computed<int>(() => super.cartCount, name: '_CartStore.cartCount'))
      .value;
  Computed<int> _$amountComputed;

  @override
  int get amount => (_$amountComputed ??=
          Computed<int>(() => super.amount, name: '_CartStore.amount'))
      .value;
  Computed<double> _$taxComputed;

  @override
  double get tax => (_$taxComputed ??=
          Computed<double>(() => super.tax, name: '_CartStore.tax'))
      .value;
  Computed<double> _$totalComputed;

  @override
  double get total => (_$totalComputed ??=
          Computed<double>(() => super.total, name: '_CartStore.total'))
      .value;

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

  final _$addToCartAsyncAction = AsyncAction('_CartStore.addToCart');

  @override
  Future<dynamic> addToCart(Product product) {
    return _$addToCartAsyncAction.run(() => super.addToCart(product));
  }

  final _$fetchCartItemsAsyncAction = AsyncAction('_CartStore.fetchCartItems');

  @override
  Future<dynamic> fetchCartItems({bool refresh = false}) {
    return _$fetchCartItemsAsyncAction
        .run(() => super.fetchCartItems(refresh: refresh));
  }

  final _$updateCartItemQtyAsyncAction =
      AsyncAction('_CartStore.updateCartItemQty');

  @override
  Future<dynamic> updateCartItemQty(String cartId, String updateItem) {
    return _$updateCartItemQtyAsyncAction
        .run(() => super.updateCartItemQty(cartId, updateItem));
  }

  final _$removeItemFromCartAsyncAction =
      AsyncAction('_CartStore.removeItemFromCart');

  @override
  Future<dynamic> removeItemFromCart(String id) {
    return _$removeItemFromCartAsyncAction
        .run(() => super.removeItemFromCart(id));
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
  bool containsInList(Product product) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.containsInList');
    try {
      return super.containsInList(product);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getProductCountById(String id) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.getProductCountById');
    try {
      return super.getProductCountById(id);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
cartCount: ${cartCount},
amount: ${amount},
tax: ${tax},
total: ${total}
    ''';
  }
}
