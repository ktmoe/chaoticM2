library order_customer_info;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'order_customer_info.g.dart';

abstract class OrderCustomerInfo
    implements Built<OrderCustomerInfo, OrderCustomerInfoBuilder> {
  OrderCustomerInfo._();

  factory OrderCustomerInfo([updates(OrderCustomerInfoBuilder b)]) =
      _$OrderCustomerInfo;

  @BuiltValueField(wireName: 'customerid')
  String get customerid;
  @BuiltValueField(wireName: 'phone')
  String get phone;
  @BuiltValueField(wireName: 'address')
  String get address;
  @BuiltValueField(wireName: 'tax')
  int get tax;
  String toJson() {
    return json
        .encode(serializers.serializeWith(OrderCustomerInfo.serializer, this));
  }

  static OrderCustomerInfo fromJson(String jsonString) {
    return serializers.deserializeWith(
        OrderCustomerInfo.serializer, json.decode(jsonString));
  }

  static Serializer<OrderCustomerInfo> get serializer =>
      _$orderCustomerInfoSerializer;
}
