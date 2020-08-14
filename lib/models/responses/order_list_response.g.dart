// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderListResponse> _$orderListResponseSerializer =
    new _$OrderListResponseSerializer();

class _$OrderListResponseSerializer
    implements StructuredSerializer<OrderListResponse> {
  @override
  final Iterable<Type> types = const [OrderListResponse, _$OrderListResponse];
  @override
  final String wireName = 'OrderListResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, OrderListResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.order,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Order)])),
    ];

    return result;
  }

  @override
  OrderListResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderListResponseBuilder();

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
          result.order.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Order)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$OrderListResponse extends OrderListResponse {
  @override
  final String message;
  @override
  final BuiltList<Order> order;

  factory _$OrderListResponse(
          [void Function(OrderListResponseBuilder) updates]) =>
      (new OrderListResponseBuilder()..update(updates)).build();

  _$OrderListResponse._({this.message, this.order}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('OrderListResponse', 'message');
    }
    if (order == null) {
      throw new BuiltValueNullFieldError('OrderListResponse', 'order');
    }
  }

  @override
  OrderListResponse rebuild(void Function(OrderListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderListResponseBuilder toBuilder() =>
      new OrderListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderListResponse &&
        message == other.message &&
        order == other.order;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), order.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrderListResponse')
          ..add('message', message)
          ..add('order', order))
        .toString();
  }
}

class OrderListResponseBuilder
    implements Builder<OrderListResponse, OrderListResponseBuilder> {
  _$OrderListResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ListBuilder<Order> _order;
  ListBuilder<Order> get order => _$this._order ??= new ListBuilder<Order>();
  set order(ListBuilder<Order> order) => _$this._order = order;

  OrderListResponseBuilder();

  OrderListResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _order = _$v.order?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderListResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OrderListResponse;
  }

  @override
  void update(void Function(OrderListResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrderListResponse build() {
    _$OrderListResponse _$result;
    try {
      _$result = _$v ??
          new _$OrderListResponse._(message: message, order: order.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'order';
        order.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OrderListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
