// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CartListResponse> _$cartListResponseSerializer =
    new _$CartListResponseSerializer();

class _$CartListResponseSerializer
    implements StructuredSerializer<CartListResponse> {
  @override
  final Iterable<Type> types = const [CartListResponse, _$CartListResponse];
  @override
  final String wireName = 'CartListResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, CartListResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.cartItem,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CartItem)])),
    ];

    return result;
  }

  @override
  CartListResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CartListResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'data':
          result.cartItem.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CartItem)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$CartListResponse extends CartListResponse {
  @override
  final String message;
  @override
  final BuiltList<CartItem> cartItem;

  factory _$CartListResponse(
          [void Function(CartListResponseBuilder) updates]) =>
      (new CartListResponseBuilder()..update(updates)).build();

  _$CartListResponse._({this.message, this.cartItem}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('CartListResponse', 'message');
    }
    if (cartItem == null) {
      throw new BuiltValueNullFieldError('CartListResponse', 'cartItem');
    }
  }

  @override
  CartListResponse rebuild(void Function(CartListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartListResponseBuilder toBuilder() =>
      new CartListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartListResponse &&
        message == other.message &&
        cartItem == other.cartItem;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), cartItem.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CartListResponse')
          ..add('message', message)
          ..add('cartItem', cartItem))
        .toString();
  }
}

class CartListResponseBuilder
    implements Builder<CartListResponse, CartListResponseBuilder> {
  _$CartListResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ListBuilder<CartItem> _cartItem;
  ListBuilder<CartItem> get cartItem =>
      _$this._cartItem ??= new ListBuilder<CartItem>();
  set cartItem(ListBuilder<CartItem> cartItem) => _$this._cartItem = cartItem;

  CartListResponseBuilder();

  CartListResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _cartItem = _$v.cartItem?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartListResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CartListResponse;
  }

  @override
  void update(void Function(CartListResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CartListResponse build() {
    _$CartListResponse _$result;
    try {
      _$result = _$v ??
          new _$CartListResponse._(
              message: message, cartItem: cartItem.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'cartItem';
        cartItem.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CartListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
