library product;

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
  @BuiltValueField(wireName: 'favoriteid')
  String get favoriteId;
  @HiveField(1)
  @nullable
  @BuiltValueField(wireName: 'productid')
  String get productId;
  @HiveField(2)
  @nullable
  @BuiltValueField(wireName: 'productcode')
  String get productCode;
  @HiveField(3)
  @nullable
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
  @nullable
  @BuiltValueField(wireName: 'specification')
  String get specification;
  @HiveField(8)
  @nullable
  @BuiltValueField(wireName: 'price')
  int get price;
  @HiveField(9)
  @nullable
  @BuiltValueField(wireName: 'status')
  int get status;
  @HiveField(10)
  @nullable
  @BuiltValueField(wireName: 'isFavorite')
  bool get favorite;
  @HiveField(11)
  @nullable
  @BuiltValueField(wireName: 'images')
  BuiltList<String> get images;
  @HiveField(12)
  @nullable
  @BuiltValueField(wireName: 'percent_amount')
  int get percentAmount;
  @HiveField(13)
  @nullable
  @BuiltValueField(wireName: 'discount_price')
  int get discountPrice;
  @HiveField(14)
  @nullable
  @BuiltValueField(wireName: 'discount_type')
  String get discountType;
  @HiveField(15)
  @nullable
  @BuiltValueField(wireName: 'sold_count')
  int get soldCount;
  @HiveField(16)
  @nullable
  @BuiltValueField(wireName: 'quantity')
  int get quantity;
  @HiveField(17)
  @nullable
  @BuiltValueField(wireName: 'id')
  String get cartId;
  @HiveField(18)
  @nullable
  @BuiltValueField(wireName: 'date')
  String get date;

  String toJson() {
    return json.encode(serializers.serializeWith(Product.serializer, this));
  }

  static Product fromJson(String jsonString) {
    return serializers.deserializeWith(
        Product.serializer, json.decode(jsonString));
  }

  static Serializer<Product> get serializer => _$productSerializer;
}
