// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_app.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreApp on _StoreApp, Store {
  Computed<bool> _$isNetworkOnComputed;

  @override
  bool get isNetworkOn =>
      (_$isNetworkOnComputed ??= Computed<bool>(() => super.isNetworkOn,
              name: '_StoreApp.isNetworkOn'))
          .value;
  Computed<String> _$connectivityMessageComputed;

  @override
  String get connectivityMessage => (_$connectivityMessageComputed ??=
          Computed<String>(() => super.connectivityMessage,
              name: '_StoreApp.connectivityMessage'))
      .value;

  final _$connectivityAtom = Atom(name: '_StoreApp.connectivity');

  @override
  ObservableStream<bool> get connectivity {
    _$connectivityAtom.reportRead();
    return super.connectivity;
  }

  @override
  set connectivity(ObservableStream<bool> value) {
    _$connectivityAtom.reportWrite(value, super.connectivity, () {
      super.connectivity = value;
    });
  }

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
connectivity: ${connectivity},
exception: ${exception},
forceUpdate: ${forceUpdate},
isFirstTime: ${isFirstTime},
<<<<<<< HEAD
isLoggedIn: ${isLoggedIn},
isNetworkOn: ${isNetworkOn},
connectivityMessage: ${connectivityMessage}
=======
chosenLanguage: ${chosenLanguage}
>>>>>>> 6e83aa3cb3bb7419c975a95480c3949d2b1ea615
    ''';
  }
}
