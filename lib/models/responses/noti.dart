import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';

import '../serializers.dart';

part 'noti.g.dart';

@HiveType(typeId: 10)
abstract class Noti implements Built<Noti, NotiBuilder> {
  Noti._();

  factory Noti([updates(NotiBuilder b)]) = _$Noti;

  @HiveField(0)
  @BuiltValueField(wireName: 'id')
  String get id;
  @HiveField(1)
  @BuiltValueField(wireName: 'imageurl')
  String get imageurl;
  @HiveField(2)
  @BuiltValueField(wireName: 'title')
  String get title;
  @HiveField(3)
  @BuiltValueField(wireName: 'description')
  String get description;
  @HiveField(4)
  @BuiltValueField(wireName: 'date')
  String get date;
  String toJson() {
    return json.encode(serializers.serializeWith(Noti.serializer, this));
  }

  static Noti fromJson(String jsonString) {
    return serializers.deserializeWith(
        Noti.serializer, json.decode(jsonString));
  }

  static Serializer<Noti> get serializer => _$notiSerializer;
}