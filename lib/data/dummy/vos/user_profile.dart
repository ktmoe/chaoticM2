library user_profile;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';
import 'package:m2mobile/utils/serializers.dart';

part 'user_profile.g.dart';

@HiveType(typeId: 0)
abstract class UserProfile implements Built<UserProfile, UserProfileBuilder> {
  UserProfile._();

  factory UserProfile([updates(UserProfileBuilder b)]) = _$UserProfile;

  @HiveField(0)
  @BuiltValueField(wireName: 'id')
  String get id;

  @HiveField(1)
  @BuiltValueField(wireName: 'name')
  String get name;

  @HiveField(2)
  @BuiltValueField(wireName: 'image')
  String get image;

  @HiveField(3)
  @BuiltValueField(wireName: 'phone')
  String get phone;

  @HiveField(4)
  @BuiltValueField(wireName: 'address')
  String get address;

  String toJson() {
    return json.encode(serializers.serializeWith(UserProfile.serializer, this));
  }

  static UserProfile fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserProfile.serializer, json.decode(jsonString));
  }

  static Serializer<UserProfile> get serializer => _$userProfileSerializer;
}
