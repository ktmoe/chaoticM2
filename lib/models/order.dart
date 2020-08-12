library order;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'order.g.dart';

abstract class Order implements Built<Order, OrderBuilder> {
  Order._();

  factory Order([updates(OrderBuilder b)]) = _$Order;

  @BuiltValueField(wireName: 'id')
  String get id;
  @BuiltValueField(wireName: 'customerid')
  String get customerid;
  @BuiltValueField(wireName: 'ordercode')
  String get ordercode;
  @BuiltValueField(wireName: 'orderdate')
  String get orderdate;
  @BuiltValueField(wireName: 'phone')
  String get phone;
  @BuiltValueField(wireName: 'address')
  String get address;
  @BuiltValueField(wireName: 'status')
  String get status;
  @BuiltValueField(wireName: 'createddate')
  String get createddate;
  @BuiltValueField(wireName: 'updateddate')
  String get updateddate;
  @BuiltValueField(wireName: 'total_item')
  int get totalItem;
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
