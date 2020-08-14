import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';
import 'package:m2mobile/models/serializers.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 9)
abstract class CartItem implements Built<CartItem, CartItemBuilder> {
  CartItem._();

  factory CartItem([updates(CartItemBuilder b)]) = _$CartItem;

  @HiveField(0)
  @nullable
  @BuiltValueField(wireName: 'id')
  String get id;
  @HiveField(1)
  @BuiltValueField(wireName: 'customerid')
  String get customerid;
  @HiveField(2)
  @BuiltValueField(wireName: 'productid')
  String get productid;
  @HiveField(3)
  @BuiltValueField(wireName: 'quantity')
  int get quantity;
  @HiveField(4)
  @nullable
  @BuiltValueField(wireName: 'price')
  int get price;
  String toJson() {
    return json.encode(serializers.serializeWith(CartItem.serializer, this));
  }

  static CartItem fromJson(String jsonString) {
    return serializers.deserializeWith(
        CartItem.serializer, json.decode(jsonString));
  }

  static Serializer<CartItem> get serializer => _$cartItemSerializer;
}
