// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_login.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreLogin on _StoreLoginBase, Store {
  final _$phoneAtom = Atom(name: '_StoreLoginBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$passwordAtom = Atom(name: '_StoreLoginBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$phoneErrorStringAtom = Atom(name: '_StoreLoginBase.phoneErrorString');

  @override
  String get phoneErrorString {
    _$phoneErrorStringAtom.reportRead();
    return super.phoneErrorString;
  }

  @override
  set phoneErrorString(String value) {
    _$phoneErrorStringAtom.reportWrite(value, super.phoneErrorString, () {
      super.phoneErrorString = value;
    });
  }

  final _$passwordErrorStringAtom =
      Atom(name: '_StoreLoginBase.passwordErrorString');

  @override
  String get passwordErrorString {
    _$passwordErrorStringAtom.reportRead();
    return super.passwordErrorString;
  }

  @override
  set passwordErrorString(String value) {
    _$passwordErrorStringAtom.reportWrite(value, super.passwordErrorString, () {
      super.passwordErrorString = value;
    });
  }

  final _$exceptionAtom = Atom(name: '_StoreLoginBase.exception');

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

  final _$loadingApiAtom = Atom(name: '_StoreLoginBase.loadingApi');

  @override
  bool get loadingApi {
    _$loadingApiAtom.reportRead();
    return super.loadingApi;
  }

  @override
  set loadingApi(bool value) {
    _$loadingApiAtom.reportWrite(value, super.loadingApi, () {
      super.loadingApi = value;
    });
  }

  final _$userProfileChangedAtom =
      Atom(name: '_StoreLoginBase.userProfileChanged');

  @override
  bool get userProfileChanged {
    _$userProfileChangedAtom.reportRead();
    return super.userProfileChanged;
  }

  @override
  set userProfileChanged(bool value) {
    _$userProfileChangedAtom.reportWrite(value, super.userProfileChanged, () {
      super.userProfileChanged = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_StoreLoginBase.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$loginAsyncAction = AsyncAction('_StoreLoginBase.login');

  @override
  Future<dynamic> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_proceedLoginAsyncAction =
      AsyncAction('_StoreLoginBase._proceedLogin');

  @override
  Future<dynamic> _proceedLogin() {
    return _$_proceedLoginAsyncAction.run(() => super._proceedLogin());
  }

  final _$_getUserProfileAsyncAction =
      AsyncAction('_StoreLoginBase._getUserProfile');

  @override
  Future<dynamic> _getUserProfile(String id) {
    return _$_getUserProfileAsyncAction.run(() => super._getUserProfile(id));
  }

  final _$_refreshUserProfileAsyncAction =
      AsyncAction('_StoreLoginBase._refreshUserProfile');

  @override
  Future<dynamic> _refreshUserProfile(UserProfile userProfile) {
    return _$_refreshUserProfileAsyncAction
        .run(() => super._refreshUserProfile(userProfile));
  }

  @override
  String toString() {
    return '''
phone: ${phone},
password: ${password},
phoneErrorString: ${phoneErrorString},
passwordErrorString: ${passwordErrorString},
exception: ${exception},
loadingApi: ${loadingApi},
userProfileChanged: ${userProfileChanged}
    ''';
  }
}
