// GENERATED CODE - DO NOT MODIFY BY HAND

part of order;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Order> _$orderSerializer = new _$OrderSerializer();

class _$OrderSerializer implements StructuredSerializer<Order> {
  @override
  final Iterable<Type> types = const [Order, _$Order];
  @override
  final String wireName = 'Order';

  @override
  Iterable<Object> serialize(Serializers serializers, Order object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'customerid',
      serializers.serialize(object.customerid,
          specifiedType: const FullType(String)),
      'ordercode',
      serializers.serialize(object.ordercode,
          specifiedType: const FullType(String)),
      'orderdate',
      serializers.serialize(object.orderdate,
          specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'createddate',
      serializers.serialize(object.createddate,
          specifiedType: const FullType(String)),
      'updateddate',
      serializers.serialize(object.updateddate,
          specifiedType: const FullType(String)),
    ];
    if (object.totalItem != null) {
      result
        ..add('total_item')
        ..add(serializers.serialize(object.totalItem,
            specifiedType: const FullType(int)));
    }
    if (object.totalPrice != null) {
      result
        ..add('total_price')
        ..add(serializers.serialize(object.totalPrice,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Order deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customerid':
          result.customerid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ordercode':
          result.ordercode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'orderdate':
          result.orderdate = serializers.deserialize(value,
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
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createddate':
          result.createddate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updateddate':
          result.updateddate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'total_item':
          result.totalItem = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_price':
          result.totalPrice = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Order extends Order {
  @override
  final String id;
  @override
  final String customerid;
  @override
  final String ordercode;
  @override
  final String orderdate;
  @override
  final String phone;
  @override
  final String address;
  @override
  final String status;
  @override
  final String createddate;
  @override
  final String updateddate;
  @override
  final int totalItem;
  @override
  final int totalPrice;

  factory _$Order([void Function(OrderBuilder) updates]) =>
      (new OrderBuilder()..update(updates)).build();

  _$Order._(
      {this.id,
      this.customerid,
      this.ordercode,
      this.orderdate,
      this.phone,
      this.address,
      this.status,
      this.createddate,
      this.updateddate,
      this.totalItem,
      this.totalPrice})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Order', 'id');
    }
    if (customerid == null) {
      throw new BuiltValueNullFieldError('Order', 'customerid');
    }
    if (ordercode == null) {
      throw new BuiltValueNullFieldError('Order', 'ordercode');
    }
    if (orderdate == null) {
      throw new BuiltValueNullFieldError('Order', 'orderdate');
    }
    if (phone == null) {
      throw new BuiltValueNullFieldError('Order', 'phone');
    }
    if (address == null) {
      throw new BuiltValueNullFieldError('Order', 'address');
    }
    if (status == null) {
      throw new BuiltValueNullFieldError('Order', 'status');
    }
    if (createddate == null) {
      throw new BuiltValueNullFieldError('Order', 'createddate');
    }
    if (updateddate == null) {
      throw new BuiltValueNullFieldError('Order', 'updateddate');
    }
  }

  @override
  Order rebuild(void Function(OrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderBuilder toBuilder() => new OrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Order &&
        id == other.id &&
        customerid == other.customerid &&
        ordercode == other.ordercode &&
        orderdate == other.orderdate &&
        phone == other.phone &&
        address == other.address &&
        status == other.status &&
        createddate == other.createddate &&
        updateddate == other.updateddate &&
        totalItem == other.totalItem &&
        totalPrice == other.totalPrice;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, id.hashCode),
                                            customerid.hashCode),
                                        ordercode.hashCode),
                                    orderdate.hashCode),
                                phone.hashCode),
                            address.hashCode),
                        status.hashCode),
                    createddate.hashCode),
                updateddate.hashCode),
            totalItem.hashCode),
        totalPrice.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Order')
          ..add('id', id)
          ..add('customerid', customerid)
          ..add('ordercode', ordercode)
          ..add('orderdate', orderdate)
          ..add('phone', phone)
          ..add('address', address)
          ..add('status', status)
          ..add('createddate', createddate)
          ..add('updateddate', updateddate)
          ..add('totalItem', totalItem)
          ..add('totalPrice', totalPrice))
        .toString();
  }
}

class OrderBuilder implements Builder<Order, OrderBuilder> {
  _$Order _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _customerid;
  String get customerid => _$this._customerid;
  set customerid(String customerid) => _$this._customerid = customerid;

  String _ordercode;
  String get ordercode => _$this._ordercode;
  set ordercode(String ordercode) => _$this._ordercode = ordercode;

  String _orderdate;
  String get orderdate => _$this._orderdate;
  set orderdate(String orderdate) => _$this._orderdate = orderdate;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _createddate;
  String get createddate => _$this._createddate;
  set createddate(String createddate) => _$this._createddate = createddate;

  String _updateddate;
  String get updateddate => _$this._updateddate;
  set updateddate(String updateddate) => _$this._updateddate = updateddate;

  int _totalItem;
  int get totalItem => _$this._totalItem;
  set totalItem(int totalItem) => _$this._totalItem = totalItem;

  int _totalPrice;
  int get totalPrice => _$this._totalPrice;
  set totalPrice(int totalPrice) => _$this._totalPrice = totalPrice;

  OrderBuilder();

  OrderBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _customerid = _$v.customerid;
      _ordercode = _$v.ordercode;
      _orderdate = _$v.orderdate;
      _phone = _$v.phone;
      _address = _$v.address;
      _status = _$v.status;
      _createddate = _$v.createddate;
      _updateddate = _$v.updateddate;
      _totalItem = _$v.totalItem;
      _totalPrice = _$v.totalPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Order other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Order;
  }

  @override
  void update(void Function(OrderBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Order build() {
    final _$result = _$v ??
        new _$Order._(
            id: id,
            customerid: customerid,
            ordercode: ordercode,
            orderdate: orderdate,
            phone: phone,
            address: address,
            status: status,
            createddate: createddate,
            updateddate: updateddate,
            totalItem: totalItem,
            totalPrice: totalPrice);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderAdapter extends TypeAdapter<Order> {
  @override
  final int typeId = 7;

  @override
  Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return (OrderBuilder()
          ..id = fields[0] as String
          ..customerid = fields[1] as String
          ..ordercode = fields[2] as String
          ..orderdate = fields[3] as String
          ..phone = fields[4] as String
          ..address = fields[5] as String
          ..status = fields[6] as String
          ..createddate = fields[7] as String
          ..updateddate = fields[8] as String
          ..totalItem = fields[9] as int
          ..totalPrice = fields[10] as int)
        .build();
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.customerid)
      ..writeByte(2)
      ..write(obj.ordercode)
      ..writeByte(3)
      ..write(obj.orderdate)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.createddate)
      ..writeByte(8)
      ..write(obj.updateddate)
      ..writeByte(9)
      ..write(obj.totalItem)
      ..writeByte(10)
      ..write(obj.totalPrice);
  }
}
