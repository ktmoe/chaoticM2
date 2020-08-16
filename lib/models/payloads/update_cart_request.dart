import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:m2mobile/models/serializers.dart';
import 'package:m2mobile/models/payloads/update_item.dart';

part 'update_cart_request.g.dart';

abstract class UpdateCartRequest
    implements Built<UpdateCartRequest, UpdateCartRequestBuilder> {
  UpdateCartRequest._();

  factory UpdateCartRequest([updates(UpdateCartRequestBuilder b)]) =
      _$UpdateCartRequest;

  @BuiltValueField(wireName: 'cartItem')
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
