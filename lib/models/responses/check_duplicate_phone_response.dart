library check_duplicate_phone_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'check_duplicate_phone_response.g.dart';

abstract class CheckDuplicatePhoneResponse
    implements
        Built<CheckDuplicatePhoneResponse, CheckDuplicatePhoneResponseBuilder> {
  CheckDuplicatePhoneResponse._();

  factory CheckDuplicatePhoneResponse(
          [updates(CheckDuplicatePhoneResponseBuilder b)]) =
      _$CheckDuplicatePhoneResponse;

  @BuiltValueField(wireName: 'message')
  String get message;
  @BuiltValueField(wireName: 'data')
  bool get data;
  String toJson() {
    return json.encode(serializers.serializeWith(
        CheckDuplicatePhoneResponse.serializer, this));
  }

  static CheckDuplicatePhoneResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        CheckDuplicatePhoneResponse.serializer, json.decode(jsonString));
  }

  static Serializer<CheckDuplicatePhoneResponse> get serializer =>
      _$checkDuplicatePhoneResponseSerializer;
}
