import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/stores/authenticate_store.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/data/api/file_upload_service.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:m2mobile/models/user_profile.dart';

part 'store_profile.g.dart';

class StoreProfile = _StoreProfileBase with _$StoreProfile;

abstract class _StoreProfileBase with Store {
  AppBox _appBox;
  final FileUploadService _fileUploadService = Modular.get<FileUploadService>();
  final ApiService _apiService = Modular.get<ApiService>();

  @observable
  String id = "";

  @observable
  String name = "";

  @observable
  String imageUrl = "";

  @observable
  String phoneNo = "";

  @observable
  String address = "";

  @observable
  String password = "";

  @observable
  AppException exception;

  @computed
  bool get valid =>
      name.isNotEmpty &&
      imageUrl.isNotEmpty &&
      phoneNo.isNotEmpty &&
      address.isNotEmpty &&
      password.isNotEmpty;

  @observable
  bool hasInialized = false;

  @observable
  Observable<bool> oldDataLoaded = Observable(false);

  @observable
  bool apiLoading = false;

  @action
  Future initEditProfile(bool isRegister) async {
    oldDataLoaded = Observable(false);
    if (!hasInialized) {
      _appBox = await AppBox.create();
      hasInialized = true;
    }
    if (isRegister) {
      phoneNo = Modular.get<AuthenticateStore>().fullPhone;
    } else {
      _reloadOldProfile();
    }
    oldDataLoaded = Observable(true);
  }

  @action
  void _reloadOldProfile() {
    final profile = Modular.get<StoreApp>().userProfile;
    id = profile.id;
    name = profile.name;
    imageUrl = profile.imageurl;
    phoneNo = profile.phone;
    address = profile.address;
    password = profile.password;
  }

  @action
  Future uploadProfileImage(File file) async {
    apiLoading = true;
    MultipartFile mediaFile = await MultipartFile.fromPath('file', file.path,
        contentType: MediaType.parse('image/*'));
    try {
      final uploadResponse =
          await _fileUploadService.uploadProfileImage(mediaFile);
      if (uploadResponse.body.message.toLowerCase() == "success") {
        imageUrl = uploadResponse.body.data.createImageUrl();
      }
    } catch (e) {
      exception = AppException(message: e.toString());
    } finally {
      apiLoading = false;
    }
  }

  @action
  Future uploadProfile(bool register, Function onSuccess) async {
    if (valid) {
      apiLoading = true;
      try {
        if (register) {
          await _saveProfileApiCall(onSuccess);
        } else {
          await _ediProfileApiCall(onSuccess);
        }
      } catch (e) {
        apiLoading = false;
        exception = AppException(message: e.toString());
      }
    } else {
      exception = AppException(message: "Please fill in all data");
    }
  }

  @action
  Future _saveProfileApiCall(Function onSuccess) async {
    final response = await _apiService.saveProfile(imageUrl.trim(), name.trim(),
        phoneNo.trim(), address.trim(), password.trim());
    if (response.body.message.toLowerCase() == "success") {
      _saveProfile(response.body.data);
      apiLoading = false;
      onSuccess();
    }
  }

  @action
  Future _ediProfileApiCall(Function onSuccess) async {
    final response = await _apiService.editProfile(
        id, imageUrl.trim(), name.trim(), phoneNo.trim(), address.trim());
    if (response.body.message.toLowerCase() == "success") {
      _refreshProfile(response.body.data);
      apiLoading = false;
      onSuccess();
    }
  }

  @action
  Future _saveProfile(UserProfile profile) async {
    await _appBox.saveUserProfile(profile);
  }

  @action
  Future _refreshProfile(UserProfile profile) async {
    final refresh = profile.rebuild((p) => p
      ..id = this.id
      ..password = this.password);
    await _appBox.saveUserProfile(refresh);
  }
}
