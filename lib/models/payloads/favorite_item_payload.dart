library favorite_item_payload;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';
import 'package:m2mobile/models/payloads/favorite_item.dart';

part 'favorite_item_payload.g.dart';

abstract class FavoriteItemPayload
    implements Built<FavoriteItemPayload, FavoriteItemPayloadBuilder> {
  FavoriteItemPayload._();

  factory FavoriteItemPayload([updates(FavoriteItemPayloadBuilder b)]) =
      _$FavoriteItemPayload;

  @BuiltValueField(wireName: 'favoriteItem')
  FavoriteItem get favoriteItem;
  String toJson() {
    return json.encode(
        serializers.serializeWith(FavoriteItemPayload.serializer, this));
  }

  static FavoriteItemPayload fromJson(String jsonString) {
    return serializers.deserializeWith(
        FavoriteItemPayload.serializer, json.decode(jsonString));
  }

  static Serializer<FavoriteItemPayload> get serializer =>
      _$favoriteItemPayloadSerializer;
}
