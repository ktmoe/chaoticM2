library company_info_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';
import 'package:m2mobile/models/company_info.dart';

part 'company_info_response.g.dart';

abstract class CompanyInfoResponse
    implements Built<CompanyInfoResponse, CompanyInfoResponseBuilder> {
  CompanyInfoResponse._();

  factory CompanyInfoResponse([updates(CompanyInfoResponseBuilder b)]) =
      _$CompanyInfoResponse;

  @BuiltValueField(wireName: 'message')
  String get message;
  @BuiltValueField(wireName: 'data')
  CompanyInfo get companyInfo;
  String toJson() {
    return json.encode(
        serializers.serializeWith(CompanyInfoResponse.serializer, this));
  }

  static CompanyInfoResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        CompanyInfoResponse.serializer, json.decode(jsonString));
  }

  static Serializer<CompanyInfoResponse> get serializer =>
      _$companyInfoResponseSerializer;
}
