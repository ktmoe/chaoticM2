library change_pwd_payload_wrapper;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/payloads/change_pwd_payload.dart';
import 'package:m2mobile/models/serializers.dart';

part 'change_pwd_payload_wrapper.g.dart';

abstract class ChangePwdPayloadWrapper
    implements Built<ChangePwdPayloadWrapper, ChangePwdPayloadWrapperBuilder> {
  ChangePwdPayloadWrapper._();

  factory ChangePwdPayloadWrapper([updates(ChangePwdPayloadWrapperBuilder b)]) =
      _$ChangePwdPayloadWrapper;

  @BuiltValueField(wireName: 'data')
  ChangePwdPayload get changePwdPayload;
  String toJson() {
    return json.encode(
        serializers.serializeWith(ChangePwdPayloadWrapper.serializer, this));
  }

  static ChangePwdPayloadWrapper fromJson(String jsonString) {
    return serializers.deserializeWith(
        ChangePwdPayloadWrapper.serializer, json.decode(jsonString));
  }

  static Serializer<ChangePwdPayloadWrapper> get serializer =>
      _$changePwdPayloadWrapperSerializer;
}
