import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:chopper/chopper.dart';
import 'package:m2mobile/models/serializers.dart';

class CustomJsonConverter extends JsonConverter {
  const CustomJsonConverter();
  @override
  Request convertRequest(Request request) {
    // return super.convertRequest(request.copyWith(
    //   body: serializers.serializeWith(
    //       serializers.serializerForType(request.body.runtimeType as Type),
    //       request.body),
    // ));
    /// Do not convert request. It will only create unnessary bugs.
    return request;
  }

  @override
  Response<ResultType> convertError<ResultType, InnerType>(Response response) {
    throw HttpException(response.statusCode.toString());
  }

  @override
  Response<ResultType> convertResponse<ResultType, ItemType>(
      Response response) {
    final jsonRes = super.convertResponse(response);

    final customBody = convertJsonToObject<ItemType>(jsonRes.body);

    return jsonRes.copyWith(body: customBody as ResultType);
  }

  dynamic convertJsonToObject<ItemType>(dynamic jsonBody) {
    /// If the type which the response should hold is explicitly set to a dynamic Map,
    if (jsonBody is ItemType) return jsonBody;

    /// If the type is an iterable, return a built list of specified [itemType]
    if (jsonBody is Iterable) return _deserializeListOf<ItemType>(jsonBody);

    return _deserialize<ItemType>(jsonBody);
  }

  BuiltList<ItemType> _deserializeListOf<ItemType>(Iterable jsonBody) {
    return BuiltList.of(
        jsonBody.map((element) => _deserialize<ItemType>(element)));
  }

  ItemType _deserialize<ItemType>(dynamic item) {
    return serializers.deserializeWith<ItemType>(
      serializers.serializerForType(ItemType) as Serializer<ItemType>,
      item,
    );
  }
}
