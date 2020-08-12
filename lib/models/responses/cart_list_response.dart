import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'dart:convert';
import '../cart_item.dart';
import '../serializers.dart';

part 'cart_list_response.g.dart';

abstract class CartListResponse
    implements Built<CartListResponse, CartListResponseBuilder> {
  CartListResponse._();

  factory CartListResponse([updates(CartListResponseBuilder b)]) =
  _$CartListResponse;

  @BuiltValueField(wireName: 'message')
  String get message;
  @BuiltValueField(wireName: 'data')
  BuiltList<CartItem> get cartItem;
  String toJson() {
    return json
        .encode(serializers.serializeWith(CartListResponse.serializer, this));
  }

  static CartListResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        CartListResponse.serializer, json.decode(jsonString));
  }

  static Serializer<CartListResponse> get serializer =>
      _$cartListResponseSerializer;
}