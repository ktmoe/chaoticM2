// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CartItem> _$cartItemSerializer = new _$CartItemSerializer();

class _$CartItemSerializer implements StructuredSerializer<CartItem> {
  @override
  final Iterable<Type> types = const [CartItem, _$CartItem];
  @override
  final String wireName = 'CartItem';

  @override
  Iterable<Object> serialize(Serializers serializers, CartItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'customerid',
      serializers.serialize(object.customerid,
          specifiedType: const FullType(String)),
      'productid',
      serializers.serialize(object.productid,
          specifiedType: const FullType(String)),
      'quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(int)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.price != null) {
      result
        ..add('price')
        ..add(serializers.serialize(object.price,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CartItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CartItemBuilder();

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
        case 'customerid':
          result.customerid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'productid':
          result.productid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$CartItem extends CartItem {
  @override
  final String id;
  @override
  final String customerid;
  @override
  final String productid;
  @override
  final int quantity;
  @override
  final int price;

  factory _$CartItem([void Function(CartItemBuilder) updates]) =>
      (new CartItemBuilder()..update(updates)).build();

  _$CartItem._(
      {this.id, this.customerid, this.productid, this.quantity, this.price})
      : super._() {
    if (customerid == null) {
      throw new BuiltValueNullFieldError('CartItem', 'customerid');
    }
    if (productid == null) {
      throw new BuiltValueNullFieldError('CartItem', 'productid');
    }
    if (quantity == null) {
      throw new BuiltValueNullFieldError('CartItem', 'quantity');
    }
  }

  @override
  CartItem rebuild(void Function(CartItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartItemBuilder toBuilder() => new CartItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartItem &&
        id == other.id &&
        customerid == other.customerid &&
        productid == other.productid &&
        quantity == other.quantity &&
        price == other.price;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), customerid.hashCode),
                productid.hashCode),
            quantity.hashCode),
        price.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CartItem')
          ..add('id', id)
          ..add('customerid', customerid)
          ..add('productid', productid)
          ..add('quantity', quantity)
          ..add('price', price))
        .toString();
  }
}

class CartItemBuilder implements Builder<CartItem, CartItemBuilder> {
  _$CartItem _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _customerid;
  String get customerid => _$this._customerid;
  set customerid(String customerid) => _$this._customerid = customerid;

  String _productid;
  String get productid => _$this._productid;
  set productid(String productid) => _$this._productid = productid;

  int _quantity;
  int get quantity => _$this._quantity;
  set quantity(int quantity) => _$this._quantity = quantity;

  int _price;
  int get price => _$this._price;
  set price(int price) => _$this._price = price;

  CartItemBuilder();

  CartItemBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _customerid = _$v.customerid;
      _productid = _$v.productid;
      _quantity = _$v.quantity;
      _price = _$v.price;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CartItem;
  }

  @override
  void update(void Function(CartItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CartItem build() {
    final _$result = _$v ??
        new _$CartItem._(
            id: id,
            customerid: customerid,
            productid: productid,
            quantity: quantity,
            price: price);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
