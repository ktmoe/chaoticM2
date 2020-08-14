import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:m2mobile/models/cart_item.dart';
import 'package:m2mobile/models/serializers.dart';

part 'add_to_cart_request.g.dart';

abstract class AddToCartRequest
    implements Built<AddToCartRequest, AddToCartRequestBuilder> {
  AddToCartRequest._();

  factory AddToCartRequest([updates(AddToCartRequestBuilder b)]) =
      _$AddToCartRequest;

  @BuiltValueField(wireName: 'cartItem')
  CartItem get cartItem;
  String toJson() {
    return json
        .encode(serializers.serializeWith(AddToCartRequest.serializer, this));
  }

  static AddToCartRequest fromJson(String jsonString) {
    return serializers.deserializeWith(
        AddToCartRequest.serializer, json.decode(jsonString));
  }

  static Serializer<AddToCartRequest> get serializer =>
      _$addToCartRequestSerializer;
}
