import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/product.dart';

import 'package:m2mobile/models/serializers.dart';

part 'product_response.g.dart';

abstract class ProductResponse
    implements Built<ProductResponse, ProductResponseBuilder> {
  ProductResponse._();

  factory ProductResponse([updates(ProductResponseBuilder b)]) =
      _$ProductResponse;

  @BuiltValueField(wireName: 'data')
  BuiltList<Product> get product;
  String toJson() {
    return json
        .encode(serializers.serializeWith(ProductResponse.serializer, this));
  }

  static ProductResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        ProductResponse.serializer, json.decode(jsonString));
  }

  static Serializer<ProductResponse> get serializer =>
      _$productResponseSerializer;
}
