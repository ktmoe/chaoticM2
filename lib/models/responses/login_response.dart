library login_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'login_response.g.dart';

abstract class LoginResponse
    implements Built<LoginResponse, LoginResponseBuilder> {
  LoginResponse._();

  factory LoginResponse([updates(LoginResponseBuilder b)]) = _$LoginResponse;

  @BuiltValueField(wireName: 'message')
  String get message;

  @nullable
  @BuiltValueField(wireName: 'data')
  String get data;
  String toJson() {
    return json
        .encode(serializers.serializeWith(LoginResponse.serializer, this));
  }

  static LoginResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        LoginResponse.serializer, json.decode(jsonString));
  }

  static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;
}
