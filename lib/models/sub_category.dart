library sub_category;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';
import 'package:hive/hive.dart';

part 'sub_category.g.dart';

@HiveType(typeId: 4)
abstract class SubCategory implements Built<SubCategory, SubCategoryBuilder> {
  SubCategory._();

  factory SubCategory([updates(SubCategoryBuilder b)]) = _$SubCategory;

  @HiveField(0)
  @BuiltValueField(wireName: 'id')
  String get id;
  @HiveField(1)
  @BuiltValueField(wireName: 'categoryid')
  String get categoryId;
  @HiveField(2)
  @BuiltValueField(wireName: 'category')
  String get category;
  @HiveField(3)
  @BuiltValueField(wireName: 'sub_category')
  String get subCategory;
  String toJson() {
    return json.encode(serializers.serializeWith(SubCategory.serializer, this));
  }

  static SubCategory fromJson(String jsonString) {
    return serializers.deserializeWith(
        SubCategory.serializer, json.decode(jsonString));
  }

  static Serializer<SubCategory> get serializer => _$subCategorySerializer;
}
