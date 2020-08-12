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

  final _$getProductsByCategoryAsyncAction =
      AsyncAction('_StoreProductListBase.getProductsByCategory');

  @override
  Future<void> getProductsByCategory(String subcategoryId, bool refresh) {
    return _$getProductsByCategoryAsyncAction
        .run(() => super.getProductsByCategory(subcategoryId, refresh));
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
