// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreProductList on _StoreProductListBase, Store {
  final _$productsAtom = Atom(name: '_StoreProductListBase.products');

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

  final _$subCategoryAtom = Atom(name: '_StoreProductListBase.subCategory');

  @override
  String get subCategory {
    _$subCategoryAtom.reportRead();
    return super.subCategory;
  }

  @override
  set subCategory(String value) {
    _$subCategoryAtom.reportWrite(value, super.subCategory, () {
      super.subCategory = value;
    });
  }

  final _$initDoneAtom = Atom(name: '_StoreProductListBase.initDone');

  @override
  bool get initDone {
    _$initDoneAtom.reportRead();
    return super.initDone;
  }

  @override
  set initDone(bool value) {
    _$initDoneAtom.reportWrite(value, super.initDone, () {
      super.initDone = value;
    });
  }

  final _$exceptionAtom = Atom(name: '_StoreProductListBase.exception');

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

  final _$initAsyncAction = AsyncAction('_StoreProductListBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$getProductsByCategoryAsyncAction =
      AsyncAction('_StoreProductListBase.getProductsByCategory');

  @override
  Future<void> getProductsByCategory(String subcategoryId, bool refresh) {
    return _$getProductsByCategoryAsyncAction
        .run(() => super.getProductsByCategory(subcategoryId, refresh));
  }

  final _$_StoreProductListBaseActionController =
      ActionController(name: '_StoreProductListBase');

  @override
  void updateProducts() {
    final _$actionInfo = _$_StoreProductListBaseActionController.startAction(
        name: '_StoreProductListBase.updateProducts');
    try {
      return super.updateProducts();
    } finally {
      _$_StoreProductListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
subCategory: ${subCategory},
initDone: ${initDone},
exception: ${exception}
    ''';
  }
}
