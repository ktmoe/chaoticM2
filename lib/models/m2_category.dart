library m2_category;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';
import 'package:hive/hive.dart';

part 'm2_category.g.dart';

@HiveType(typeId: 3)
abstract class M2Category implements Built<M2Category, M2CategoryBuilder> {
  M2Category._();

  factory M2Category([updates(M2CategoryBuilder b)]) = _$M2Category;

  @HiveField(0)
  @BuiltValueField(wireName: 'id')
  String get id;
  @HiveField(1)
  @BuiltValueField(wireName: 'category')
  String get category;
  String toJson() {
    return json.encode(serializers.serializeWith(M2Category.serializer, this));
  }

  static M2Category fromJson(String jsonString) {
    return serializers.deserializeWith(
        M2Category.serializer, json.decode(jsonString));
  }

  static Serializer<M2Category> get serializer => _$m2CategorySerializer;
}
