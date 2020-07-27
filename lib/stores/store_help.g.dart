// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_help.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreHelp on _StoreHelp, Store {
  final _$phonesAtom = Atom(name: '_StoreHelp.phones');

  @override
  ObservableList<String> get phones {
    _$phonesAtom.reportRead();
    return super.phones;
  }

  @override
  set phones(ObservableList<String> value) {
    _$phonesAtom.reportWrite(value, super.phones, () {
      super.phones = value;
    });
  }

  final _$exceptionAtom = Atom(name: '_StoreHelp.exception');

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

  final _$initAsyncAction = AsyncAction('_StoreHelp.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_StoreHelpActionController = ActionController(name: '_StoreHelp');

  @override
  void updateInfo() {
    final _$actionInfo =
        _$_StoreHelpActionController.startAction(name: '_StoreHelp.updateInfo');
    try {
      return super.updateInfo();
    } finally {
      _$_StoreHelpActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phones: ${phones},
exception: ${exception}
    ''';
  }
}
