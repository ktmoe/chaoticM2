library company_info;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';
import 'package:m2mobile/models/serializers.dart';

part 'company_info.g.dart';

@HiveType(typeId: 2)
abstract class CompanyInfo implements Built<CompanyInfo, CompanyInfoBuilder> {
  CompanyInfo._();

  factory CompanyInfo([updates(CompanyInfoBuilder b)]) = _$CompanyInfo;

  @HiveField(0)
  @BuiltValueField(wireName: 'id')
  String get id;
  @HiveField(1)
  @BuiltValueField(wireName: 'imageurl')
  String get imageurl;
  @HiveField(2)
  @BuiltValueField(wireName: 'description')
  String get description;
  @HiveField(3)
  @BuiltValueField(wireName: 'phone')
  String get phone;
  @HiveField(4)
  @BuiltValueField(wireName: 'tax')
  int get tax;
  @HiveField(5)
  @BuiltValueField(wireName: 'address')
  String get address;
  @HiveField(6)
  @BuiltValueField(wireName: 'fburl')
  String get fburl;
  @HiveField(7)
  @BuiltValueField(wireName: 'mapurl')
  String get mapurl;
  @HiveField(8)
  @BuiltValueField(wireName: 'messagerurl')
  String get messagerurl;
  @HiveField(9)
  @BuiltValueField(wireName: 'createddate')
  String get createddate;
  @HiveField(10)
  @BuiltValueField(wireName: 'updateddate')
  String get updateddate;
  String toJson() {
    return json.encode(serializers.serializeWith(CompanyInfo.serializer, this));
  }

  static CompanyInfo fromJson(String jsonString) {
    return serializers.deserializeWith(
        CompanyInfo.serializer, json.decode(jsonString));
  }

  static Serializer<CompanyInfo> get serializer => _$companyInfoSerializer;
}
