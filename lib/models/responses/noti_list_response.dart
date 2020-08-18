import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../error_message.dart';
import '../serializers.dart';
import 'noti.dart';

part 'noti_list_response.g.dart';

abstract class NotiListResponse
    implements Built<NotiListResponse, NotiListResponseBuilder> {
  NotiListResponse._();

  factory NotiListResponse([updates(NotiListResponseBuilder b)]) =
  _$NotiListResponse;

  @BuiltValueField(wireName: 'message')
  String get message;

  @BuiltValueField(wireName: 'data')
  BuiltList<Noti> get noti;

  @nullable
  @BuiltValueField(wireName: 'error')
  ErrorMessage get error;

  String toJson() {
    return json
        .encode(serializers.serializeWith(NotiListResponse.serializer, this));
  }

  static NotiListResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        NotiListResponse.serializer, json.decode(jsonString));
  }

  static Serializer<NotiListResponse> get serializer =>
      _$notiListResponseSerializer;
}