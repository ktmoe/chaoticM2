library bank_info_response;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/bank_account.dart';
import 'package:m2mobile/models/serializers.dart';

part 'bank_info_response.g.dart';

abstract class BankInfoResponse
    implements Built<BankInfoResponse, BankInfoResponseBuilder> {
  BankInfoResponse._();

  factory BankInfoResponse([updates(BankInfoResponseBuilder b)]) =
      _$BankInfoResponse;

  @BuiltValueField(wireName: 'message')
  String get message;
  @BuiltValueField(wireName: 'data')
  BuiltList<BankAccount> get bankAccount;
  String toJson() {
    return json
        .encode(serializers.serializeWith(BankInfoResponse.serializer, this));
  }

  static BankInfoResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        BankInfoResponse.serializer, json.decode(jsonString));
  }

  static Serializer<BankInfoResponse> get serializer =>
      _$bankInfoResponseSerializer;
}
