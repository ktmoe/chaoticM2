// GENERATED CODE - DO NOT MODIFY BY HAND

part of favorite_item;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FavoriteItem> _$favoriteItemSerializer =
    new _$FavoriteItemSerializer();

class _$FavoriteItemSerializer implements StructuredSerializer<FavoriteItem> {
  @override
  final Iterable<Type> types = const [FavoriteItem, _$FavoriteItem];
  @override
  final String wireName = 'FavoriteItem';

  @override
  Iterable<Object> serialize(Serializers serializers, FavoriteItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'customerid',
      serializers.serialize(object.customerid,
          specifiedType: const FullType(String)),
      'productid',
      serializers.serialize(object.productid,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  FavoriteItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FavoriteItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'customerid':
          result.customerid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'productid':
          result.productid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$FavoriteItem extends FavoriteItem {
  @override
  final String customerid;
  @override
  final String productid;

  factory _$FavoriteItem([void Function(FavoriteItemBuilder) updates]) =>
      (new FavoriteItemBuilder()..update(updates)).build();

  _$FavoriteItem._({this.customerid, this.productid}) : super._() {
    if (customerid == null) {
      throw new BuiltValueNullFieldError('FavoriteItem', 'customerid');
    }
    if (productid == null) {
      throw new BuiltValueNullFieldError('FavoriteItem', 'productid');
    }
  }

  @override
  FavoriteItem rebuild(void Function(FavoriteItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FavoriteItemBuilder toBuilder() => new FavoriteItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FavoriteItem &&
        customerid == other.customerid &&
        productid == other.productid;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, customerid.hashCode), productid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FavoriteItem')
          ..add('customerid', customerid)
          ..add('productid', productid))
        .toString();
  }
}

class FavoriteItemBuilder
    implements Builder<FavoriteItem, FavoriteItemBuilder> {
  _$FavoriteItem _$v;

  String _customerid;
  String get customerid => _$this._customerid;
  set customerid(String customerid) => _$this._customerid = customerid;

  String _productid;
  String get productid => _$this._productid;
  set productid(String productid) => _$this._productid = productid;

  FavoriteItemBuilder();

  FavoriteItemBuilder get _$this {
    if (_$v != null) {
      _customerid = _$v.customerid;
      _productid = _$v.productid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FavoriteItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FavoriteItem;
  }

  @override
  void update(void Function(FavoriteItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FavoriteItem build() {
    final _$result = _$v ??
        new _$FavoriteItem._(customerid: customerid, productid: productid);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
