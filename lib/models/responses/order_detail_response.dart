library order_detail_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';
import 'package:m2mobile/models/wrappers/order_item_wrapper.dart';

part 'order_detail_response.g.dart';

abstract class OrderDetailResponse
    implements Built<OrderDetailResponse, OrderDetailResponseBuilder> {
  OrderDetailResponse._();

  factory OrderDetailResponse([updates(OrderDetailResponseBuilder b)]) =
      _$OrderDetailResponse;

  @BuiltValueField(wireName: 'message')
  String get message;
  @BuiltValueField(wireName: 'data')
  OrderItemWrapper get orderItemWrapper;
  String toJson() {
    return json.encode(
        serializers.serializeWith(OrderDetailResponse.serializer, this));
  }

  static OrderDetailResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        OrderDetailResponse.serializer, json.decode(jsonString));
  }

  static Serializer<OrderDetailResponse> get serializer =>
      _$orderDetailResponseSerializer;
}
