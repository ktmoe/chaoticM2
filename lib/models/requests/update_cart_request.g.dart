// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UpdateCartRequest> _$updateCartRequestSerializer =
    new _$UpdateCartRequestSerializer();

class _$UpdateCartRequestSerializer
    implements StructuredSerializer<UpdateCartRequest> {
  @override
  final Iterable<Type> types = const [UpdateCartRequest, _$UpdateCartRequest];
  @override
  final String wireName = 'UpdateCartRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, UpdateCartRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'cartItem',
      serializers.serialize(object.updateItem,
          specifiedType: const FullType(UpdateItem)),
    ];

    return result;
  }

  @override
  UpdateCartRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UpdateCartRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'cartItem':
          result.updateItem.replace(serializers.deserialize(value,
              specifiedType: const FullType(UpdateItem)) as UpdateItem);
          break;
      }
    }

    return result.build();
  }
}

class _$UpdateCartRequest extends UpdateCartRequest {
  @override
  final UpdateItem updateItem;

  factory _$UpdateCartRequest(
          [void Function(UpdateCartRequestBuilder) updates]) =>
      (new UpdateCartRequestBuilder()..update(updates)).build();

  _$UpdateCartRequest._({this.updateItem}) : super._() {
    if (updateItem == null) {
      throw new BuiltValueNullFieldError('UpdateCartRequest', 'updateItem');
    }
  }

  @override
  UpdateCartRequest rebuild(void Function(UpdateCartRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateCartRequestBuilder toBuilder() =>
      new UpdateCartRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateCartRequest && updateItem == other.updateItem;
  }

  @override
  int get hashCode {
    return $jf($jc(0, updateItem.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UpdateCartRequest')
          ..add('updateItem', updateItem))
        .toString();
  }
}

class UpdateCartRequestBuilder
    implements Builder<UpdateCartRequest, UpdateCartRequestBuilder> {
  _$UpdateCartRequest _$v;

  UpdateItemBuilder _updateItem;
  UpdateItemBuilder get updateItem =>
      _$this._updateItem ??= new UpdateItemBuilder();
  set updateItem(UpdateItemBuilder updateItem) =>
      _$this._updateItem = updateItem;

  UpdateCartRequestBuilder();

  UpdateCartRequestBuilder get _$this {
    if (_$v != null) {
      _updateItem = _$v.updateItem?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateCartRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UpdateCartRequest;
  }

  @override
  void update(void Function(UpdateCartRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdateCartRequest build() {
    _$UpdateCartRequest _$result;
    try {
      _$result =
          _$v ?? new _$UpdateCartRequest._(updateItem: updateItem.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'updateItem';
        updateItem.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UpdateCartRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
