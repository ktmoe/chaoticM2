library order_payment_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'order_payment_response.g.dart';

abstract class OrderPaymentResponse
    implements Built<OrderPaymentResponse, OrderPaymentResponseBuilder> {
  OrderPaymentResponse._();

  factory OrderPaymentResponse([updates(OrderPaymentResponseBuilder b)]) =
      _$OrderPaymentResponse;

  @BuiltValueField(wireName: 'id')
  String get id;
  @BuiltValueField(wireName: 'orderid')
  String get orderid;
  @BuiltValueField(wireName: 'bankid')
  String get bankid;
  @BuiltValueField(wireName: 'imageurl')
  String get imageurl;
  @BuiltValueField(wireName: 'paydate')
  String get paydate;
  @BuiltValueField(wireName: 'createddate')
  String get createddate;
  @BuiltValueField(wireName: 'updateddate')
  String get updateddate;
  String toJson() {
    return json.encode(
        serializers.serializeWith(OrderPaymentResponse.serializer, this));
  }

  static OrderPaymentResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        OrderPaymentResponse.serializer, json.decode(jsonString));
  }

  static Serializer<OrderPaymentResponse> get serializer =>
      _$orderPaymentResponseSerializer;
}
