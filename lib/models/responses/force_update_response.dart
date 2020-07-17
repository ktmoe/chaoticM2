import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../serializers.dart';
import 'force_update.dart';

part 'force_update_response.g.dart';

abstract class ForceUpdateResponse
    implements Built<ForceUpdateResponse, ForceUpdateResponseBuilder> {
  ForceUpdateResponse._();

  factory ForceUpdateResponse([updates(ForceUpdateResponseBuilder b)]) =
  _$ForceUpdateResponse;

  @BuiltValueField(wireName: 'data')
  ForceUpdate get forceUpdate;
  String toJson() {
    return json.encode(
        serializers.serializeWith(ForceUpdateResponse.serializer, this));
  }

  static ForceUpdateResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        ForceUpdateResponse.serializer, json.decode(jsonString));
  }

  static Serializer<ForceUpdateResponse> get serializer =>
      _$forceUpdateResponseSerializer;
}