library favorite_id;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'favorite_id.g.dart';

abstract class FavoriteId implements Built<FavoriteId, FavoriteIdBuilder> {
  FavoriteId._();

  factory FavoriteId([updates(FavoriteIdBuilder b)]) = _$FavoriteId;

  @BuiltValueField(wireName: 'id')
  String get id;
  @BuiltValueField(wireName: 'productid')
  String get productid;
  String toJson() {
    return json.encode(serializers.serializeWith(FavoriteId.serializer, this));
  }

  static FavoriteId fromJson(String jsonString) {
    return serializers.deserializeWith(
        FavoriteId.serializer, json.decode(jsonString));
  }

  static Serializer<FavoriteId> get serializer => _$favoriteIdSerializer;
}
