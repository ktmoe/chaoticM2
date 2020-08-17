library order_item;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'order_item.g.dart';

abstract class OrderItem implements Built<OrderItem, OrderItemBuilder> {
  OrderItem._();

  factory OrderItem([updates(OrderItemBuilder b)]) = _$OrderItem;

  @BuiltValueField(wireName: 'id')
  String get id;
  @BuiltValueField(wireName: 'orderid')
  String get orderid;
  @BuiltValueField(wireName: 'productName')
  String get productName;
  @BuiltValueField(wireName: 'productid')
  String get productid;
  @BuiltValueField(wireName: 'price')
  int get price;
  @BuiltValueField(wireName: 'quantity')
  int get quantity;
  @BuiltValueField(wireName: 'createddate')
  String get createddate;
  @BuiltValueField(wireName: 'updateddate')
  String get updateddate;
  String toJson() {
    return json.encode(serializers.serializeWith(OrderItem.serializer, this));
  }

  static OrderItem fromJson(String jsonString) {
    return serializers.deserializeWith(
        OrderItem.serializer, json.decode(jsonString));
  }

  static Serializer<OrderItem> get serializer => _$orderItemSerializer;
}
