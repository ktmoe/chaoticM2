library sub_categories_response;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';
import 'package:m2mobile/models/sub_category.dart';

part 'sub_category_response.g.dart';

abstract class SubCategoryResponse
    implements Built<SubCategoryResponse, SubCategoryResponseBuilder> {
  SubCategoryResponse._();

  factory SubCategoryResponse([updates(SubCategoryResponseBuilder b)]) =
      _$SubCategoryResponse;

  @BuiltValueField(wireName: 'message')
  String get message;
  @BuiltValueField(wireName: 'data')
  BuiltList<SubCategory> get subCategory;
  String toJson() {
    return json.encode(
        serializers.serializeWith(SubCategoryResponse.serializer, this));
  }

  static SubCategoryResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        SubCategoryResponse.serializer, json.decode(jsonString));
  }

  static Serializer<SubCategoryResponse> get serializer =>
      _$subCategoryResponseSerializer;
}
