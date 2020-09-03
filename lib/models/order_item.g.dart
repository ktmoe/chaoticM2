// GENERATED CODE - DO NOT MODIFY BY HAND

part of order_item;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderItem> _$orderItemSerializer = new _$OrderItemSerializer();

class _$OrderItemSerializer implements StructuredSerializer<OrderItem> {
  @override
  final Iterable<Type> types = const [OrderItem, _$OrderItem];
  @override
  final String wireName = 'OrderItem';

  @override
  Iterable<Object> serialize(Serializers serializers, OrderItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'orderid',
      serializers.serialize(object.orderid,
          specifiedType: const FullType(String)),
      'productName',
      serializers.serialize(object.productName,
          specifiedType: const FullType(String)),
      'productid',
      serializers.serialize(object.productid,
          specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price, specifiedType: const FullType(int)),
      'quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(int)),
      'createddate',
      serializers.serialize(object.createddate,
          specifiedType: const FullType(String)),
      'updateddate',
      serializers.serialize(object.updateddate,
          specifiedType: const FullType(String)),
    ];
    if (object.images != null) {
      result
        ..add('images')
        ..add(serializers.serialize(object.images,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  OrderItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderItemBuilder();

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
        case 'orderid':
          result.orderid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'productName':
          result.productName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'productid':
          result.productid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'createddate':
          result.createddate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updateddate':
          result.updateddate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$OrderItem extends OrderItem {
  @override
  final String id;
  @override
  final String orderid;
  @override
  final String productName;
  @override
  final String productid;
  @override
  final BuiltList<String> images;
  @override
  final int price;
  @override
  final int quantity;
  @override
  final String createddate;
  @override
  final String updateddate;

  factory _$OrderItem([void Function(OrderItemBuilder) updates]) =>
      (new OrderItemBuilder()..update(updates)).build();

  _$OrderItem._(
      {this.id,
      this.orderid,
      this.productName,
      this.productid,
      this.images,
      this.price,
      this.quantity,
      this.createddate,
      this.updateddate})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('OrderItem', 'id');
    }
    if (orderid == null) {
      throw new BuiltValueNullFieldError('OrderItem', 'orderid');
    }
    if (productName == null) {
      throw new BuiltValueNullFieldError('OrderItem', 'productName');
    }
    if (productid == null) {
      throw new BuiltValueNullFieldError('OrderItem', 'productid');
    }
    if (price == null) {
      throw new BuiltValueNullFieldError('OrderItem', 'price');
    }
    if (quantity == null) {
      throw new BuiltValueNullFieldError('OrderItem', 'quantity');
    }
    if (createddate == null) {
      throw new BuiltValueNullFieldError('OrderItem', 'createddate');
    }
    if (updateddate == null) {
      throw new BuiltValueNullFieldError('OrderItem', 'updateddate');
    }
  }

  @override
  OrderItem rebuild(void Function(OrderItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderItemBuilder toBuilder() => new OrderItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderItem &&
        id == other.id &&
        orderid == other.orderid &&
        productName == other.productName &&
        productid == other.productid &&
        images == other.images &&
        price == other.price &&
        quantity == other.quantity &&
        createddate == other.createddate &&
        updateddate == other.updateddate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), orderid.hashCode),
                                productName.hashCode),
                            productid.hashCode),
                        images.hashCode),
                    price.hashCode),
                quantity.hashCode),
            createddate.hashCode),
        updateddate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrderItem')
          ..add('id', id)
          ..add('orderid', orderid)
          ..add('productName', productName)
          ..add('productid', productid)
          ..add('images', images)
          ..add('price', price)
          ..add('quantity', quantity)
          ..add('createddate', createddate)
          ..add('updateddate', updateddate))
        .toString();
  }
}

class OrderItemBuilder implements Builder<OrderItem, OrderItemBuilder> {
  _$OrderItem _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _orderid;
  String get orderid => _$this._orderid;
  set orderid(String orderid) => _$this._orderid = orderid;

  String _productName;
  String get productName => _$this._productName;
  set productName(String productName) => _$this._productName = productName;

  String _productid;
  String get productid => _$this._productid;
  set productid(String productid) => _$this._productid = productid;

  ListBuilder<String> _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String> images) => _$this._images = images;

  int _price;
  int get price => _$this._price;
  set price(int price) => _$this._price = price;

  int _quantity;
  int get quantity => _$this._quantity;
  set quantity(int quantity) => _$this._quantity = quantity;

  String _createddate;
  String get createddate => _$this._createddate;
  set createddate(String createddate) => _$this._createddate = createddate;

  String _updateddate;
  String get updateddate => _$this._updateddate;
  set updateddate(String updateddate) => _$this._updateddate = updateddate;

  OrderItemBuilder();

  OrderItemBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _orderid = _$v.orderid;
      _productName = _$v.productName;
      _productid = _$v.productid;
      _images = _$v.images?.toBuilder();
      _price = _$v.price;
      _quantity = _$v.quantity;
      _createddate = _$v.createddate;
      _updateddate = _$v.updateddate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OrderItem;
  }

  @override
  void update(void Function(OrderItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrderItem build() {
    _$OrderItem _$result;
    try {
      _$result = _$v ??
          new _$OrderItem._(
              id: id,
              orderid: orderid,
              productName: productName,
              productid: productid,
              images: _images?.build(),
              price: price,
              quantity: quantity,
              createddate: createddate,
              updateddate: updateddate);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OrderItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
