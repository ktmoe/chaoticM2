library change_pwd_payload;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'change_pwd_payload.g.dart';

abstract class ChangePwdPayload
    implements Built<ChangePwdPayload, ChangePwdPayloadBuilder> {
  ChangePwdPayload._();

  factory ChangePwdPayload([updates(ChangePwdPayloadBuilder b)]) =
      _$ChangePwdPayload;

  @BuiltValueField(wireName: 'customerId')
  String get customerId;
  @BuiltValueField(wireName: 'oldPassword')
  String get oldPassword;
  @BuiltValueField(wireName: 'newPassword')
  String get newPassword;
  String toJson() {
    return json
        .encode(serializers.serializeWith(ChangePwdPayload.serializer, this));
  }

  static ChangePwdPayload fromJson(String jsonString) {
    return serializers.deserializeWith(
        ChangePwdPayload.serializer, json.decode(jsonString));
  }

  static Serializer<ChangePwdPayload> get serializer =>
      _$changePwdPayloadSerializer;
}
