library pay_order_payload;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

import 'package:http/http.dart';

part 'pay_order_payload.g.dart';

abstract class PayOrderPayload
    implements Built<PayOrderPayload, PayOrderPayloadBuilder> {
  PayOrderPayload._();

  factory PayOrderPayload([updates(PayOrderPayloadBuilder b)]) =
      _$PayOrderPayload;

  @BuiltValueField(wireName: 'orderid')
  String get orderid;
  @BuiltValueField(wireName: 'bankid')
  String get bankid;
  // @BuiltValueField(wireName: 'slipimg')
  // MultipartFile get slipimg;
  String toJson() {
    return json
        .encode(serializers.serializeWith(PayOrderPayload.serializer, this));
  }

  static PayOrderPayload fromJson(String jsonString) {
    return serializers.deserializeWith(
        PayOrderPayload.serializer, json.decode(jsonString));
  }

  static Serializer<PayOrderPayload> get serializer =>
      _$payOrderPayloadSerializer;
}
