library delete_favorite_item_payload;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'delete_favorite_item_payload.g.dart';

abstract class DeleteFavoriteItemPayload
    implements
        Built<DeleteFavoriteItemPayload, DeleteFavoriteItemPayloadBuilder> {
  DeleteFavoriteItemPayload._();

  factory DeleteFavoriteItemPayload(
          [updates(DeleteFavoriteItemPayloadBuilder b)]) =
      _$DeleteFavoriteItemPayload;

  @BuiltValueField(wireName: 'favoriteId')
  String get favoriteId;
  String toJson() {
    return json.encode(
        serializers.serializeWith(DeleteFavoriteItemPayload.serializer, this));
  }

  static DeleteFavoriteItemPayload fromJson(String jsonString) {
    return serializers.deserializeWith(
        DeleteFavoriteItemPayload.serializer, json.decode(jsonString));
  }

  static Serializer<DeleteFavoriteItemPayload> get serializer =>
      _$deleteFavoriteItemPayloadSerializer;
}
