library favorite_operate_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'favorite_operate_response.g.dart';

abstract class FavoriteOperateResponse
    implements Built<FavoriteOperateResponse, FavoriteOperateResponseBuilder> {
  FavoriteOperateResponse._();

  factory FavoriteOperateResponse([updates(FavoriteOperateResponseBuilder b)]) =
      _$FavoriteOperateResponse;

  @BuiltValueField(wireName: 'message')
  String get message;
  String toJson() {
    return json.encode(
        serializers.serializeWith(FavoriteOperateResponse.serializer, this));
  }

  static FavoriteOperateResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        FavoriteOperateResponse.serializer, json.decode(jsonString));
  }

  static Serializer<FavoriteOperateResponse> get serializer =>
      _$favoriteOperateResponseSerializer;
}
