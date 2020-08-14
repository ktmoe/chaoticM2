import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:m2mobile/models/order.dart';

class BoxOrderList implements Disposable {
  Box<Order> _box;

  static var key = "OrderBox";

  static BoxOrderList _instance;

  BoxOrderList._(this._box);

  static Future<BoxOrderList> create() async {
    return _instance ??= BoxOrderList._(await Hive.openBox(key));
  }

  ValueListenable<Box<Order>> get listenable => _box.listenable();

  @override
  void dispose() {
    _box.close();
  }

  Future saveAll(List<Order> accounts) async {
    for (final c in accounts) {
      await save(c);
    }
  }

  List<Order> getAllOrders() {
    List<Order> orders = [];
    _box.keys.forEach((key) {
      orders.add(_box.get(key));
    });
    return orders;
  }

  Future save(Order order) async {
    await _box.put(order.id, order);
  }

  void deleteAll() => _box.deleteAll(_box.keys);
}
