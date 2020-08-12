import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';
import '../update_item.dart';

part 'update_cart_request.g.dart';

abstract class UpdateCartRequest
    implements Built<UpdateCartRequest, UpdateCartRequestBuilder> {
  UpdateCartRequest._();

  factory UpdateCartRequest([updates(UpdateCartRequestBuilder b)]) =
  _$UpdateCartRequest;

  @BuiltValueField(wireName: 'update_item')
  UpdateItem get updateItem;
  String toJson() {
    return json
        .encode(serializers.serializeWith(UpdateCartRequest.serializer, this));
  }

  static UpdateCartRequest fromJson(String jsonString) {
    return serializers.deserializeWith(
        UpdateCartRequest.serializer, json.decode(jsonString));
  }

  static Serializer<UpdateCartRequest> get serializer =>
      _$updateCartRequestSerializer;
}