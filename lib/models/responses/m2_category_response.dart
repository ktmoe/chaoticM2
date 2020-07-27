library m2_category_response;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/m2_category.dart';
import 'package:m2mobile/models/serializers.dart';

part 'm2_category_response.g.dart';

abstract class M2CategoryResponse
    implements Built<M2CategoryResponse, M2CategoryResponseBuilder> {
  M2CategoryResponse._();

  factory M2CategoryResponse([updates(M2CategoryResponseBuilder b)]) =
      _$M2CategoryResponse;

  @BuiltValueField(wireName: 'message')
  String get message;
  @BuiltValueField(wireName: 'data')
  BuiltList<M2Category> get m2Category;
  String toJson() {
    return json
        .encode(serializers.serializeWith(M2CategoryResponse.serializer, this));
  }

  static M2CategoryResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        M2CategoryResponse.serializer, json.decode(jsonString));
  }

  static Serializer<M2CategoryResponse> get serializer =>
      _$m2CategoryResponseSerializer;
}
