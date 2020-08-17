import 'dart:io';

import 'package:m2mobile/stores/store_app.dart';
import 'package:m2mobile/stores/store_home.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:m2mobile/models/bank_account.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/data/api/file_upload_service.dart';
import 'package:m2mobile/boxes/box_bank_account.dart';
import 'package:m2mobile/boxes/box_order_list.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/models/order.dart';
import 'package:m2mobile/models/payloads/pay_order_payload.dart';
import 'package:m2mobile/utils/extensions.dart';

part 'store_order_list.g.dart';

class StoreOrderList = _StoreOrderListBase with _$StoreOrderList;

abstract class _StoreOrderListBase with Store {
  ApiService _apiService = Modular.get<ApiService>();
  FileUploadService _fileUploadService = Modular.get<FileUploadService>();

  BoxBankAccount _boxBankAccount;
  BoxOrderList _boxOrderList;

  @observable
  AppException exception;

  @observable
  ObservableList<Order> orders = ObservableList.of([]);

  @observable
  ObservableList<BankAccount> bankAccounts = ObservableList.of([]);

  @observable
  BankAccount selectedBankAccount;

  @observable
  bool hasInitialized = false;

  @observable
  bool showLoading = false;

  @observable
  bool payOrderSuccess = false;

  @observable
  File slipImage;

  @action
  Future<void> init() async {
    if (!hasInitialized) {
      _boxBankAccount = await BoxBankAccount.create();
      _boxOrderList = await BoxOrderList.create();
      _boxBankAccount.listenable.addListener(_onBoxBankAccountsChanged);

      _boxOrderList.listenable.addListener(_onBoxOrderListChanged);
      _onBoxBankAccountsChanged();
      _onBoxOrderListChanged();

      hasInitialized = true;
    }
  }

  @action
  Future<void> getOrders() async {
    try {
      final response = await _apiService
          .getOrderList(Modular.get<StoreApp>().userProfile.id);
      if (response.body.message.toLowerCase() == "success") {
        List<Order> sortedOrders = List.from(response.body.order);
        sortedOrders.sort((a, b) => a.status.compareTo(b.status));
        _boxOrderList.deleteAll();
        _boxOrderList.saveAll(sortedOrders);
      }
    } catch (e) {
      exception = AppException(message: e.toString());
      orders = ObservableList.of([]);
    }
  }

  @action
  Future<void> getBankAccounts() async {
    try {
      final response = await _apiService.getBankInfo();
      if (response.body.message.toLowerCase() == "success") {
        await _boxBankAccount.saveAll(response.body.bankAccount.toList());
      } else {
        final persisted = _boxBankAccount.getAllAccounts();
        bankAccounts.addAll(persisted);
      }
    } catch (e) {
      exception = AppException(message: e.toString());
      bankAccounts = _boxBankAccount.getAllAccounts() ?? [];
    }
  }

  @action
  void _onBoxBankAccountsChanged() {
    bankAccounts = ObservableList.of(_boxBankAccount.listenable.value.values);
    if (bankAccounts.isNotEmpty) {
      selectedBankAccount = bankAccounts.first;
    }
  }

  @action
  void _onBoxOrderListChanged() {
    orders = ObservableList.of(_boxOrderList.listenable.value.values);
  }

  @action
  Future<void> payOrder(String orderId) async {
    payOrderSuccess = false;
    if (slipImage == null) {
      exception = AppException(message: "Please upload Slip Image.");
    } else {
      showLoading = true;
      try {
        final imageUrl = await _uploadSlipImage(slipImage);
        await _apiService.payOrder(_payOrderPayload(imageUrl).toJson());
        showLoading = false;
        payOrderSuccess = true;
      } catch (e) {
        showLoading = false;
        exception = AppException(message: e.toString());
      }
    }
  }

  @action
  Future<String> _uploadSlipImage(File file) async {
    String imageUrl;
    MultipartFile mediaFile = await MultipartFile.fromPath('file', file.path,
        contentType: MediaType.parse('image/*'));
    try {
      final uploadResponse =
          await _fileUploadService.uploadSlipImage(mediaFile);
      if (uploadResponse.body.message.toLowerCase() == "success") {
        imageUrl = uploadResponse.body.data.createImageUrl();
      }
    } catch (e) {
      exception = AppException(message: e.toString());
    }
    return imageUrl;
  }

  @action
  PayOrderPayload _payOrderPayload(String imageUrl) => PayOrderPayload((b) => b
    ..bankid = selectedBankAccount.id
    ..orderid = Modular.get<StoreHome>().selectedOrderId
    ..slipimg = imageUrl);
}
