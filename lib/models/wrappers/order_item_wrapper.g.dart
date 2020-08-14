// GENERATED CODE - DO NOT MODIFY BY HAND

part of order_item_wrapper;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderItemWrapper> _$orderItemWrapperSerializer =
    new _$OrderItemWrapperSerializer();

class _$OrderItemWrapperSerializer
    implements StructuredSerializer<OrderItemWrapper> {
  @override
  final Iterable<Type> types = const [OrderItemWrapper, _$OrderItemWrapper];
  @override
  final String wireName = 'OrderItemWrapper';

  @override
  Iterable<Object> serialize(Serializers serializers, OrderItemWrapper object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'orderItemList',
      serializers.serialize(object.orderItem,
          specifiedType:
              const FullType(BuiltList, const [const FullType(OrderItem)])),
    ];

    return result;
  }

  @override
  OrderItemWrapper deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderItemWrapperBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'orderItemList':
          result.orderItem.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(OrderItem)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$OrderItemWrapper extends OrderItemWrapper {
  @override
  final BuiltList<OrderItem> orderItem;

  factory _$OrderItemWrapper(
          [void Function(OrderItemWrapperBuilder) updates]) =>
      (new OrderItemWrapperBuilder()..update(updates)).build();

  _$OrderItemWrapper._({this.orderItem}) : super._() {
    if (orderItem == null) {
      throw new BuiltValueNullFieldError('OrderItemWrapper', 'orderItem');
    }
  }

  @override
  OrderItemWrapper rebuild(void Function(OrderItemWrapperBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderItemWrapperBuilder toBuilder() =>
      new OrderItemWrapperBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderItemWrapper && orderItem == other.orderItem;
  }

  @override
  int get hashCode {
    return $jf($jc(0, orderItem.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrderItemWrapper')
          ..add('orderItem', orderItem))
        .toString();
  }
}

class OrderItemWrapperBuilder
    implements Builder<OrderItemWrapper, OrderItemWrapperBuilder> {
  _$OrderItemWrapper _$v;

  ListBuilder<OrderItem> _orderItem;
  ListBuilder<OrderItem> get orderItem =>
      _$this._orderItem ??= new ListBuilder<OrderItem>();
  set orderItem(ListBuilder<OrderItem> orderItem) =>
      _$this._orderItem = orderItem;

  OrderItemWrapperBuilder();

  OrderItemWrapperBuilder get _$this {
    if (_$v != null) {
      _orderItem = _$v.orderItem?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderItemWrapper other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OrderItemWrapper;
  }

  @override
  void update(void Function(OrderItemWrapperBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrderItemWrapper build() {
    _$OrderItemWrapper _$result;
    try {
      _$result = _$v ?? new _$OrderItemWrapper._(orderItem: orderItem.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'orderItem';
        orderItem.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OrderItemWrapper', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
