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
  ObservableMap<Product, int> get cartProducts {
    _$cartProductsAtom.reportRead();
    return super.cartProducts;
  }

  @override
  set cartProducts(ObservableMap<Product, int> value) {
    _$cartProductsAtom.reportWrite(value, super.cartProducts, () {
      super.cartProducts = value;
    });
  }

  final _$selectedProductsAtom = Atom(name: '_StoreCartBase.selectedProducts');

  @override
  ObservableList<Product> get selectedProducts {
    _$selectedProductsAtom.reportRead();
    return super.selectedProducts;
  }

  @override
  set selectedProducts(ObservableList<Product> value) {
    _$selectedProductsAtom.reportWrite(value, super.selectedProducts, () {
      super.selectedProducts = value;
    });
  }

  final _$_StoreCartBaseActionController =
      ActionController(name: '_StoreCartBase');

  @override
  void addToCart(Product product) {
    final _$actionInfo = _$_StoreCartBaseActionController.startAction(
        name: '_StoreCartBase.addToCart');
    try {
      return super.addToCart(product);
    } finally {
      _$_StoreCartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromCart(Product product, {bool all = false}) {
    final _$actionInfo = _$_StoreCartBaseActionController.startAction(
        name: '_StoreCartBase.removeFromCart');
    try {
      return super.removeFromCart(product, all: all);
    } finally {
      _$_StoreCartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showSelect: ${showSelect},
cartProducts: ${cartProducts},
selectedProducts: ${selectedProducts},
cartCount: ${cartCount},
amount: ${amount},
tax: ${tax},
total: ${total}
    ''';
  }
}
