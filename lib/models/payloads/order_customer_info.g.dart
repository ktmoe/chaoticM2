// GENERATED CODE - DO NOT MODIFY BY HAND

part of order_customer_info;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderCustomerInfo> _$orderCustomerInfoSerializer =
    new _$OrderCustomerInfoSerializer();

class _$OrderCustomerInfoSerializer
    implements StructuredSerializer<OrderCustomerInfo> {
  @override
  final Iterable<Type> types = const [OrderCustomerInfo, _$OrderCustomerInfo];
  @override
  final String wireName = 'OrderCustomerInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, OrderCustomerInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'customerid',
      serializers.serialize(object.customerid,
          specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  OrderCustomerInfo deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderCustomerInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'customerid':
          result.customerid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$OrderCustomerInfo extends OrderCustomerInfo {
  @override
  final String customerid;
  @override
  final String phone;
  @override
  final String address;

  factory _$OrderCustomerInfo(
          [void Function(OrderCustomerInfoBuilder) updates]) =>
      (new OrderCustomerInfoBuilder()..update(updates)).build();

  _$OrderCustomerInfo._({this.customerid, this.phone, this.address})
      : super._() {
    if (customerid == null) {
      throw new BuiltValueNullFieldError('OrderCustomerInfo', 'customerid');
    }
    if (phone == null) {
      throw new BuiltValueNullFieldError('OrderCustomerInfo', 'phone');
    }
    if (address == null) {
      throw new BuiltValueNullFieldError('OrderCustomerInfo', 'address');
    }
  }

  @override
  OrderCustomerInfo rebuild(void Function(OrderCustomerInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderCustomerInfoBuilder toBuilder() =>
      new OrderCustomerInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderCustomerInfo &&
        customerid == other.customerid &&
        phone == other.phone &&
        address == other.address;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, customerid.hashCode), phone.hashCode), address.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrderCustomerInfo')
          ..add('customerid', customerid)
          ..add('phone', phone)
          ..add('address', address))
        .toString();
  }
}

class OrderCustomerInfoBuilder
    implements Builder<OrderCustomerInfo, OrderCustomerInfoBuilder> {
  _$OrderCustomerInfo _$v;

  String _customerid;
  String get customerid => _$this._customerid;
  set customerid(String customerid) => _$this._customerid = customerid;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  OrderCustomerInfoBuilder();

  OrderCustomerInfoBuilder get _$this {
    if (_$v != null) {
      _customerid = _$v.customerid;
      _phone = _$v.phone;
      _address = _$v.address;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderCustomerInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OrderCustomerInfo;
  }

  @override
  void update(void Function(OrderCustomerInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrderCustomerInfo build() {
    final _$result = _$v ??
        new _$OrderCustomerInfo._(
            customerid: customerid, phone: phone, address: address);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
