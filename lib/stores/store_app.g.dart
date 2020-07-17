// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_app.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreApp on _StoreApp, Store {
  final _$exceptionAtom = Atom(name: '_StoreApp.exception');

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

  final _$forceUpdateAtom = Atom(name: '_StoreApp.forceUpdate');

  @override
  bool get forceUpdate {
    _$forceUpdateAtom.reportRead();
    return super.forceUpdate;
  }

  @override
  set forceUpdate(bool value) {
    _$forceUpdateAtom.reportWrite(value, super.forceUpdate, () {
      super.forceUpdate = value;
    });
  }

  final _$isFirstTimeAtom = Atom(name: '_StoreApp.isFirstTime');

  @override
  bool get isFirstTime {
    _$isFirstTimeAtom.reportRead();
    return super.isFirstTime;
  }

  @override
  set isFirstTime(bool value) {
    _$isFirstTimeAtom.reportWrite(value, super.isFirstTime, () {
      super.isFirstTime = value;
    });
  }

  final _$chosenLanguageAtom = Atom(name: '_StoreApp.chosenLanguage');

  @override
  Language get chosenLanguage {
    _$chosenLanguageAtom.reportRead();
    return super.chosenLanguage;
  }

  @override
  set chosenLanguage(Language value) {
    _$chosenLanguageAtom.reportWrite(value, super.chosenLanguage, () {
      super.chosenLanguage = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_StoreApp.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$checkForceUpdateAsyncAction =
      AsyncAction('_StoreApp.checkForceUpdate');

  @override
  Future<dynamic> checkForceUpdate() {
    return _$checkForceUpdateAsyncAction.run(() => super.checkForceUpdate());
  }

  final _$changeFirstTimeAsyncAction = AsyncAction('_StoreApp.changeFirstTime');

  @override
  Future<dynamic> changeFirstTime() {
    return _$changeFirstTimeAsyncAction.run(() => super.changeFirstTime());
  }

  final _$_StoreAppActionController = ActionController(name: '_StoreApp');

  @override
  void changeLanguagePref(Language language) {
    final _$actionInfo = _$_StoreAppActionController.startAction(
        name: '_StoreApp.changeLanguagePref');
    try {
      return super.changeLanguagePref(language);
    } finally {
      _$_StoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  void readIsFirstTime() {
    final _$actionInfo = _$_StoreAppActionController.startAction(
        name: '_StoreApp.readIsFirstTime');
    try {
      return super.readIsFirstTime();
    } finally {
      _$_StoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo =
        _$_StoreAppActionController.startAction(name: '_StoreApp.dispose');
    try {
      return super.dispose();
    } finally {
      _$_StoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exception: ${exception},
forceUpdate: ${forceUpdate},
isFirstTime: ${isFirstTime},
chosenLanguage: ${chosenLanguage}
    ''';
  }
}
