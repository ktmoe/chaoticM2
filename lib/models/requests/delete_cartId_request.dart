import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'delete_cartId_request.g.dart';

abstract class DeleteCartRequest
    implements Built<DeleteCartRequest, DeleteCartRequestBuilder> {
  DeleteCartRequest._();

  factory DeleteCartRequest([updates(DeleteCartRequestBuilder b)]) =
  _$DeleteCartRequest;

  @BuiltValueField(wireName: 'cartIdList')
  BuiltList<String> get cartIdList;
  String toJson() {
    return json
        .encode(serializers.serializeWith(DeleteCartRequest.serializer, this));
  }

  static DeleteCartRequest fromJson(String jsonString) {
    return serializers.deserializeWith(
        DeleteCartRequest.serializer, json.decode(jsonString));
  }

  static Serializer<DeleteCartRequest> get serializer =>
      _$deleteCartRequestSerializer;
}