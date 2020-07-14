// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_help.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreHelp on _StoreHelp, Store {
  final _$helpInfoAtom = Atom(name: '_StoreHelp.helpInfo');

  @override
  Help get helpInfo {
    _$helpInfoAtom.reportRead();
    return super.helpInfo;
  }

  @override
  set helpInfo(Help value) {
    _$helpInfoAtom.reportWrite(value, super.helpInfo, () {
      super.helpInfo = value;
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
helpInfo: ${helpInfo}
    ''';
  }
}
