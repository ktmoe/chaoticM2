import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'force_update.g.dart';

abstract class ForceUpdate implements Built<ForceUpdate, ForceUpdateBuilder> {
  ForceUpdate._();

  factory ForceUpdate([updates(ForceUpdateBuilder b)]) = _$ForceUpdate;

  @nullable
  @BuiltValueField(wireName: 'VersionCode')
  int get versionCode;
  @BuiltValueField(wireName: 'forceUpdate')
  bool get forceUpdate;
  @nullable
  @BuiltValueField(wireName: 'BuildNumber')
  int get buildNumber;

  String toJson() {
    return json.encode(serializers.serializeWith(ForceUpdate.serializer, this));
  }

  static ForceUpdate fromJson(String jsonString) {
    return serializers.deserializeWith(
        ForceUpdate.serializer, json.decode(jsonString));
  }

  static Serializer<ForceUpdate> get serializer => _$forceUpdateSerializer;
}
