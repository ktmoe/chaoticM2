// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UpdateItem> _$updateItemSerializer = new _$UpdateItemSerializer();

class _$UpdateItemSerializer implements StructuredSerializer<UpdateItem> {
  @override
  final Iterable<Type> types = const [UpdateItem, _$UpdateItem];
  @override
  final String wireName = 'UpdateItem';

  @override
  Iterable<Object> serialize(Serializers serializers, UpdateItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  UpdateItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UpdateItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$UpdateItem extends UpdateItem {
  @override
  final int quantity;

  factory _$UpdateItem([void Function(UpdateItemBuilder) updates]) =>
      (new UpdateItemBuilder()..update(updates)).build();

  _$UpdateItem._({this.quantity}) : super._() {
    if (quantity == null) {
      throw new BuiltValueNullFieldError('UpdateItem', 'quantity');
    }
  }

  @override
  UpdateItem rebuild(void Function(UpdateItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateItemBuilder toBuilder() => new UpdateItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateItem && quantity == other.quantity;
  }

  @override
  int get hashCode {
    return $jf($jc(0, quantity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UpdateItem')
          ..add('quantity', quantity))
        .toString();
  }
}

class UpdateItemBuilder implements Builder<UpdateItem, UpdateItemBuilder> {
  _$UpdateItem _$v;

  int _quantity;
  int get quantity => _$this._quantity;
  set quantity(int quantity) => _$this._quantity = quantity;

  UpdateItemBuilder();

  UpdateItemBuilder get _$this {
    if (_$v != null) {
      _quantity = _$v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UpdateItem;
  }

  @override
  void update(void Function(UpdateItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdateItem build() {
    final _$result = _$v ?? new _$UpdateItem._(quantity: quantity);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
