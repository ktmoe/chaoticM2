import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';

import '../serializers.dart';

part 'help.g.dart';

@HiveType(typeId: 3)
abstract class Help implements Built<Help, HelpBuilder> {
  Help._();

  factory Help([updates(HelpBuilder b)]) = _$Help;

  @HiveField(0)
  @BuiltValueField(wireName: 'id')
  String get id;
  @HiveField(1)
  @BuiltValueField(wireName: 'wholesale_phone')
  String get wholesalePhone;
  @HiveField(2)
  @BuiltValueField(wireName: 'customerservice_phone')
  String get customerservicePhone;
  @HiveField(3)
  @BuiltValueField(wireName: 'description')
  String get description;
  @HiveField(4)
  @BuiltValueField(wireName: 'createddate')
  String get createddate;
  @HiveField(5)
  @BuiltValueField(wireName: 'updateddate')
  String get updateddate;
  String toJson() {
    return json.encode(serializers.serializeWith(Help.serializer, this));
  }

  static Help fromJson(String jsonString) {
    return serializers.deserializeWith(
        Help.serializer, json.decode(jsonString));
  }

  static Serializer<Help> get serializer => _$helpSerializer;
}
