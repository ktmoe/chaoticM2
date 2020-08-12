import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:m2mobile/models/bank_account.dart';

class BoxBankAccount implements Disposable {
  Box<BankAccount> _box;

  static var key = "BankAccountBox";

  static BoxBankAccount _instance;

  BoxBankAccount._(this._box);

  static Future<BoxBankAccount> create() async {
    return _instance ??= BoxBankAccount._(await Hive.openBox(key));
  }

  ValueListenable<Box<BankAccount>> get listenable => _box.listenable();

  @override
  void dispose() {
    _box.close();
  }

  Future saveAll(List<BankAccount> accounts) async {
    for (final c in accounts) {
      await save(c);
    }
  }

  List<BankAccount> getAllAccounts() {
    List<BankAccount> accounts = [];
    _box.keys.forEach((key) {
      accounts.add(_box.get(key));
    });
    return accounts;
  }

  Future save(BankAccount account) async {
    await _box.put(account.id, account);
  }

  void deleteAll() => _box.deleteAll(_box.keys);
}
