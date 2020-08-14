// GENERATED CODE - DO NOT MODIFY BY HAND

part of pay_order_payload;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PayOrderPayload> _$payOrderPayloadSerializer =
    new _$PayOrderPayloadSerializer();

class _$PayOrderPayloadSerializer
    implements StructuredSerializer<PayOrderPayload> {
  @override
  final Iterable<Type> types = const [PayOrderPayload, _$PayOrderPayload];
  @override
  final String wireName = 'PayOrderPayload';

  @override
  Iterable<Object> serialize(Serializers serializers, PayOrderPayload object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'orderid',
      serializers.serialize(object.orderid,
          specifiedType: const FullType(String)),
      'bankid',
      serializers.serialize(object.bankid,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PayOrderPayload deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PayOrderPayloadBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'orderid':
          result.orderid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bankid':
          result.bankid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PayOrderPayload extends PayOrderPayload {
  @override
  final String orderid;
  @override
  final String bankid;

  factory _$PayOrderPayload([void Function(PayOrderPayloadBuilder) updates]) =>
      (new PayOrderPayloadBuilder()..update(updates)).build();

  _$PayOrderPayload._({this.orderid, this.bankid}) : super._() {
    if (orderid == null) {
      throw new BuiltValueNullFieldError('PayOrderPayload', 'orderid');
    }
    if (bankid == null) {
      throw new BuiltValueNullFieldError('PayOrderPayload', 'bankid');
    }
  }

  @override
  PayOrderPayload rebuild(void Function(PayOrderPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PayOrderPayloadBuilder toBuilder() =>
      new PayOrderPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PayOrderPayload &&
        orderid == other.orderid &&
        bankid == other.bankid;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, orderid.hashCode), bankid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PayOrderPayload')
          ..add('orderid', orderid)
          ..add('bankid', bankid))
        .toString();
  }
}

class PayOrderPayloadBuilder
    implements Builder<PayOrderPayload, PayOrderPayloadBuilder> {
  _$PayOrderPayload _$v;

  String _orderid;
  String get orderid => _$this._orderid;
  set orderid(String orderid) => _$this._orderid = orderid;

  String _bankid;
  String get bankid => _$this._bankid;
  set bankid(String bankid) => _$this._bankid = bankid;

  PayOrderPayloadBuilder();

  PayOrderPayloadBuilder get _$this {
    if (_$v != null) {
      _orderid = _$v.orderid;
      _bankid = _$v.bankid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PayOrderPayload other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PayOrderPayload;
  }

  @override
  void update(void Function(PayOrderPayloadBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PayOrderPayload build() {
    final _$result =
        _$v ?? new _$PayOrderPayload._(orderid: orderid, bankid: bankid);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
