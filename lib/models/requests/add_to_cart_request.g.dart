// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddToCartRequest> _$addToCartRequestSerializer =
    new _$AddToCartRequestSerializer();

class _$AddToCartRequestSerializer
    implements StructuredSerializer<AddToCartRequest> {
  @override
  final Iterable<Type> types = const [AddToCartRequest, _$AddToCartRequest];
  @override
  final String wireName = 'AddToCartRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, AddToCartRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'cartItem',
      serializers.serialize(object.cartItem,
          specifiedType: const FullType(CartItem)),
    ];

    return result;
  }

  @override
  AddToCartRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddToCartRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'cartItem':
          result.cartItem.replace(serializers.deserialize(value,
              specifiedType: const FullType(CartItem)) as CartItem);
          break;
      }
    }

    return result.build();
  }
}

class _$AddToCartRequest extends AddToCartRequest {
  @override
  final CartItem cartItem;

  factory _$AddToCartRequest(
          [void Function(AddToCartRequestBuilder) updates]) =>
      (new AddToCartRequestBuilder()..update(updates)).build();

  _$AddToCartRequest._({this.cartItem}) : super._() {
    if (cartItem == null) {
      throw new BuiltValueNullFieldError('AddToCartRequest', 'cartItem');
    }
  }

  @override
  AddToCartRequest rebuild(void Function(AddToCartRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddToCartRequestBuilder toBuilder() =>
      new AddToCartRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddToCartRequest && cartItem == other.cartItem;
  }

  @override
  int get hashCode {
    return $jf($jc(0, cartItem.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddToCartRequest')
          ..add('cartItem', cartItem))
        .toString();
  }
}

class AddToCartRequestBuilder
    implements Builder<AddToCartRequest, AddToCartRequestBuilder> {
  _$AddToCartRequest _$v;

  CartItemBuilder _cartItem;
  CartItemBuilder get cartItem => _$this._cartItem ??= new CartItemBuilder();
  set cartItem(CartItemBuilder cartItem) => _$this._cartItem = cartItem;

  AddToCartRequestBuilder();

  AddToCartRequestBuilder get _$this {
    if (_$v != null) {
      _cartItem = _$v.cartItem?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddToCartRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AddToCartRequest;
  }

  @override
  void update(void Function(AddToCartRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AddToCartRequest build() {
    _$AddToCartRequest _$result;
    try {
      _$result = _$v ?? new _$AddToCartRequest._(cartItem: cartItem.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'cartItem';
        cartItem.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AddToCartRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
