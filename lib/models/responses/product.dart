import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';

import '../serializers.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
abstract class Product implements Built<Product, ProductBuilder> {
  Product._();

  factory Product([updates(ProductBuilder b)]) = _$Product;

  @BuiltValueField(wireName: 'id')
  String get id;
  @BuiltValueField(wireName: 'imageurl1')
  String get imageurl1;
  @BuiltValueField(wireName: 'imageurl2')
  String get imageurl2;
  @BuiltValueField(wireName: 'imageurl3')
  String get imageurl3;
  @BuiltValueField(wireName: 'categoryid')
  String get categoryid;
  @BuiltValueField(wireName: 'subcategoryid')
  String get subcategoryid;
  @BuiltValueField(wireName: 'productname')
  String get productname;
  @BuiltValueField(wireName: 'description')
  String get description;
  @BuiltValueField(wireName: 'itemcount')
  int get itemcount;
  @BuiltValueField(wireName: 'price')
  int get price;
  @BuiltValueField(wireName: 'category')
  String get category;
  @BuiltValueField(wireName: 'sub_category')
  String get subCategory;
  String toJson() {
    return json.encode(serializers.serializeWith(Product.serializer, this));
  }

  static Product fromJson(String jsonString) {
    return serializers.deserializeWith(
        Product.serializer, json.decode(jsonString));
  }

  static Serializer<Product> get serializer => _$productSerializer;
}