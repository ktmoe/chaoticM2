library post_order_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';
import 'package:m2mobile/models/wrappers/post_order_order_wrapper.dart';

part 'post_order_response.g.dart';

abstract class PostOrderResponse
    implements Built<PostOrderResponse, PostOrderResponseBuilder> {
  PostOrderResponse._();

  factory PostOrderResponse([updates(PostOrderResponseBuilder b)]) =
      _$PostOrderResponse;

  @BuiltValueField(wireName: 'message')
  String get message;
  @BuiltValueField(wireName: 'data')
  PostOrderOrderWrapper get wrapper;
  String toJson() {
    return json
        .encode(serializers.serializeWith(PostOrderResponse.serializer, this));
  }

  static PostOrderResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        PostOrderResponse.serializer, json.decode(jsonString));
  }

  static Serializer<PostOrderResponse> get serializer =>
      _$postOrderResponseSerializer;
}
