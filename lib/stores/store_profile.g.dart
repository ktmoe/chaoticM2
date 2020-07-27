// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_profile.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreProfile on _StoreProfileBase, Store {
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

  final _$initAsyncAction = AsyncAction('_StoreProfileBase.init');

  @override
  Future<dynamic> init(bool isRegister) {
    return _$initAsyncAction.run(() => super.init(isRegister));
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
name: ${name},
imageUrl: ${imageUrl},
phoneNo: ${phoneNo},
address: ${address},
password: ${password}
    ''';
  }
}
