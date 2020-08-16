library delete_cart_list_request;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:m2mobile/models/serializers.dart';

part 'delete_cart_items_request.g.dart';

abstract class DeleteCartListRequest
    implements Built<DeleteCartListRequest, DeleteCartListRequestBuilder> {
  DeleteCartListRequest._();

  factory DeleteCartListRequest([updates(DeleteCartListRequestBuilder b)]) =
      _$DeleteCartListRequest;

  @BuiltValueField(wireName: 'productIdList')
  BuiltList<String> get productIdList;
  String toJson() {
    return json.encode(
        serializers.serializeWith(DeleteCartListRequest.serializer, this));
  }

  static DeleteCartListRequest fromJson(String jsonString) {
    return serializers.deserializeWith(
        DeleteCartListRequest.serializer, json.decode(jsonString));
  }

  static Serializer<DeleteCartListRequest> get serializer =>
      _$deleteCartListRequestSerializer;
}
