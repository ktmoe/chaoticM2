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
      'productcode',
      serializers.serialize(object.productCode,
          specifiedType: const FullType(String)),
      'productname',
      serializers.serialize(object.productName,
          specifiedType: const FullType(String)),
      'specification',
      serializers.serialize(object.specification,
          specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(int)),
    ];
    if (object.favoriteId != null) {
      result
        ..add('favoriteid')
        ..add(serializers.serialize(object.favoriteId,
            specifiedType: const FullType(String)));
    }
    if (object.productId != null) {
      result
        ..add('productid')
        ..add(serializers.serialize(object.productId,
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
    if (object.favorite != null) {
      result
        ..add('isFavorite')
        ..add(serializers.serialize(object.favorite,
            specifiedType: const FullType(bool)));
    }
    if (object.images != null) {
      result
        ..add('images')
        ..add(serializers.serialize(object.images,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
    if (object.quantity != null) {
      result
        ..add('quantity')
        ..add(serializers.serialize(object.quantity,
            specifiedType: const FullType(int)));
    }
    if (object.cartId != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.cartId,
            specifiedType: const FullType(String)));
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
        case 'favoriteid':
          result.favoriteId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'productid':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'productcode':
          result.productCode = serializers.deserialize(value,
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
        case 'isFavorite':
          result.favorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
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
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.cartId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Product extends Product {
  @override
  final String favoriteId;
  @override
  final String productId;
  @override
  final String productCode;
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
  final bool favorite;
  @override
  final BuiltList<String> images;
  @override
  final int percentAmount;
  @override
  final int discountPrice;
  @override
  final String discountType;
  @override
  final int soldCount;
  @override
  final int quantity;
  @override
  final String cartId;

  factory _$Product([void Function(ProductBuilder) updates]) =>
      (new ProductBuilder()..update(updates)).build();

  _$Product._(
      {this.favoriteId,
      this.productId,
      this.productCode,
      this.productName,
      this.categoryid,
      this.subcategoryid,
      this.description,
      this.specification,
      this.price,
      this.status,
      this.favorite,
      this.images,
      this.percentAmount,
      this.discountPrice,
      this.discountType,
      this.soldCount,
      this.quantity,
      this.cartId})
      : super._() {
    if (productCode == null) {
      throw new BuiltValueNullFieldError('Product', 'productCode');
    }
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
        favoriteId == other.favoriteId &&
        productId == other.productId &&
        productCode == other.productCode &&
        productName == other.productName &&
        categoryid == other.categoryid &&
        subcategoryid == other.subcategoryid &&
        description == other.description &&
        specification == other.specification &&
        price == other.price &&
        status == other.status &&
        favorite == other.favorite &&
        images == other.images &&
        percentAmount == other.percentAmount &&
        discountPrice == other.discountPrice &&
        discountType == other.discountType &&
        soldCount == other.soldCount &&
        quantity == other.quantity &&
        cartId == other.cartId;
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
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            favoriteId
                                                                                .hashCode),
                                                                        productId
                                                                            .hashCode),
                                                                    productCode
                                                                        .hashCode),
                                                                productName
                                                                    .hashCode),
                                                            categoryid
                                                                .hashCode),
                                                        subcategoryid.hashCode),
                                                    description.hashCode),
                                                specification.hashCode),
                                            price.hashCode),
                                        status.hashCode),
                                    favorite.hashCode),
                                images.hashCode),
                            percentAmount.hashCode),
                        discountPrice.hashCode),
                    discountType.hashCode),
                soldCount.hashCode),
            quantity.hashCode),
        cartId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Product')
          ..add('favoriteId', favoriteId)
          ..add('productId', productId)
          ..add('productCode', productCode)
          ..add('productName', productName)
          ..add('categoryid', categoryid)
          ..add('subcategoryid', subcategoryid)
          ..add('description', description)
          ..add('specification', specification)
          ..add('price', price)
          ..add('status', status)
          ..add('favorite', favorite)
          ..add('images', images)
          ..add('percentAmount', percentAmount)
          ..add('discountPrice', discountPrice)
          ..add('discountType', discountType)
          ..add('soldCount', soldCount)
          ..add('quantity', quantity)
          ..add('cartId', cartId))
        .toString();
  }
}

class ProductBuilder implements Builder<Product, ProductBuilder> {
  _$Product _$v;

  String _favoriteId;
  String get favoriteId => _$this._favoriteId;
  set favoriteId(String favoriteId) => _$this._favoriteId = favoriteId;

  String _productId;
  String get productId => _$this._productId;
  set productId(String productId) => _$this._productId = productId;

  String _productCode;
  String get productCode => _$this._productCode;
  set productCode(String productCode) => _$this._productCode = productCode;

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

  bool _favorite;
  bool get favorite => _$this._favorite;
  set favorite(bool favorite) => _$this._favorite = favorite;

  ListBuilder<String> _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String> images) => _$this._images = images;

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

  int _quantity;
  int get quantity => _$this._quantity;
  set quantity(int quantity) => _$this._quantity = quantity;

  String _cartId;
  String get cartId => _$this._cartId;
  set cartId(String cartId) => _$this._cartId = cartId;

  ProductBuilder();

  ProductBuilder get _$this {
    if (_$v != null) {
      _favoriteId = _$v.favoriteId;
      _productId = _$v.productId;
      _productCode = _$v.productCode;
      _productName = _$v.productName;
      _categoryid = _$v.categoryid;
      _subcategoryid = _$v.subcategoryid;
      _description = _$v.description;
      _specification = _$v.specification;
      _price = _$v.price;
      _status = _$v.status;
      _favorite = _$v.favorite;
      _images = _$v.images?.toBuilder();
      _percentAmount = _$v.percentAmount;
      _discountPrice = _$v.discountPrice;
      _discountType = _$v.discountType;
      _soldCount = _$v.soldCount;
      _quantity = _$v.quantity;
      _cartId = _$v.cartId;
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
    _$Product _$result;
    try {
      _$result = _$v ??
          new _$Product._(
              favoriteId: favoriteId,
              productId: productId,
              productCode: productCode,
              productName: productName,
              categoryid: categoryid,
              subcategoryid: subcategoryid,
              description: description,
              specification: specification,
              price: price,
              status: status,
              favorite: favorite,
              images: _images?.build(),
              percentAmount: percentAmount,
              discountPrice: discountPrice,
              discountType: discountType,
              soldCount: soldCount,
              quantity: quantity,
              cartId: cartId);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Product', _$failedField, e.toString());
      }
      rethrow;
    }
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
          ..favoriteId = fields[0] as String
          ..productId = fields[1] as String
          ..productCode = fields[2] as String
          ..productName = fields[3] as String
          ..categoryid = fields[4] as String
          ..subcategoryid = fields[5] as String
          ..description = fields[6] as String
          ..specification = fields[7] as String
          ..price = fields[8] as int
          ..status = fields[9] as int
          ..favorite = fields[10] as bool
          ..images = ListBuilder<String>(fields[11] as List)
          ..percentAmount = fields[12] as int
          ..discountPrice = fields[13] as int
          ..discountType = fields[14] as String
          ..soldCount = fields[15] as int
          ..quantity = fields[17] as int
          ..cartId = fields[16] as String)
        .build();
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.favoriteId)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.productCode)
      ..writeByte(3)
      ..write(obj.productName)
      ..writeByte(4)
      ..write(obj.categoryid)
      ..writeByte(5)
      ..write(obj.subcategoryid)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.specification)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.favorite)
      ..writeByte(11)
      ..write(obj.images?.toList())
      ..writeByte(12)
      ..write(obj.percentAmount)
      ..writeByte(13)
      ..write(obj.discountPrice)
      ..writeByte(14)
      ..write(obj.discountType)
      ..writeByte(15)
      ..write(obj.soldCount)
      ..writeByte(17)
      ..write(obj.quantity)
      ..writeByte(16)
      ..write(obj.cartId);
  }
}
