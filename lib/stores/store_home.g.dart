// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreHome on _StoreHome, Store {
  final _$productsAtom = Atom(name: '_StoreHome.products');

  @override
  List<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_StoreHome.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$getProductListAsyncAction = AsyncAction('_StoreHome.getProductList');

  @override
  Future<dynamic> getProductList({bool refresh = false}) {
    return _$getProductListAsyncAction
        .run(() => super.getProductList(refresh: refresh));
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
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
