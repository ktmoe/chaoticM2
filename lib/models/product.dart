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

  @nullable
  @HiveField(0)
  @BuiltValueField(wireName: 'id')
  String get favoriteId;
  @HiveField(1)
  @nullable
  @BuiltValueField(wireName: 'productid')
  String get productId;
  @HiveField(2)
  @BuiltValueField(wireName: 'productcode')
  String get productCode;
  @HiveField(3)
  @BuiltValueField(wireName: 'productname')
  String get productName;
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
  @BuiltValueField(wireName: 'description')
  String get description;
  @HiveField(7)
  @BuiltValueField(wireName: 'specification')
  String get specification;
  @HiveField(8)
  @nullable
  @BuiltValueField(wireName: 'price')
  int get price;
  @HiveField(9)
  @BuiltValueField(wireName: 'status')
  int get status;
  @HiveField(10)
  @nullable
  @BuiltValueField(wireName: 'isFavorite')
  bool get favorite;
  @nullable
  @HiveField(11)
  @BuiltValueField(wireName: 'images')
  BuiltList<String> get images;
  @nullable
  @HiveField(12)
  @BuiltValueField(wireName: 'percent_amount')
  int get percentAmount;
  @nullable
  @HiveField(13)
  @BuiltValueField(wireName: 'discount_price')
  int get discountPrice;
  @nullable
  @HiveField(14)
  @BuiltValueField(wireName: 'discount_type')
  String get discountType;
  @nullable
  @HiveField(15)
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
