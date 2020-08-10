import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';

import 'package:m2mobile/models/serializers.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
abstract class Product implements Built<Product, ProductBuilder> {
  Product._();

  factory Product([updates(ProductBuilder b)]) = _$Product;

  @HiveField(0)
  @nullable
  @BuiltValueField(wireName: 'id')
  String get id;
  @HiveField(1)
  @BuiltValueField(wireName: 'productname')
  String get productName;
  @HiveField(2)
  @nullable
  @BuiltValueField(wireName: 'categoryid')
  String get categoryid;
  @HiveField(3)
  @nullable
  @BuiltValueField(wireName: 'subcategoryid')
  String get subcategoryid;
  @HiveField(4)
  @nullable
  @BuiltValueField(wireName: 'description')
  String get description;
  @HiveField(5)
  @BuiltValueField(wireName: 'specification')
  String get specification;
  @HiveField(6)
  @nullable
  @BuiltValueField(wireName: 'price')
  int get price;
  @HiveField(7)
  @BuiltValueField(wireName: 'status')
  int get status;
  @HiveField(8)
  @nullable
  @BuiltValueField(wireName: 'favorite')
  String get favorite;
  @nullable
  @HiveField(9)
  @BuiltValueField(wireName: 'images')
  BuiltList<String> get images;
  @nullable
  @HiveField(10)
  @BuiltValueField(wireName: 'percent_amount')
  int get percentAmount;
  @nullable
  @HiveField(11)
  @BuiltValueField(wireName: 'discount_price')
  int get discountPrice;
  @nullable
  @HiveField(12)
  @BuiltValueField(wireName: 'discount_type')
  String get discountType;
  @nullable
  @HiveField(13)
  @BuiltValueField(wireName: 'soldcount')
  int get soldCount;

  String toJson() {
    return json.encode(serializers.serializeWith(Product.serializer, this));
  }

  static Product fromJson(String jsonString) {
    return serializers.deserializeWith(
        Product.serializer, json.decode(jsonString));
  }

  static Serializer<Product> get serializer => _$productSerializer;
}
