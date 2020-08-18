library ads_response;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';
import 'package:m2mobile/models/ads.dart';
import 'package:m2mobile/models/error_message.dart';

part 'ads_response.g.dart';

abstract class AdsResponse implements Built<AdsResponse, AdsResponseBuilder> {
  AdsResponse._();

  factory AdsResponse([updates(AdsResponseBuilder b)]) = _$AdsResponse;

  @nullable
  @BuiltValueField(wireName: 'data')
  BuiltList<Ads> get ads;
  @nullable
  @BuiltValueField(wireName: 'error')
  ErrorMessage get error;
  String toJson() {
    return json.encode(serializers.serializeWith(AdsResponse.serializer, this));
  }

  static AdsResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        AdsResponse.serializer, json.decode(jsonString));
  }

  static Serializer<AdsResponse> get serializer => _$adsResponseSerializer;
}
