library ads;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';
import 'package:m2mobile/models/serializers.dart';

part 'ads.g.dart';

@HiveType(typeId: 9)
abstract class Ads implements Built<Ads, AdsBuilder> {
  Ads._();

  factory Ads([updates(AdsBuilder b)]) = _$Ads;

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
  @BuiltValueField(wireName: 'status')
  int get status;
  @HiveField(6)
  @BuiltValueField(wireName: 'date')
  String get date;
  @HiveField(7)
  @BuiltValueField(wireName: 'createddate')
  String get createddate;
  @HiveField(8)
  @BuiltValueField(wireName: 'updateddate')
  String get updateddate;
  String toJson() {
    return json.encode(serializers.serializeWith(Ads.serializer, this));
  }

  static Ads fromJson(String jsonString) {
    return serializers.deserializeWith(Ads.serializer, json.decode(jsonString));
  }

  static Serializer<Ads> get serializer => _$adsSerializer;
}
