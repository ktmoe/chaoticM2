// GENERATED CODE - DO NOT MODIFY BY HAND

part of order_customer_info_payload;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderCustomerInfoPayload> _$orderCustomerInfoPayloadSerializer =
    new _$OrderCustomerInfoPayloadSerializer();

class _$OrderCustomerInfoPayloadSerializer
    implements StructuredSerializer<OrderCustomerInfoPayload> {
  @override
  final Iterable<Type> types = const [
    OrderCustomerInfoPayload,
    _$OrderCustomerInfoPayload
  ];
  @override
  final String wireName = 'OrderCustomerInfoPayload';

  @override
  Iterable<Object> serialize(
      Serializers serializers, OrderCustomerInfoPayload object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'orderCustomerInfo',
      serializers.serialize(object.orderCustomerInfo,
          specifiedType: const FullType(OrderCustomerInfo)),
    ];

    return result;
  }

  @override
  OrderCustomerInfoPayload deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderCustomerInfoPayloadBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'orderCustomerInfo':
          result.orderCustomerInfo.replace(serializers.deserialize(value,
                  specifiedType: const FullType(OrderCustomerInfo))
              as OrderCustomerInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$OrderCustomerInfoPayload extends OrderCustomerInfoPayload {
  @override
  final OrderCustomerInfo orderCustomerInfo;

  factory _$OrderCustomerInfoPayload(
          [void Function(OrderCustomerInfoPayloadBuilder) updates]) =>
      (new OrderCustomerInfoPayloadBuilder()..update(updates)).build();

  _$OrderCustomerInfoPayload._({this.orderCustomerInfo}) : super._() {
    if (orderCustomerInfo == null) {
      throw new BuiltValueNullFieldError(
          'OrderCustomerInfoPayload', 'orderCustomerInfo');
    }
  }

  @override
  OrderCustomerInfoPayload rebuild(
          void Function(OrderCustomerInfoPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderCustomerInfoPayloadBuilder toBuilder() =>
      new OrderCustomerInfoPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderCustomerInfoPayload &&
        orderCustomerInfo == other.orderCustomerInfo;
  }

  @override
  int get hashCode {
    return $jf($jc(0, orderCustomerInfo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrderCustomerInfoPayload')
          ..add('orderCustomerInfo', orderCustomerInfo))
        .toString();
  }
}

class OrderCustomerInfoPayloadBuilder
    implements
        Builder<OrderCustomerInfoPayload, OrderCustomerInfoPayloadBuilder> {
  _$OrderCustomerInfoPayload _$v;

  OrderCustomerInfoBuilder _orderCustomerInfo;
  OrderCustomerInfoBuilder get orderCustomerInfo =>
      _$this._orderCustomerInfo ??= new OrderCustomerInfoBuilder();
  set orderCustomerInfo(OrderCustomerInfoBuilder orderCustomerInfo) =>
      _$this._orderCustomerInfo = orderCustomerInfo;

  OrderCustomerInfoPayloadBuilder();

  OrderCustomerInfoPayloadBuilder get _$this {
    if (_$v != null) {
      _orderCustomerInfo = _$v.orderCustomerInfo?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderCustomerInfoPayload other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OrderCustomerInfoPayload;
  }

  @override
  void update(void Function(OrderCustomerInfoPayloadBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrderCustomerInfoPayload build() {
    _$OrderCustomerInfoPayload _$result;
    try {
      _$result = _$v ??
          new _$OrderCustomerInfoPayload._(
              orderCustomerInfo: orderCustomerInfo.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'orderCustomerInfo';
        orderCustomerInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OrderCustomerInfoPayload', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
