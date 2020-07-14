// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_fav.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreFav on _StoreFav, Store {
  final _$favsAtom = Atom(name: '_StoreFav.favs');

  @override
  List<Product> get favs {
    _$favsAtom.reportRead();
    return super.favs;
  }

  @override
  set favs(List<Product> value) {
    _$favsAtom.reportWrite(value, super.favs, () {
      super.favs = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_StoreFav.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$fetchFavListAsyncAction = AsyncAction('_StoreFav.fetchFavList');

  @override
  Future<dynamic> fetchFavList({bool refresh = false}) {
    return _$fetchFavListAsyncAction
        .run(() => super.fetchFavList(refresh: refresh));
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
favs: ${favs}
    ''';
  }
}
