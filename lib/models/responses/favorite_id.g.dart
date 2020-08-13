// GENERATED CODE - DO NOT MODIFY BY HAND

part of favorite_id;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FavoriteId> _$favoriteIdSerializer = new _$FavoriteIdSerializer();

class _$FavoriteIdSerializer implements StructuredSerializer<FavoriteId> {
  @override
  final Iterable<Type> types = const [FavoriteId, _$FavoriteId];
  @override
  final String wireName = 'FavoriteId';

  @override
  Iterable<Object> serialize(Serializers serializers, FavoriteId object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'productid',
      serializers.serialize(object.productid,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  FavoriteId deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FavoriteIdBuilder();

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
        case 'productid':
          result.productid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$FavoriteId extends FavoriteId {
  @override
  final String id;
  @override
  final String productid;

  factory _$FavoriteId([void Function(FavoriteIdBuilder) updates]) =>
      (new FavoriteIdBuilder()..update(updates)).build();

  _$FavoriteId._({this.id, this.productid}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('FavoriteId', 'id');
    }
    if (productid == null) {
      throw new BuiltValueNullFieldError('FavoriteId', 'productid');
    }
  }

  @override
  FavoriteId rebuild(void Function(FavoriteIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FavoriteIdBuilder toBuilder() => new FavoriteIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FavoriteId &&
        id == other.id &&
        productid == other.productid;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), productid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FavoriteId')
          ..add('id', id)
          ..add('productid', productid))
        .toString();
  }
}

class FavoriteIdBuilder implements Builder<FavoriteId, FavoriteIdBuilder> {
  _$FavoriteId _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _productid;
  String get productid => _$this._productid;
  set productid(String productid) => _$this._productid = productid;

  FavoriteIdBuilder();

  FavoriteIdBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _productid = _$v.productid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FavoriteId other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FavoriteId;
  }

  @override
  void update(void Function(FavoriteIdBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FavoriteId build() {
    final _$result = _$v ?? new _$FavoriteId._(id: id, productid: productid);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
