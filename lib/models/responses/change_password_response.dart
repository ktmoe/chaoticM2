library change_password_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';
import 'package:m2mobile/models/error_message.dart';

part 'change_password_response.g.dart';

abstract class ChangePasswordResponse
    implements Built<ChangePasswordResponse, ChangePasswordResponseBuilder> {
  ChangePasswordResponse._();

  factory ChangePasswordResponse([updates(ChangePasswordResponseBuilder b)]) =
      _$ChangePasswordResponse;

  @nullable
  @BuiltValueField(wireName: 'error')
  ErrorMessage get error;
  @nullable
  @BuiltValueField(wireName: 'message')
  String get message;
  String toJson() {
    return json.encode(
        serializers.serializeWith(ChangePasswordResponse.serializer, this));
  }

  static ChangePasswordResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        ChangePasswordResponse.serializer, json.decode(jsonString));
  }

  static Serializer<ChangePasswordResponse> get serializer =>
      _$changePasswordResponseSerializer;
}