import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';
import 'package:m2mobile/models/order.dart';

part 'order_list_response.g.dart';

abstract class OrderListResponse
    implements Built<OrderListResponse, OrderListResponseBuilder> {
  OrderListResponse._();

  factory OrderListResponse([updates(OrderListResponseBuilder b)]) =
      _$OrderListResponse;

  @BuiltValueField(wireName: 'message')
  String get message;
  @nullable
  @BuiltValueField(wireName: 'data')
  BuiltList<Order> get order;
  String toJson() {
    return json
        .encode(serializers.serializeWith(OrderListResponse.serializer, this));
  }

  static OrderListResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        OrderListResponse.serializer, json.decode(jsonString));
  }

  static Serializer<OrderListResponse> get serializer =>
      _$orderListResponseSerializer;
}
