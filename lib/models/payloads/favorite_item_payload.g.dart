// GENERATED CODE - DO NOT MODIFY BY HAND

part of favorite_item_payload;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FavoriteItemPayload> _$favoriteItemPayloadSerializer =
    new _$FavoriteItemPayloadSerializer();

class _$FavoriteItemPayloadSerializer
    implements StructuredSerializer<FavoriteItemPayload> {
  @override
  final Iterable<Type> types = const [
    FavoriteItemPayload,
    _$FavoriteItemPayload
  ];
  @override
  final String wireName = 'FavoriteItemPayload';

  @override
  Iterable<Object> serialize(
      Serializers serializers, FavoriteItemPayload object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'favoriteItem',
      serializers.serialize(object.favoriteItem,
          specifiedType: const FullType(FavoriteItem)),
    ];

    return result;
  }

  @override
  FavoriteItemPayload deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FavoriteItemPayloadBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'favoriteItem':
          result.favoriteItem.replace(serializers.deserialize(value,
              specifiedType: const FullType(FavoriteItem)) as FavoriteItem);
          break;
      }
    }

    return result.build();
  }
}

class _$FavoriteItemPayload extends FavoriteItemPayload {
  @override
  final FavoriteItem favoriteItem;

  factory _$FavoriteItemPayload(
          [void Function(FavoriteItemPayloadBuilder) updates]) =>
      (new FavoriteItemPayloadBuilder()..update(updates)).build();

  _$FavoriteItemPayload._({this.favoriteItem}) : super._() {
    if (favoriteItem == null) {
      throw new BuiltValueNullFieldError('FavoriteItemPayload', 'favoriteItem');
    }
  }

  @override
  FavoriteItemPayload rebuild(
          void Function(FavoriteItemPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FavoriteItemPayloadBuilder toBuilder() =>
      new FavoriteItemPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FavoriteItemPayload && favoriteItem == other.favoriteItem;
  }

  @override
  int get hashCode {
    return $jf($jc(0, favoriteItem.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FavoriteItemPayload')
          ..add('favoriteItem', favoriteItem))
        .toString();
  }
}

class FavoriteItemPayloadBuilder
    implements Builder<FavoriteItemPayload, FavoriteItemPayloadBuilder> {
  _$FavoriteItemPayload _$v;

  FavoriteItemBuilder _favoriteItem;
  FavoriteItemBuilder get favoriteItem =>
      _$this._favoriteItem ??= new FavoriteItemBuilder();
  set favoriteItem(FavoriteItemBuilder favoriteItem) =>
      _$this._favoriteItem = favoriteItem;

  FavoriteItemPayloadBuilder();

  FavoriteItemPayloadBuilder get _$this {
    if (_$v != null) {
      _favoriteItem = _$v.favoriteItem?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FavoriteItemPayload other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FavoriteItemPayload;
  }

  @override
  void update(void Function(FavoriteItemPayloadBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FavoriteItemPayload build() {
    _$FavoriteItemPayload _$result;
    try {
      _$result = _$v ??
          new _$FavoriteItemPayload._(favoriteItem: favoriteItem.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'favoriteItem';
        favoriteItem.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FavoriteItemPayload', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
