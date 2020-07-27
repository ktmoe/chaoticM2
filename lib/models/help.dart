import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';

import 'package:m2mobile/models/serializers.dart';

part 'help.g.dart';

@HiveType(typeId: 5)
abstract class Help implements Built<Help, HelpBuilder> {
  Help._();

  factory Help([updates(HelpBuilder b)]) = _$Help;

  @HiveField(0)
  @BuiltValueField(wireName: 'id')
  String get id;
  @HiveField(1)
  @BuiltValueField(wireName: 'customerservice_phone')
  String get customerservicePhone;
  String toJson() {
    return json.encode(serializers.serializeWith(Help.serializer, this));
  }

  static Help fromJson(String jsonString) {
    return serializers.deserializeWith(
        Help.serializer, json.decode(jsonString));
  }

  static Serializer<Help> get serializer => _$helpSerializer;
}
