// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Product> _$productSerializer = new _$ProductSerializer();

class _$ProductSerializer implements StructuredSerializer<Product> {
  @override
  final Iterable<Type> types = const [Product, _$Product];
  @override
  final String wireName = 'Product';

  @override
  Iterable<Object> serialize(Serializers serializers, Product object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'productname',
      serializers.serialize(object.productName,
          specifiedType: const FullType(String)),
      'specification',
      serializers.serialize(object.specification,
          specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(int)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.categoryid != null) {
      result
        ..add('categoryid')
        ..add(serializers.serialize(object.categoryid,
            specifiedType: const FullType(String)));
    }
    if (object.subcategoryid != null) {
      result
        ..add('subcategoryid')
        ..add(serializers.serialize(object.subcategoryid,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.price != null) {
      result
        ..add('price')
        ..add(serializers.serialize(object.price,
            specifiedType: const FullType(int)));
    }
    if (object.images != null) {
      result
        ..add('images')
        ..add(serializers.serialize(object.images,
            specifiedType: const FullType(String)));
    }
    if (object.percentAmount != null) {
      result
        ..add('percent_amount')
        ..add(serializers.serialize(object.percentAmount,
            specifiedType: const FullType(int)));
    }
    if (object.discountPrice != null) {
      result
        ..add('discount_price')
        ..add(serializers.serialize(object.discountPrice,
            specifiedType: const FullType(int)));
    }
    if (object.discountType != null) {
      result
        ..add('discount_type')
        ..add(serializers.serialize(object.discountType,
            specifiedType: const FullType(String)));
    }
    if (object.soldCount != null) {
      result
        ..add('soldcount')
        ..add(serializers.serialize(object.soldCount,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Product deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'productname':
          result.productName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categoryid':
          result.categoryid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subcategoryid':
          result.subcategoryid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'specification':
          result.specification = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'images':
          result.images = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'percent_amount':
          result.percentAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'discount_price':
          result.discountPrice = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'discount_type':
          result.discountType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'soldcount':
          result.soldCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Product extends Product {
  @override
  final String id;
  @override
  final String productName;
  @override
  final String categoryid;
  @override
  final String subcategoryid;
  @override
  final String description;
  @override
  final String specification;
  @override
  final int price;
  @override
  final int status;
  @override
  final String images;
  @override
  final int percentAmount;
  @override
  final int discountPrice;
  @override
  final String discountType;
  @override
  final int soldCount;

  factory _$Product([void Function(ProductBuilder) updates]) =>
      (new ProductBuilder()..update(updates)).build();

  _$Product._(
      {this.id,
      this.productName,
      this.categoryid,
      this.subcategoryid,
      this.description,
      this.specification,
      this.price,
      this.status,
      this.images,
      this.percentAmount,
      this.discountPrice,
      this.discountType,
      this.soldCount})
      : super._() {
    if (productName == null) {
      throw new BuiltValueNullFieldError('Product', 'productName');
    }
    if (specification == null) {
      throw new BuiltValueNullFieldError('Product', 'specification');
    }
    if (status == null) {
      throw new BuiltValueNullFieldError('Product', 'status');
    }
  }

  @override
  Product rebuild(void Function(ProductBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductBuilder toBuilder() => new ProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Product &&
        id == other.id &&
        productName == other.productName &&
        categoryid == other.categoryid &&
        subcategoryid == other.subcategoryid &&
        description == other.description &&
        specification == other.specification &&
        price == other.price &&
        status == other.status &&
        images == other.images &&
        percentAmount == other.percentAmount &&
        discountPrice == other.discountPrice &&
        discountType == other.discountType &&
        soldCount == other.soldCount;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, id.hashCode),
                                                    productName.hashCode),
                                                categoryid.hashCode),
                                            subcategoryid.hashCode),
                                        description.hashCode),
                                    specification.hashCode),
                                price.hashCode),
                            status.hashCode),
                        images.hashCode),
                    percentAmount.hashCode),
                discountPrice.hashCode),
            discountType.hashCode),
        soldCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Product')
          ..add('id', id)
          ..add('productName', productName)
          ..add('categoryid', categoryid)
          ..add('subcategoryid', subcategoryid)
          ..add('description', description)
          ..add('specification', specification)
          ..add('price', price)
          ..add('status', status)
          ..add('images', images)
          ..add('percentAmount', percentAmount)
          ..add('discountPrice', discountPrice)
          ..add('discountType', discountType)
          ..add('soldCount', soldCount))
        .toString();
  }
}

class ProductBuilder implements Builder<Product, ProductBuilder> {
  _$Product _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _productName;
  String get productName => _$this._productName;
  set productName(String productName) => _$this._productName = productName;

  String _categoryid;
  String get categoryid => _$this._categoryid;
  set categoryid(String categoryid) => _$this._categoryid = categoryid;

  String _subcategoryid;
  String get subcategoryid => _$this._subcategoryid;
  set subcategoryid(String subcategoryid) =>
      _$this._subcategoryid = subcategoryid;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _specification;
  String get specification => _$this._specification;
  set specification(String specification) =>
      _$this._specification = specification;

  int _price;
  int get price => _$this._price;
  set price(int price) => _$this._price = price;

  int _status;
  int get status => _$this._status;
  set status(int status) => _$this._status = status;

  String _images;
  String get images => _$this._images;
  set images(String images) => _$this._images = images;

  int _percentAmount;
  int get percentAmount => _$this._percentAmount;
  set percentAmount(int percentAmount) => _$this._percentAmount = percentAmount;

  int _discountPrice;
  int get discountPrice => _$this._discountPrice;
  set discountPrice(int discountPrice) => _$this._discountPrice = discountPrice;

  String _discountType;
  String get discountType => _$this._discountType;
  set discountType(String discountType) => _$this._discountType = discountType;

  int _soldCount;
  int get soldCount => _$this._soldCount;
  set soldCount(int soldCount) => _$this._soldCount = soldCount;

  ProductBuilder();

  ProductBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _productName = _$v.productName;
      _categoryid = _$v.categoryid;
      _subcategoryid = _$v.subcategoryid;
      _description = _$v.description;
      _specification = _$v.specification;
      _price = _$v.price;
      _status = _$v.status;
      _images = _$v.images;
      _percentAmount = _$v.percentAmount;
      _discountPrice = _$v.discountPrice;
      _discountType = _$v.discountType;
      _soldCount = _$v.soldCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Product other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Product;
  }

  @override
  void update(void Function(ProductBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Product build() {
    final _$result = _$v ??
        new _$Product._(
            id: id,
            productName: productName,
            categoryid: categoryid,
            subcategoryid: subcategoryid,
            description: description,
            specification: specification,
            price: price,
            status: status,
            images: images,
            percentAmount: percentAmount,
            discountPrice: discountPrice,
            discountType: discountType,
            soldCount: soldCount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 1;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return (ProductBuilder()
          ..id = fields[0] as String
          ..productName = fields[1] as String
          ..categoryid = fields[2] as String
          ..subcategoryid = fields[3] as String
          ..description = fields[4] as String
          ..specification = fields[5] as String
          ..price = fields[6] as int
          ..status = fields[7] as int
          ..images = fields[8] as String
          ..percentAmount = fields[9] as int
          ..discountPrice = fields[10] as int
          ..discountType = fields[11] as String
          ..soldCount = fields[12] as int)
        .build();
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.categoryid)
      ..writeByte(3)
      ..write(obj.subcategoryid)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.specification)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.images)
      ..writeByte(9)
      ..write(obj.percentAmount)
      ..writeByte(10)
      ..write(obj.discountPrice)
      ..writeByte(11)
      ..write(obj.discountType)
      ..writeByte(12)
      ..write(obj.soldCount);
  }
}
