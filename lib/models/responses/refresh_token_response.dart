library refresh_token_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'refresh_token_response.g.dart';

abstract class RefreshTokenResponse
    implements Built<RefreshTokenResponse, RefreshTokenResponseBuilder> {
  RefreshTokenResponse._();

  factory RefreshTokenResponse([updates(RefreshTokenResponseBuilder b)]) =
      _$RefreshTokenResponse;

  @BuiltValueField(wireName: 'message')
  String get message;
  @nullable
  @BuiltValueField(wireName: 'data')
  int get data;
  String toJson() {
    return json.encode(
        serializers.serializeWith(RefreshTokenResponse.serializer, this));
  }

  static RefreshTokenResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        RefreshTokenResponse.serializer, json.decode(jsonString));
  }

  static Serializer<RefreshTokenResponse> get serializer =>
      _$refreshTokenResponseSerializer;
}
