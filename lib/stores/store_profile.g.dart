// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_profile.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreProfile on _StoreProfileBase, Store {
  Computed<bool> _$validComputed;

  @override
  bool get valid => (_$validComputed ??=
          Computed<bool>(() => super.valid, name: '_StoreProfileBase.valid'))
      .value;

  final _$idAtom = Atom(name: '_StoreProfileBase.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$nameAtom = Atom(name: '_StoreProfileBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$imageUrlAtom = Atom(name: '_StoreProfileBase.imageUrl');

  @override
  String get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  final _$phoneNoAtom = Atom(name: '_StoreProfileBase.phoneNo');

  @override
  String get phoneNo {
    _$phoneNoAtom.reportRead();
    return super.phoneNo;
  }

  @override
  set phoneNo(String value) {
    _$phoneNoAtom.reportWrite(value, super.phoneNo, () {
      super.phoneNo = value;
    });
  }

  final _$addressAtom = Atom(name: '_StoreProfileBase.address');

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$passwordAtom = Atom(name: '_StoreProfileBase.password');

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

  final _$nameErrorStringAtom = Atom(name: '_StoreProfileBase.nameErrorString');

  @override
  String get nameErrorString {
    _$nameErrorStringAtom.reportRead();
    return super.nameErrorString;
  }

  @override
  set nameErrorString(String value) {
    _$nameErrorStringAtom.reportWrite(value, super.nameErrorString, () {
      super.nameErrorString = value;
    });
  }

  final _$addressErrorStringAtom =
      Atom(name: '_StoreProfileBase.addressErrorString');

  @override
  String get addressErrorString {
    _$addressErrorStringAtom.reportRead();
    return super.addressErrorString;
  }

  @override
  set addressErrorString(String value) {
    _$addressErrorStringAtom.reportWrite(value, super.addressErrorString, () {
      super.addressErrorString = value;
    });
  }

  final _$passwordErrorStringAtom =
      Atom(name: '_StoreProfileBase.passwordErrorString');

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

  final _$exceptionAtom = Atom(name: '_StoreProfileBase.exception');

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

  final _$hasInializedAtom = Atom(name: '_StoreProfileBase.hasInialized');

  @override
  bool get hasInialized {
    _$hasInializedAtom.reportRead();
    return super.hasInialized;
  }

  @override
  set hasInialized(bool value) {
    _$hasInializedAtom.reportWrite(value, super.hasInialized, () {
      super.hasInialized = value;
    });
  }

  final _$oldDataLoadedAtom = Atom(name: '_StoreProfileBase.oldDataLoaded');

  @override
  bool get oldDataLoaded {
    _$oldDataLoadedAtom.reportRead();
    return super.oldDataLoaded;
  }

  @override
  set oldDataLoaded(bool value) {
    _$oldDataLoadedAtom.reportWrite(value, super.oldDataLoaded, () {
      super.oldDataLoaded = value;
    });
  }

  final _$apiLoadingAtom = Atom(name: '_StoreProfileBase.apiLoading');

  @override
  bool get apiLoading {
    _$apiLoadingAtom.reportRead();
    return super.apiLoading;
  }

  @override
  set apiLoading(bool value) {
    _$apiLoadingAtom.reportWrite(value, super.apiLoading, () {
      super.apiLoading = value;
    });
  }

  final _$initEditProfileAsyncAction =
      AsyncAction('_StoreProfileBase.initEditProfile');

  @override
  Future<dynamic> initEditProfile(bool isRegister) {
    return _$initEditProfileAsyncAction
        .run(() => super.initEditProfile(isRegister));
  }

  final _$uploadProfileImageAsyncAction =
      AsyncAction('_StoreProfileBase.uploadProfileImage');

  @override
  Future<dynamic> uploadProfileImage(File file) {
    return _$uploadProfileImageAsyncAction
        .run(() => super.uploadProfileImage(file));
  }

  final _$uploadProfileAsyncAction =
      AsyncAction('_StoreProfileBase.uploadProfile');

  @override
  Future<dynamic> uploadProfile(bool register, Function onSuccess) {
    return _$uploadProfileAsyncAction
        .run(() => super.uploadProfile(register, onSuccess));
  }

  final _$_saveProfileApiCallAsyncAction =
      AsyncAction('_StoreProfileBase._saveProfileApiCall');

  @override
  Future<dynamic> _saveProfileApiCall(Function onSuccess) {
    return _$_saveProfileApiCallAsyncAction
        .run(() => super._saveProfileApiCall(onSuccess));
  }

  final _$_ediProfileApiCallAsyncAction =
      AsyncAction('_StoreProfileBase._ediProfileApiCall');

  @override
  Future<dynamic> _ediProfileApiCall(Function onSuccess) {
    return _$_ediProfileApiCallAsyncAction
        .run(() => super._ediProfileApiCall(onSuccess));
  }

  final _$_saveProfileAsyncAction =
      AsyncAction('_StoreProfileBase._saveProfile');

  @override
  Future<dynamic> _saveProfile(UserProfile profile) {
    return _$_saveProfileAsyncAction.run(() => super._saveProfile(profile));
  }

  final _$_refreshProfileAsyncAction =
      AsyncAction('_StoreProfileBase._refreshProfile');

  @override
  Future<dynamic> _refreshProfile(UserProfile profile) {
    return _$_refreshProfileAsyncAction
        .run(() => super._refreshProfile(profile));
  }

  final _$_StoreProfileBaseActionController =
      ActionController(name: '_StoreProfileBase');

  @override
  void _reloadOldProfile() {
    final _$actionInfo = _$_StoreProfileBaseActionController.startAction(
        name: '_StoreProfileBase._reloadOldProfile');
    try {
      return super._reloadOldProfile();
    } finally {
      _$_StoreProfileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
imageUrl: ${imageUrl},
phoneNo: ${phoneNo},
address: ${address},
password: ${password},
nameErrorString: ${nameErrorString},
addressErrorString: ${addressErrorString},
passwordErrorString: ${passwordErrorString},
exception: ${exception},
hasInialized: ${hasInialized},
oldDataLoaded: ${oldDataLoaded},
apiLoading: ${apiLoading},
valid: ${valid}
    ''';
  }
}
