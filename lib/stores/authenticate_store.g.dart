// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticateStore on _AuthenticateStoreBase, Store {
  Computed<String> _$fullPhoneComputed;

  @override
  String get fullPhone =>
      (_$fullPhoneComputed ??= Computed<String>(() => super.fullPhone,
              name: '_AuthenticateStoreBase.fullPhone'))
          .value;
  Computed<bool> _$validPhoneComputed;

  @override
  bool get validPhone =>
      (_$validPhoneComputed ??= Computed<bool>(() => super.validPhone,
              name: '_AuthenticateStoreBase.validPhone'))
          .value;

  final _$pageAtom = Atom(name: '_AuthenticateStoreBase.page');

  @override
  Observable<int> get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(Observable<int> value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$countryCodeAtom = Atom(name: '_AuthenticateStoreBase.countryCode');

  @override
  Country get countryCode {
    _$countryCodeAtom.reportRead();
    return super.countryCode;
  }

  @override
  set countryCode(Country value) {
    _$countryCodeAtom.reportWrite(value, super.countryCode, () {
      super.countryCode = value;
    });
  }

  final _$phoneAtom = Atom(name: '_AuthenticateStoreBase.phone');

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

  final _$validOtpAtom = Atom(name: '_AuthenticateStoreBase.validOtp');

  @override
  String get validOtp {
    _$validOtpAtom.reportRead();
    return super.validOtp;
  }

  @override
  set validOtp(String value) {
    _$validOtpAtom.reportWrite(value, super.validOtp, () {
      super.validOtp = value;
    });
  }

  final _$inputOtpAtom = Atom(name: '_AuthenticateStoreBase.inputOtp');

  @override
  String get inputOtp {
    _$inputOtpAtom.reportRead();
    return super.inputOtp;
  }

  @override
  set inputOtp(String value) {
    _$inputOtpAtom.reportWrite(value, super.inputOtp, () {
      super.inputOtp = value;
    });
  }

  final _$userProfileAtom = Atom(name: '_AuthenticateStoreBase.userProfile');

  @override
  Observable<UserProfile> get userProfile {
    _$userProfileAtom.reportRead();
    return super.userProfile;
  }

  @override
  set userProfile(Observable<UserProfile> value) {
    _$userProfileAtom.reportWrite(value, super.userProfile, () {
      super.userProfile = value;
    });
  }

  final _$exceptionAtom = Atom(name: '_AuthenticateStoreBase.exception');

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

  final _$duplicatePhoneAtom =
      Atom(name: '_AuthenticateStoreBase.duplicatePhone');

  @override
  bool get duplicatePhone {
    _$duplicatePhoneAtom.reportRead();
    return super.duplicatePhone;
  }

  @override
  set duplicatePhone(bool value) {
    _$duplicatePhoneAtom.reportWrite(value, super.duplicatePhone, () {
      super.duplicatePhone = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_AuthenticateStoreBase.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$savePhoneNumberAsyncAction =
      AsyncAction('_AuthenticateStoreBase.savePhoneNumber');

  @override
  Future<dynamic> savePhoneNumber() {
    return _$savePhoneNumberAsyncAction.run(() => super.savePhoneNumber());
  }

  final _$checkDuplicatePhoneNumberAsyncAction =
      AsyncAction('_AuthenticateStoreBase.checkDuplicatePhoneNumber');

  @override
  Future<dynamic> checkDuplicatePhoneNumber() {
    return _$checkDuplicatePhoneNumberAsyncAction
        .run(() => super.checkDuplicatePhoneNumber());
  }

  final _$_AuthenticateStoreBaseActionController =
      ActionController(name: '_AuthenticateStoreBase');

  @override
  void changePage() {
    final _$actionInfo = _$_AuthenticateStoreBaseActionController.startAction(
        name: '_AuthenticateStoreBase.changePage');
    try {
      return super.changePage();
    } finally {
      _$_AuthenticateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_AuthenticateStoreBaseActionController.startAction(
        name: '_AuthenticateStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_AuthenticateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
countryCode: ${countryCode},
phone: ${phone},
validOtp: ${validOtp},
inputOtp: ${inputOtp},
userProfile: ${userProfile},
exception: ${exception},
duplicatePhone: ${duplicatePhone},
fullPhone: ${fullPhone},
validPhone: ${validPhone}
    ''';
  }
}
