// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_fav.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreFav on _StoreFav, Store {
  final _$favsAtom = Atom(name: '_StoreFav.favs');

  @override
  ObservableList<Product> get favs {
    _$favsAtom.reportRead();
    return super.favs;
  }

  @override
  set favs(ObservableList<Product> value) {
    _$favsAtom.reportWrite(value, super.favs, () {
      super.favs = value;
    });
  }

  final _$latestCurrentPageAtom = Atom(name: '_StoreFav.latestCurrentPage');

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

  final _$latestTotalPageAtom = Atom(name: '_StoreFav.latestTotalPage');

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

  final _$exceptionAtom = Atom(name: '_StoreFav.exception');

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

  final _$initAsyncAction = AsyncAction('_StoreFav.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$fetchFavListAsyncAction = AsyncAction('_StoreFav.fetchFavList');

  @override
  Future<dynamic> fetchFavList(bool refresh) {
    return _$fetchFavListAsyncAction.run(() => super.fetchFavList(refresh));
  }

  final _$_StoreFavActionController = ActionController(name: '_StoreFav');

  @override
  void updateFavs() {
    final _$actionInfo =
        _$_StoreFavActionController.startAction(name: '_StoreFav.updateFavs');
    try {
      return super.updateFavs();
    } finally {
      _$_StoreFavActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favs: ${favs},
latestCurrentPage: ${latestCurrentPage},
latestTotalPage: ${latestTotalPage},
exception: ${exception}
    ''';
  }
}
