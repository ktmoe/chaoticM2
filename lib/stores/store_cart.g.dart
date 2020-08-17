// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_cart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreCart on _StoreCartBase, Store {
  Computed<int> _$cartCountComputed;

  @override
  int get cartCount =>
      (_$cartCountComputed ??= Computed<int>(() => super.cartCount,
              name: '_StoreCartBase.cartCount'))
          .value;
  Computed<int> _$amountComputed;

  @override
  int get amount => (_$amountComputed ??=
          Computed<int>(() => super.amount, name: '_StoreCartBase.amount'))
      .value;
  Computed<double> _$taxComputed;

  @override
  double get tax => (_$taxComputed ??=
          Computed<double>(() => super.tax, name: '_StoreCartBase.tax'))
      .value;
  Computed<double> _$totalComputed;

  @override
  double get total => (_$totalComputed ??=
          Computed<double>(() => super.total, name: '_StoreCartBase.total'))
      .value;

  final _$showSelectAtom = Atom(name: '_StoreCartBase.showSelect');

  @override
  bool get showSelect {
    _$showSelectAtom.reportRead();
    return super.showSelect;
  }

  @override
  set showSelect(bool value) {
    _$showSelectAtom.reportWrite(value, super.showSelect, () {
      super.showSelect = value;
    });
  }

  final _$cartProductsAtom = Atom(name: '_StoreCartBase.cartProducts');

  @override
  ObservableMap<String, Product> get cartProducts {
    _$cartProductsAtom.reportRead();
    return super.cartProducts;
  }

  @override
  set cartProducts(ObservableMap<String, Product> value) {
    _$cartProductsAtom.reportWrite(value, super.cartProducts, () {
      super.cartProducts = value;
    });
  }

  final _$selectedProductIdsAtom =
      Atom(name: '_StoreCartBase.selectedProductIds');

  @override
  ObservableList<String> get selectedProductIds {
    _$selectedProductIdsAtom.reportRead();
    return super.selectedProductIds;
  }

  @override
  set selectedProductIds(ObservableList<String> value) {
    _$selectedProductIdsAtom.reportWrite(value, super.selectedProductIds, () {
      super.selectedProductIds = value;
    });
  }

  final _$exceptionAtom = Atom(name: '_StoreCartBase.exception');

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

  final _$addToCartAsyncAction = AsyncAction('_StoreCartBase.addToCart');

  @override
  Future<void> addToCart(Product product) {
    return _$addToCartAsyncAction.run(() => super.addToCart(product));
  }

  final _$removeFromCartAsyncAction =
      AsyncAction('_StoreCartBase.removeFromCart');

  @override
  Future<dynamic> removeFromCart(Product product, {bool all = false}) {
    return _$removeFromCartAsyncAction
        .run(() => super.removeFromCart(product, all: all));
  }

  final _$getCartItemsAsyncAction = AsyncAction('_StoreCartBase.getCartItems');

  @override
  Future<dynamic> getCartItems() {
    return _$getCartItemsAsyncAction.run(() => super.getCartItems());
  }

  final _$_StoreCartBaseActionController =
      ActionController(name: '_StoreCartBase');

  @override
  void _onBoxCartChanged() {
    final _$actionInfo = _$_StoreCartBaseActionController.startAction(
        name: '_StoreCartBase._onBoxCartChanged');
    try {
      return super._onBoxCartChanged();
    } finally {
      _$_StoreCartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  AddToCartRequest _addToCartRequest(Product p) {
    final _$actionInfo = _$_StoreCartBaseActionController.startAction(
        name: '_StoreCartBase._addToCartRequest');
    try {
      return super._addToCartRequest(p);
    } finally {
      _$_StoreCartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  UpdateCartRequest _updateCartRequest(Product p) {
    final _$actionInfo = _$_StoreCartBaseActionController.startAction(
        name: '_StoreCartBase._updateCartRequest');
    try {
      return super._updateCartRequest(p);
    } finally {
      _$_StoreCartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  DeleteCartListRequest _deleteCartListRequest(Product p) {
    final _$actionInfo = _$_StoreCartBaseActionController.startAction(
        name: '_StoreCartBase._deleteCartListRequest');
    try {
      return super._deleteCartListRequest(p);
    } finally {
      _$_StoreCartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Product cartProductById(String id) {
    final _$actionInfo = _$_StoreCartBaseActionController.startAction(
        name: '_StoreCartBase.cartProductById');
    try {
      return super.cartProductById(id);
    } finally {
      _$_StoreCartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void emptyTheCart() {
    final _$actionInfo = _$_StoreCartBaseActionController.startAction(
        name: '_StoreCartBase.emptyTheCart');
    try {
      return super.emptyTheCart();
    } finally {
      _$_StoreCartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showSelect: ${showSelect},
cartProducts: ${cartProducts},
selectedProductIds: ${selectedProductIds},
exception: ${exception},
cartCount: ${cartCount},
amount: ${amount},
tax: ${tax},
total: ${total}
    ''';
  }
}
