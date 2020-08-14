library order;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';
import 'package:m2mobile/models/serializers.dart';

part 'order.g.dart';

@HiveType(typeId: 7)
abstract class Order implements Built<Order, OrderBuilder> {
  Order._();

  factory Order([updates(OrderBuilder b)]) = _$Order;

  @HiveField(0)
  @BuiltValueField(wireName: 'id')
  String get id;
  @HiveField(1)
  @BuiltValueField(wireName: 'customerid')
  String get customerid;
  @HiveField(2)
  @BuiltValueField(wireName: 'ordercode')
  String get ordercode;
  @HiveField(3)
  @BuiltValueField(wireName: 'orderdate')
  String get orderdate;
  @HiveField(4)
  @BuiltValueField(wireName: 'phone')
  String get phone;
  @HiveField(5)
  @BuiltValueField(wireName: 'address')
  String get address;
  @HiveField(6)
  @BuiltValueField(wireName: 'status')
  String get status;
  @HiveField(7)
  @BuiltValueField(wireName: 'createddate')
  String get createddate;
  @HiveField(8)
  @BuiltValueField(wireName: 'updateddate')
  String get updateddate;
  @HiveField(9)
  @nullable
  @BuiltValueField(wireName: 'total_item')
  int get totalItem;
  @HiveField(10)
  @nullable
  @BuiltValueField(wireName: 'total_price')
  int get totalPrice;
  String toJson() {
    return json.encode(serializers.serializeWith(Order.serializer, this));
  }

  static Order fromJson(String jsonString) {
    return serializers.deserializeWith(
        Order.serializer, json.decode(jsonString));
  }

  static Serializer<Order> get serializer => _$orderSerializer;
}
