library order_customer_info_payload;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';
import 'package:m2mobile/models/payloads/order_customer_info.dart';

part 'order_customer_info_payload.g.dart';

abstract class OrderCustomerInfoPayload
    implements
        Built<OrderCustomerInfoPayload, OrderCustomerInfoPayloadBuilder> {
  OrderCustomerInfoPayload._();

  factory OrderCustomerInfoPayload(
          [updates(OrderCustomerInfoPayloadBuilder b)]) =
      _$OrderCustomerInfoPayload;

  @BuiltValueField(wireName: 'orderCustomerInfo')
  OrderCustomerInfo get orderCustomerInfo;
  String toJson() {
    return json.encode(
        serializers.serializeWith(OrderCustomerInfoPayload.serializer, this));
  }

  static OrderCustomerInfoPayload fromJson(String jsonString) {
    return serializers.deserializeWith(
        OrderCustomerInfoPayload.serializer, json.decode(jsonString));
  }

  static Serializer<OrderCustomerInfoPayload> get serializer =>
      _$orderCustomerInfoPayloadSerializer;
}
