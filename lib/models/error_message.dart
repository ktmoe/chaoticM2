library error_message;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'error_message.g.dart';

abstract class ErrorMessage
    implements Built<ErrorMessage, ErrorMessageBuilder> {
  ErrorMessage._();

  factory ErrorMessage([updates(ErrorMessageBuilder b)]) = _$ErrorMessage;

  @BuiltValueField(wireName: 'message')
  String get message;
  String toJson() {
    return json
        .encode(serializers.serializeWith(ErrorMessage.serializer, this));
  }

  static ErrorMessage fromJson(String jsonString) {
    return serializers.deserializeWith(
        ErrorMessage.serializer, json.decode(jsonString));
  }

  static Serializer<ErrorMessage> get serializer => _$errorMessageSerializer;
}
