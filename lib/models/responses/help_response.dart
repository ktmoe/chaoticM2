import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:m2mobile/models/serializers.dart';
import 'package:m2mobile/models/help.dart';

part 'help_response.g.dart';

abstract class HelpResponse
    implements Built<HelpResponse, HelpResponseBuilder> {
  HelpResponse._();

  factory HelpResponse([updates(HelpResponseBuilder b)]) = _$HelpResponse;

  @BuiltValueField(wireName: 'message')
  String get message;
  @BuiltValueField(wireName: 'data')
  Help get help;
  String toJson() {
    return json
        .encode(serializers.serializeWith(HelpResponse.serializer, this));
  }

  static HelpResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        HelpResponse.serializer, json.decode(jsonString));
  }

  static Serializer<HelpResponse> get serializer => _$helpResponseSerializer;
}
