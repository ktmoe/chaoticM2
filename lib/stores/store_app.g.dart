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
  Computed<bool> _$isLoggedInComputed;

  @override
  bool get isLoggedIn => (_$isLoggedInComputed ??=
          Computed<bool>(() => super.isLoggedIn, name: '_StoreApp.isLoggedIn'))
      .value;
  Computed<Map<M2Category, List<SubCategory>>> _$subCategoryMapComputed;

  @override
  Map<M2Category, List<SubCategory>> get subCategoryMap =>
      (_$subCategoryMapComputed ??=
              Computed<Map<M2Category, List<SubCategory>>>(
                  () => super.subCategoryMap,
                  name: '_StoreApp.subCategoryMap'))
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

  final _$companyInfoAtom = Atom(name: '_StoreApp.companyInfo');

  @override
  CompanyInfo get companyInfo {
    _$companyInfoAtom.reportRead();
    return super.companyInfo;
  }

  @override
  set companyInfo(CompanyInfo value) {
    _$companyInfoAtom.reportWrite(value, super.companyInfo, () {
      super.companyInfo = value;
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
  Observable<bool> get forceUpdate {
    _$forceUpdateAtom.reportRead();
    return super.forceUpdate;
  }

  @override
  set forceUpdate(Observable<bool> value) {
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

  final _$userProfileAtom = Atom(name: '_StoreApp.userProfile');

  @override
  UserProfile get userProfile {
    _$userProfileAtom.reportRead();
    return super.userProfile;
  }

  @override
  set userProfile(UserProfile value) {
    _$userProfileAtom.reportWrite(value, super.userProfile, () {
      super.userProfile = value;
    });
  }

  final _$categoryListAtom = Atom(name: '_StoreApp.categoryList');

  @override
  ObservableList<M2Category> get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(ObservableList<M2Category> value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  final _$subCategoryListAtom = Atom(name: '_StoreApp.subCategoryList');

  @override
  ObservableList<SubCategory> get subCategoryList {
    _$subCategoryListAtom.reportRead();
    return super.subCategoryList;
  }

  @override
  set subCategoryList(ObservableList<SubCategory> value) {
    _$subCategoryListAtom.reportWrite(value, super.subCategoryList, () {
      super.subCategoryList = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_StoreApp.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_createBoxesAsyncAction = AsyncAction('_StoreApp._createBoxes');

  @override
  Future<dynamic> _createBoxes() {
    return _$_createBoxesAsyncAction.run(() => super._createBoxes());
  }

  final _$_preloadAppDataAsyncAction = AsyncAction('_StoreApp._preloadAppData');

  @override
  Future<dynamic> _preloadAppData() {
    return _$_preloadAppDataAsyncAction.run(() => super._preloadAppData());
  }

  final _$getCompanyInfoAsyncAction = AsyncAction('_StoreApp.getCompanyInfo');

  @override
  Future<dynamic> getCompanyInfo() {
    return _$getCompanyInfoAsyncAction.run(() => super.getCompanyInfo());
  }

  final _$getCategoriesAsyncAction = AsyncAction('_StoreApp.getCategories');

  @override
  Future<dynamic> getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  final _$getSubCategoriesAsyncAction =
      AsyncAction('_StoreApp.getSubCategories');

  @override
  Future<dynamic> getSubCategories() {
    return _$getSubCategoriesAsyncAction.run(() => super.getSubCategories());
  }

  final _$checkForceUpdateAsyncAction =
      AsyncAction('_StoreApp.checkForceUpdate');

  @override
  Future<dynamic> checkForceUpdate() {
    return _$checkForceUpdateAsyncAction.run(() => super.checkForceUpdate());
  }

  final _$saveUserProfileAsyncAction = AsyncAction('_StoreApp.saveUserProfile');

  @override
  Future<dynamic> saveUserProfile(UserProfile userProfile) {
    return _$saveUserProfileAsyncAction
        .run(() => super.saveUserProfile(userProfile));
  }

  final _$deleteUserProfileAsyncAction =
      AsyncAction('_StoreApp.deleteUserProfile');

  @override
  Future<dynamic> deleteUserProfile() {
    return _$deleteUserProfileAsyncAction.run(() => super.deleteUserProfile());
  }

  final _$changeFirstTimeAsyncAction = AsyncAction('_StoreApp.changeFirstTime');

  @override
  Future<dynamic> changeFirstTime() {
    return _$changeFirstTimeAsyncAction.run(() => super.changeFirstTime());
  }

  final _$_StoreAppActionController = ActionController(name: '_StoreApp');

  @override
  void changeLanguagePref() {
    final _$actionInfo = _$_StoreAppActionController.startAction(
        name: '_StoreApp.changeLanguagePref');
    try {
      return super.changeLanguagePref();
    } finally {
      _$_StoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setupBoxListeners() {
    final _$actionInfo = _$_StoreAppActionController.startAction(
        name: '_StoreApp._setupBoxListeners');
    try {
      return super._setupBoxListeners();
    } finally {
      _$_StoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _companyInfoChanged() {
    final _$actionInfo = _$_StoreAppActionController.startAction(
        name: '_StoreApp._companyInfoChanged');
    try {
      return super._companyInfoChanged();
    } finally {
      _$_StoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _userProfileChanged() {
    final _$actionInfo = _$_StoreAppActionController.startAction(
        name: '_StoreApp._userProfileChanged');
    try {
      return super._userProfileChanged();
    } finally {
      _$_StoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _boxCategoryChanged() {
    final _$actionInfo = _$_StoreAppActionController.startAction(
        name: '_StoreApp._boxCategoryChanged');
    try {
      return super._boxCategoryChanged();
    } finally {
      _$_StoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _boxSubCategoryChanged() {
    final _$actionInfo = _$_StoreAppActionController.startAction(
        name: '_StoreApp._boxSubCategoryChanged');
    try {
      return super._boxSubCategoryChanged();
    } finally {
      _$_StoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _appBoxChanged() {
    final _$actionInfo = _$_StoreAppActionController.startAction(
        name: '_StoreApp._appBoxChanged');
    try {
      return super._appBoxChanged();
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
  void readIsUnicode() {
    final _$actionInfo = _$_StoreAppActionController.startAction(
        name: '_StoreApp.readIsUnicode');
    try {
      return super.readIsUnicode();
    } finally {
      _$_StoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  void readUserProfile() {
    final _$actionInfo = _$_StoreAppActionController.startAction(
        name: '_StoreApp.readUserProfile');
    try {
      return super.readUserProfile();
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
companyInfo: ${companyInfo},
exception: ${exception},
forceUpdate: ${forceUpdate},
isFirstTime: ${isFirstTime},
chosenLanguage: ${chosenLanguage},
userProfile: ${userProfile},
categoryList: ${categoryList},
subCategoryList: ${subCategoryList},
isNetworkOn: ${isNetworkOn},
connectivityMessage: ${connectivityMessage},
isLoggedIn: ${isLoggedIn},
subCategoryMap: ${subCategoryMap}
    ''';
  }
}
