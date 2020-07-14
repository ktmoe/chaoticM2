import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';
import 'help.dart';

part 'help_response.g.dart';

abstract class HelpResponse
    implements Built<HelpResponse, HelpResponseBuilder> {
  HelpResponse._();

  factory HelpResponse([updates(HelpResponseBuilder b)]) = _$HelpResponse;

  @BuiltValueField(wireName: 'help')
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
