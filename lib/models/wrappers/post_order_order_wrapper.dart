library post_order_order_wrapper;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';
import 'package:m2mobile/models/order.dart';

part 'post_order_order_wrapper.g.dart';

abstract class PostOrderOrderWrapper
    implements Built<PostOrderOrderWrapper, PostOrderOrderWrapperBuilder> {
  PostOrderOrderWrapper._();

  factory PostOrderOrderWrapper([updates(PostOrderOrderWrapperBuilder b)]) =
      _$PostOrderOrderWrapper;

  @BuiltValueField(wireName: 'order')
  Order get order;
  String toJson() {
    return json.encode(
        serializers.serializeWith(PostOrderOrderWrapper.serializer, this));
  }

  static PostOrderOrderWrapper fromJson(String jsonString) {
    return serializers.deserializeWith(
        PostOrderOrderWrapper.serializer, json.decode(jsonString));
  }

  static Serializer<PostOrderOrderWrapper> get serializer =>
      _$postOrderOrderWrapperSerializer;
}
