library post_profile_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';
import 'package:m2mobile/models/user_profile.dart';

part 'post_profile_response.g.dart';

abstract class PostProfileResponse
    implements Built<PostProfileResponse, PostProfileResponseBuilder> {
  PostProfileResponse._();

  factory PostProfileResponse([updates(PostProfileResponseBuilder b)]) =
      _$PostProfileResponse;

  @BuiltValueField(wireName: 'message')
  String get message;

  @nullable
  @BuiltValueField(wireName: 'data')
  UserProfile get data;
  String toJson() {
    return json.encode(
        serializers.serializeWith(PostProfileResponse.serializer, this));
  }

  static PostProfileResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        PostProfileResponse.serializer, json.decode(jsonString));
  }

  static Serializer<PostProfileResponse> get serializer =>
      _$postProfileResponseSerializer;
}
