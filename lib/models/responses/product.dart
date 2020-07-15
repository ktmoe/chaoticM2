import 'dart:convert';

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
  @nullable
  @BuiltValueField(wireName: 'imageurl1')
  String get imageurl1;
  @HiveField(2)
  @nullable
  @BuiltValueField(wireName: 'imageurl2')
  String get imageurl2;
  @HiveField(3)
  @nullable
  @BuiltValueField(wireName: 'imageurl3')
  String get imageurl3;
  @HiveField(4)
  @nullable
  @BuiltValueField(wireName: 'categoryid')
  String get categoryid;
  @HiveField(5)
  @nullable
  @BuiltValueField(wireName: 'subcategoryid')
  String get subcategoryid;
  @HiveField(6)
  @nullable
  @BuiltValueField(wireName: 'productname')
  String get productname;
  @HiveField(7)
  @nullable
  @BuiltValueField(wireName: 'description')
  String get description;
  @HiveField(8)
  @nullable
  @BuiltValueField(wireName: 'itemcount')
  int get itemcount;
  @HiveField(9)
  @nullable
  @BuiltValueField(wireName: 'price')
  int get price;
  @HiveField(10)
  @nullable
  @BuiltValueField(wireName: 'category')
  String get category;
  @HiveField(11)
  @nullable
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
