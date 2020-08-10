import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/models/user_profile.dart';
import 'package:m2mobile/models/m2_category.dart';
import 'package:m2mobile/models/sub_category.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/utils/connectivity_service.dart';
import 'package:package_info/package_info.dart';
import 'package:m2mobile/models/company_info.dart';
import 'package:m2mobile/boxes/box_category.dart';
import 'package:m2mobile/boxes/box_sub_category.dart';

part 'store_app.g.dart';

class StoreApp = _StoreApp with _$StoreApp;

abstract class _StoreApp with Store {
  AppBox _appBox;
  BoxCategory _boxCategory;
  BoxSubCategory _boxSubCategory;

  final ApiService _apiService = Modular.get<ApiService>();

  @observable
  ObservableStream<bool> connectivity =
      ObservableStream(Modular.get<ConnectivityService>().connectivityStream);

  @computed
  bool get isNetworkOn => connectivity.value;

  @computed
  String get connectivityMessage => connectivity.hasError || !connectivity.value
      ? "You're offline"
      : "You're online";

  @observable
  CompanyInfo companyInfo;

  @observable
  AppException exception;

  @observable
  Observable<bool> forceUpdate = Observable(null);

  @observable
  bool isFirstTime;

  @computed
  bool get isLoggedIn => userProfile != null ?? false;

  @observable
  Language chosenLanguage;

  @observable
  UserProfile userProfile;

  @observable
  ObservableList<M2Category> categoryList;

  @observable
  ObservableList<SubCategory> subCategoryList;

  @observable
  bool perloadDone = false;

  @computed
  Map<M2Category, List<SubCategory>> get subCategoryMap {
    final result = Map<M2Category, List<SubCategory>>();
    categoryList.forEach((category) {
      result.putIfAbsent(
          category,
          () => subCategoryList
              .where((subCategory) => subCategory.categoryId == category.id)
              .toList());
    });
    return result;
  }

  @action
  void changeLanguagePref() {
    _appBox.changeIsUnicode(!_appBox.getIsUnicode());
  }

  @action
  Future init() async {
    await _createBoxes();
    _setupBoxListeners();
    readIsFirstTime();
    readIsUnicode();
    readUserProfile();
    if (!isFirstTime) {
      await _preloadAppData();
      perloadDone = true;
    }
  }

  @action
  void _setupBoxListeners() {
    _appBox.listenable.addListener(() {
      _appBoxChanged();
    });
    _appBox.userProfileListenable.addListener(() {
      _userProfileChanged();
    });
    _appBox.companyInfoListenable.addListener(() {
      _companyInfoChanged();
    });
    _boxCategory.listenable.addListener(() {
      _boxCategoryChanged();
    });
    _boxSubCategory.listenable.addListener(() {
      _boxSubCategoryChanged();
    });
  }

  @action
  Future _createBoxes() async {
    _appBox = await AppBox.create();
    _boxCategory = await BoxCategory.create();
    _boxSubCategory = await BoxSubCategory.create();
  }

  @action
  Future _preloadAppData() async {
    await getCompanyInfo();
    await getCategories();
    await getSubCategories();
  }

  @action
  Future getCompanyInfo() async {
    try {
      final response = await _apiService.getCompanyInfo();
      companyInfo = response.body.companyInfo;
      await _appBox.saveCompanyInfo(companyInfo);
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }

  @action
  Future getCategories() async {
    try {
      final response = await _apiService.getCategories();
      await _boxCategory.saveAll(response.body.m2Category.toList());
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }

  @action
  Future getSubCategories() async {
    try {
      final response = await _apiService.getSubCategories();
      await _boxSubCategory.saveAll(response.body.subCategory.toList());
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }

  @action
  Future checkForceUpdate() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final versionCode = packageInfo.buildNumber;

    final forceUpdateResponse = (Platform.isAndroid)
        ? await _apiService.forceUpdateAndroid(int.parse(versionCode))
        : await _apiService.forceUpdateIOS(int.parse(versionCode));

    forceUpdate = Observable(forceUpdateResponse.body.forceUpdate.forceUpdate);
  }

  @action
  void _companyInfoChanged() {
    companyInfo =
        _appBox.companyInfoListenable.value.get(AppBox.companyInfoKey);
  }

  @action
  void _userProfileChanged() {
    userProfile =
        _appBox.userProfileListenable.value.get(AppBox.userProfileKey);
  }

  @action
  void _boxCategoryChanged() {
    categoryList = ObservableList.of(_boxCategory.listenable.value.values);
  }

  @action
  void _boxSubCategoryChanged() {
    subCategoryList =
        ObservableList.of(_boxSubCategory.listenable.value.values);
  }

  @action
  void _appBoxChanged() {
    isFirstTime =
        _appBox.listenable.value.get(AppBox.firstTimeKey, defaultValue: true);
    chosenLanguage =
        _appBox.listenable.value.get(AppBox.isUnicodeKey, defaultValue: true)
            ? Language.Unicode
            : Language.Zawgyi;
  }

  @action
  void readIsFirstTime() {
    isFirstTime = _appBox.getIsFirstTime() ?? true;
  }

  @action
  void readIsUnicode() {
    chosenLanguage = _appBox.getIsUnicode()
        ? Language.Unicode
        : Language.Zawgyi ?? Language.Unicode;
  }

  @action
  void readUserProfile() {
    if (_appBox.getUserProfile() != null) {
      print("userprofile is not null in store app");
      userProfile = _appBox.getUserProfile();
    }
  }

  @action
  Future saveUserProfile(UserProfile userProfile) async {
    await _appBox.saveUserProfile(userProfile);
  }

  @action
  Future deleteUserProfile() async {
    await _appBox.deleteUserProfile();
  }

  //Call this method after Selecting Language
  @action
  Future changeFirstTime() async {
    if (isFirstTime) {
      await _appBox.changeFirstTime(false);
    }
  }

  @action
  void dispose() {
    _appBox.dispose();
  }
}

enum Language { Zawgyi, Unicode }
