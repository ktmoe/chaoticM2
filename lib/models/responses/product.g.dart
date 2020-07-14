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
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'imageurl1',
      serializers.serialize(object.imageurl1,
          specifiedType: const FullType(String)),
      'imageurl2',
      serializers.serialize(object.imageurl2,
          specifiedType: const FullType(String)),
      'imageurl3',
      serializers.serialize(object.imageurl3,
          specifiedType: const FullType(String)),
      'categoryid',
      serializers.serialize(object.categoryid,
          specifiedType: const FullType(String)),
      'subcategoryid',
      serializers.serialize(object.subcategoryid,
          specifiedType: const FullType(String)),
      'productname',
      serializers.serialize(object.productname,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'itemcount',
      serializers.serialize(object.itemcount,
          specifiedType: const FullType(int)),
      'price',
      serializers.serialize(object.price, specifiedType: const FullType(int)),
      'category',
      serializers.serialize(object.category,
          specifiedType: const FullType(String)),
      'sub_category',
      serializers.serialize(object.subCategory,
          specifiedType: const FullType(String)),
    ];

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
        case 'imageurl1':
          result.imageurl1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imageurl2':
          result.imageurl2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imageurl3':
          result.imageurl3 = serializers.deserialize(value,
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
        case 'productname':
          result.productname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'itemcount':
          result.itemcount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sub_category':
          result.subCategory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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
  final String imageurl1;
  @override
  final String imageurl2;
  @override
  final String imageurl3;
  @override
  final String categoryid;
  @override
  final String subcategoryid;
  @override
  final String productname;
  @override
  final String description;
  @override
  final int itemcount;
  @override
  final int price;
  @override
  final String category;
  @override
  final String subCategory;

  factory _$Product([void Function(ProductBuilder) updates]) =>
      (new ProductBuilder()..update(updates)).build();

  _$Product._(
      {this.id,
      this.imageurl1,
      this.imageurl2,
      this.imageurl3,
      this.categoryid,
      this.subcategoryid,
      this.productname,
      this.description,
      this.itemcount,
      this.price,
      this.category,
      this.subCategory})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Product', 'id');
    }
    if (imageurl1 == null) {
      throw new BuiltValueNullFieldError('Product', 'imageurl1');
    }
    if (imageurl2 == null) {
      throw new BuiltValueNullFieldError('Product', 'imageurl2');
    }
    if (imageurl3 == null) {
      throw new BuiltValueNullFieldError('Product', 'imageurl3');
    }
    if (categoryid == null) {
      throw new BuiltValueNullFieldError('Product', 'categoryid');
    }
    if (subcategoryid == null) {
      throw new BuiltValueNullFieldError('Product', 'subcategoryid');
    }
    if (productname == null) {
      throw new BuiltValueNullFieldError('Product', 'productname');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('Product', 'description');
    }
    if (itemcount == null) {
      throw new BuiltValueNullFieldError('Product', 'itemcount');
    }
    if (price == null) {
      throw new BuiltValueNullFieldError('Product', 'price');
    }
    if (category == null) {
      throw new BuiltValueNullFieldError('Product', 'category');
    }
    if (subCategory == null) {
      throw new BuiltValueNullFieldError('Product', 'subCategory');
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
        imageurl1 == other.imageurl1 &&
        imageurl2 == other.imageurl2 &&
        imageurl3 == other.imageurl3 &&
        categoryid == other.categoryid &&
        subcategoryid == other.subcategoryid &&
        productname == other.productname &&
        description == other.description &&
        itemcount == other.itemcount &&
        price == other.price &&
        category == other.category &&
        subCategory == other.subCategory;
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
                                            $jc($jc(0, id.hashCode),
                                                imageurl1.hashCode),
                                            imageurl2.hashCode),
                                        imageurl3.hashCode),
                                    categoryid.hashCode),
                                subcategoryid.hashCode),
                            productname.hashCode),
                        description.hashCode),
                    itemcount.hashCode),
                price.hashCode),
            category.hashCode),
        subCategory.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Product')
          ..add('id', id)
          ..add('imageurl1', imageurl1)
          ..add('imageurl2', imageurl2)
          ..add('imageurl3', imageurl3)
          ..add('categoryid', categoryid)
          ..add('subcategoryid', subcategoryid)
          ..add('productname', productname)
          ..add('description', description)
          ..add('itemcount', itemcount)
          ..add('price', price)
          ..add('category', category)
          ..add('subCategory', subCategory))
        .toString();
  }
}

class ProductBuilder implements Builder<Product, ProductBuilder> {
  _$Product _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _imageurl1;
  String get imageurl1 => _$this._imageurl1;
  set imageurl1(String imageurl1) => _$this._imageurl1 = imageurl1;

  String _imageurl2;
  String get imageurl2 => _$this._imageurl2;
  set imageurl2(String imageurl2) => _$this._imageurl2 = imageurl2;

  String _imageurl3;
  String get imageurl3 => _$this._imageurl3;
  set imageurl3(String imageurl3) => _$this._imageurl3 = imageurl3;

  String _categoryid;
  String get categoryid => _$this._categoryid;
  set categoryid(String categoryid) => _$this._categoryid = categoryid;

  String _subcategoryid;
  String get subcategoryid => _$this._subcategoryid;
  set subcategoryid(String subcategoryid) =>
      _$this._subcategoryid = subcategoryid;

  String _productname;
  String get productname => _$this._productname;
  set productname(String productname) => _$this._productname = productname;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _itemcount;
  int get itemcount => _$this._itemcount;
  set itemcount(int itemcount) => _$this._itemcount = itemcount;

  int _price;
  int get price => _$this._price;
  set price(int price) => _$this._price = price;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  String _subCategory;
  String get subCategory => _$this._subCategory;
  set subCategory(String subCategory) => _$this._subCategory = subCategory;

  ProductBuilder();

  ProductBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _imageurl1 = _$v.imageurl1;
      _imageurl2 = _$v.imageurl2;
      _imageurl3 = _$v.imageurl3;
      _categoryid = _$v.categoryid;
      _subcategoryid = _$v.subcategoryid;
      _productname = _$v.productname;
      _description = _$v.description;
      _itemcount = _$v.itemcount;
      _price = _$v.price;
      _category = _$v.category;
      _subCategory = _$v.subCategory;
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
            imageurl1: imageurl1,
            imageurl2: imageurl2,
            imageurl3: imageurl3,
            categoryid: categoryid,
            subcategoryid: subcategoryid,
            productname: productname,
            description: description,
            itemcount: itemcount,
            price: price,
            category: category,
            subCategory: subCategory);
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
    return (ProductBuilder()).build();
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer..writeByte(0);
  }
}
