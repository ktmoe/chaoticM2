// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreHome on _StoreHome, Store {
  final _$exceptionAtom = Atom(name: '_StoreHome.exception');

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

  final _$productsAtom = Atom(name: '_StoreHome.products');

  @override
  ObservableList<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$discountProductsAtom = Atom(name: '_StoreHome.discountProducts');

  @override
  ObservableList<Product> get discountProducts {
    _$discountProductsAtom.reportRead();
    return super.discountProducts;
  }

  @override
  set discountProducts(ObservableList<Product> value) {
    _$discountProductsAtom.reportWrite(value, super.discountProducts, () {
      super.discountProducts = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_StoreHome.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$getLatestProductsAsyncAction =
      AsyncAction('_StoreHome.getLatestProducts');

  @override
  Future<dynamic> getLatestProducts({bool refresh = true}) {
    return _$getLatestProductsAsyncAction
        .run(() => super.getLatestProducts(refresh: refresh));
  }

  final _$getDiscountProductsAsyncAction =
      AsyncAction('_StoreHome.getDiscountProducts');

  @override
  Future<dynamic> getDiscountProducts({bool refresh = true}) {
    return _$getDiscountProductsAsyncAction
        .run(() => super.getDiscountProducts(refresh: refresh));
  }

  final _$_StoreHomeActionController = ActionController(name: '_StoreHome');

  @override
  void updateProducts() {
    final _$actionInfo = _$_StoreHomeActionController.startAction(
        name: '_StoreHome.updateProducts');
    try {
      return super.updateProducts();
    } finally {
      _$_StoreHomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDiscountProdcucts() {
    final _$actionInfo = _$_StoreHomeActionController.startAction(
        name: '_StoreHome.updateDiscountProdcucts');
    try {
      return super.updateDiscountProdcucts();
    } finally {
      _$_StoreHomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exception: ${exception},
products: ${products},
discountProducts: ${discountProducts}
    ''';
  }
}
