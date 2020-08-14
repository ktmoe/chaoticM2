// GENERATED CODE - DO NOT MODIFY BY HAND

part of order_detail_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderDetailResponse> _$orderDetailResponseSerializer =
    new _$OrderDetailResponseSerializer();

class _$OrderDetailResponseSerializer
    implements StructuredSerializer<OrderDetailResponse> {
  @override
  final Iterable<Type> types = const [
    OrderDetailResponse,
    _$OrderDetailResponse
  ];
  @override
  final String wireName = 'OrderDetailResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, OrderDetailResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.orderItemWrapper,
          specifiedType: const FullType(OrderItemWrapper)),
    ];

    return result;
  }

  @override
  OrderDetailResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderDetailResponseBuilder();

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
          result.orderItemWrapper.replace(serializers.deserialize(value,
                  specifiedType: const FullType(OrderItemWrapper))
              as OrderItemWrapper);
          break;
      }
    }

    return result.build();
  }
}

class _$OrderDetailResponse extends OrderDetailResponse {
  @override
  final String message;
  @override
  final OrderItemWrapper orderItemWrapper;

  factory _$OrderDetailResponse(
          [void Function(OrderDetailResponseBuilder) updates]) =>
      (new OrderDetailResponseBuilder()..update(updates)).build();

  _$OrderDetailResponse._({this.message, this.orderItemWrapper}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('OrderDetailResponse', 'message');
    }
    if (orderItemWrapper == null) {
      throw new BuiltValueNullFieldError(
          'OrderDetailResponse', 'orderItemWrapper');
    }
  }

  @override
  OrderDetailResponse rebuild(
          void Function(OrderDetailResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderDetailResponseBuilder toBuilder() =>
      new OrderDetailResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderDetailResponse &&
        message == other.message &&
        orderItemWrapper == other.orderItemWrapper;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), orderItemWrapper.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrderDetailResponse')
          ..add('message', message)
          ..add('orderItemWrapper', orderItemWrapper))
        .toString();
  }
}

class OrderDetailResponseBuilder
    implements Builder<OrderDetailResponse, OrderDetailResponseBuilder> {
  _$OrderDetailResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  OrderItemWrapperBuilder _orderItemWrapper;
  OrderItemWrapperBuilder get orderItemWrapper =>
      _$this._orderItemWrapper ??= new OrderItemWrapperBuilder();
  set orderItemWrapper(OrderItemWrapperBuilder orderItemWrapper) =>
      _$this._orderItemWrapper = orderItemWrapper;

  OrderDetailResponseBuilder();

  OrderDetailResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _orderItemWrapper = _$v.orderItemWrapper?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderDetailResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OrderDetailResponse;
  }

  @override
  void update(void Function(OrderDetailResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrderDetailResponse build() {
    _$OrderDetailResponse _$result;
    try {
      _$result = _$v ??
          new _$OrderDetailResponse._(
              message: message, orderItemWrapper: orderItemWrapper.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'orderItemWrapper';
        orderItemWrapper.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OrderDetailResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
