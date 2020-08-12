import 'package:m2mobile/stores/store_app.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/models/bank_account.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/boxes/box_bank_account.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/models/order.dart';

part 'store_order_list.g.dart';

class StoreOrderList = _StoreOrderListBase with _$StoreOrderList;

abstract class _StoreOrderListBase with Store {
  ApiService _apiService = Modular.get<ApiService>();
  BoxBankAccount _boxBankAccount;

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

  @action
  Future<void> init() async {
    if (!hasInitialized) {
      _boxBankAccount = await BoxBankAccount.create();
      hasInitialized = true;
    }

    _boxBankAccount.listenable.addListener(() {
      _onBoxBankAccountsChanged();
    });
  }

  @action
  Future<void> getOrders() async {
    try {
      final response = await _apiService
          .getOrderList(Modular.get<StoreApp>().userProfile.id);
      if (response.body.message.toLowerCase() == "success") {
        orders.clear();
        orders.addAll(response.body.order);
      }
    } catch (e) {
      exception = AppException(message: e.toString());
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
    }
  }

  @action
  void _onBoxBankAccountsChanged() {
    bankAccounts.addAll(_boxBankAccount.listenable.value.values);
  }
}
