library order_item_wrapper;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';
import 'package:m2mobile/models/order_item.dart';

part 'order_item_wrapper.g.dart';

abstract class OrderItemWrapper
    implements Built<OrderItemWrapper, OrderItemWrapperBuilder> {
  OrderItemWrapper._();

  factory OrderItemWrapper([updates(OrderItemWrapperBuilder b)]) =
      _$OrderItemWrapper;

  @BuiltValueField(wireName: 'orderItemList')
  BuiltList<OrderItem> get orderItem;
  String toJson() {
    return json
        .encode(serializers.serializeWith(OrderItemWrapper.serializer, this));
  }

  static OrderItemWrapper fromJson(String jsonString) {
    return serializers.deserializeWith(
        OrderItemWrapper.serializer, json.decode(jsonString));
  }

  static Serializer<OrderItemWrapper> get serializer =>
      _$orderItemWrapperSerializer;
}
