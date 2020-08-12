library favorite_item;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'favorite_item.g.dart';

abstract class FavoriteItem
    implements Built<FavoriteItem, FavoriteItemBuilder> {
  FavoriteItem._();

  factory FavoriteItem([updates(FavoriteItemBuilder b)]) = _$FavoriteItem;

  @BuiltValueField(wireName: 'customerid')
  String get customerid;
  @BuiltValueField(wireName: 'productid')
  String get productid;
  String toJson() {
    return json
        .encode(serializers.serializeWith(FavoriteItem.serializer, this));
  }

  static FavoriteItem fromJson(String jsonString) {
    return serializers.deserializeWith(
        FavoriteItem.serializer, json.decode(jsonString));
  }

  static Serializer<FavoriteItem> get serializer => _$favoriteItemSerializer;
}
