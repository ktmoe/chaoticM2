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

  final _$latestCurrentPageAtom = Atom(name: '_StoreHome.latestCurrentPage');

  @override
  int get latestCurrentPage {
    _$latestCurrentPageAtom.reportRead();
    return super.latestCurrentPage;
  }

  @override
  set latestCurrentPage(int value) {
    _$latestCurrentPageAtom.reportWrite(value, super.latestCurrentPage, () {
      super.latestCurrentPage = value;
    });
  }

  final _$latestTotalPageAtom = Atom(name: '_StoreHome.latestTotalPage');

  @override
  int get latestTotalPage {
    _$latestTotalPageAtom.reportRead();
    return super.latestTotalPage;
  }

  @override
  set latestTotalPage(int value) {
    _$latestTotalPageAtom.reportWrite(value, super.latestTotalPage, () {
      super.latestTotalPage = value;
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

  final _$selectedOrderIdAtom = Atom(name: '_StoreHome.selectedOrderId');

  @override
  String get selectedOrderId {
    _$selectedOrderIdAtom.reportRead();
    return super.selectedOrderId;
  }

  @override
  set selectedOrderId(String value) {
    _$selectedOrderIdAtom.reportWrite(value, super.selectedOrderId, () {
      super.selectedOrderId = value;
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
  Future<dynamic> getLatestProducts(bool refresh) {
    return _$getLatestProductsAsyncAction
        .run(() => super.getLatestProducts(refresh));
  }

  final _$getDiscountProductsAsyncAction =
      AsyncAction('_StoreHome.getDiscountProducts');

  @override
  Future<dynamic> getDiscountProducts({bool refresh = true}) {
    return _$getDiscountProductsAsyncAction
        .run(() => super.getDiscountProducts(refresh: refresh));
  }

  final _$operateFavoriteAsyncAction =
      AsyncAction('_StoreHome.operateFavorite');

  @override
  Future<dynamic> operateFavorite(Product product) {
    return _$operateFavoriteAsyncAction
        .run(() => super.operateFavorite(product));
  }

  final _$_onFavoriteSyncProductsAsyncAction =
      AsyncAction('_StoreHome._onFavoriteSyncProducts');

  @override
  Future<void> _onFavoriteSyncProducts(Product product, FavoriteId favoriteId) {
    return _$_onFavoriteSyncProductsAsyncAction
        .run(() => super._onFavoriteSyncProducts(product, favoriteId));
  }

  final _$_syncFavoriteBoxAsyncAction =
      AsyncAction('_StoreHome._syncFavoriteBox');

  @override
  Future<dynamic> _syncFavoriteBox(Product product) {
    return _$_syncFavoriteBoxAsyncAction
        .run(() => super._syncFavoriteBox(product));
  }

  final _$_StoreHomeActionController = ActionController(name: '_StoreHome');

  @override
  void updateLatestProducts() {
    final _$actionInfo = _$_StoreHomeActionController.startAction(
        name: '_StoreHome.updateLatestProducts');
    try {
      return super.updateLatestProducts();
    } finally {
      _$_StoreHomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDiscountProducts() {
    final _$actionInfo = _$_StoreHomeActionController.startAction(
        name: '_StoreHome.updateDiscountProducts');
    try {
      return super.updateDiscountProducts();
    } finally {
      _$_StoreHomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  FavoriteItemPayload _getFavoriteItemPayload(Product product) {
    final _$actionInfo = _$_StoreHomeActionController.startAction(
        name: '_StoreHome._getFavoriteItemPayload');
    try {
      return super._getFavoriteItemPayload(product);
    } finally {
      _$_StoreHomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  DeleteFavoriteItemPayload _getDeleteFavoriteItemPayload(Product product) {
    final _$actionInfo = _$_StoreHomeActionController.startAction(
        name: '_StoreHome._getDeleteFavoriteItemPayload');
    try {
      return super._getDeleteFavoriteItemPayload(product);
    } finally {
      _$_StoreHomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exception: ${exception},
latestCurrentPage: ${latestCurrentPage},
latestTotalPage: ${latestTotalPage},
products: ${products},
discountProducts: ${discountProducts},
selectedOrderId: ${selectedOrderId}
    ''';
  }
}
