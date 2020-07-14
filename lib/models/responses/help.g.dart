// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Help> _$helpSerializer = new _$HelpSerializer();

class _$HelpSerializer implements StructuredSerializer<Help> {
  @override
  final Iterable<Type> types = const [Help, _$Help];
  @override
  final String wireName = 'Help';

  @override
  Iterable<Object> serialize(Serializers serializers, Help object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'wholesale_phone',
      serializers.serialize(object.wholesalePhone,
          specifiedType: const FullType(String)),
      'customerservice_phone',
      serializers.serialize(object.customerservicePhone,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'createddate',
      serializers.serialize(object.createddate,
          specifiedType: const FullType(String)),
      'updateddate',
      serializers.serialize(object.updateddate,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Help deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HelpBuilder();

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
        case 'wholesale_phone':
          result.wholesalePhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customerservice_phone':
          result.customerservicePhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
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
      }
    }

    return result.build();
  }
}

class _$Help extends Help {
  @override
  final String id;
  @override
  final String wholesalePhone;
  @override
  final String customerservicePhone;
  @override
  final String description;
  @override
  final String createddate;
  @override
  final String updateddate;

  factory _$Help([void Function(HelpBuilder) updates]) =>
      (new HelpBuilder()..update(updates)).build();

  _$Help._(
      {this.id,
      this.wholesalePhone,
      this.customerservicePhone,
      this.description,
      this.createddate,
      this.updateddate})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Help', 'id');
    }
    if (wholesalePhone == null) {
      throw new BuiltValueNullFieldError('Help', 'wholesalePhone');
    }
    if (customerservicePhone == null) {
      throw new BuiltValueNullFieldError('Help', 'customerservicePhone');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('Help', 'description');
    }
    if (createddate == null) {
      throw new BuiltValueNullFieldError('Help', 'createddate');
    }
    if (updateddate == null) {
      throw new BuiltValueNullFieldError('Help', 'updateddate');
    }
  }

  @override
  Help rebuild(void Function(HelpBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HelpBuilder toBuilder() => new HelpBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Help &&
        id == other.id &&
        wholesalePhone == other.wholesalePhone &&
        customerservicePhone == other.customerservicePhone &&
        description == other.description &&
        createddate == other.createddate &&
        updateddate == other.updateddate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), wholesalePhone.hashCode),
                    customerservicePhone.hashCode),
                description.hashCode),
            createddate.hashCode),
        updateddate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Help')
          ..add('id', id)
          ..add('wholesalePhone', wholesalePhone)
          ..add('customerservicePhone', customerservicePhone)
          ..add('description', description)
          ..add('createddate', createddate)
          ..add('updateddate', updateddate))
        .toString();
  }
}

class HelpBuilder implements Builder<Help, HelpBuilder> {
  _$Help _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _wholesalePhone;
  String get wholesalePhone => _$this._wholesalePhone;
  set wholesalePhone(String wholesalePhone) =>
      _$this._wholesalePhone = wholesalePhone;

  String _customerservicePhone;
  String get customerservicePhone => _$this._customerservicePhone;
  set customerservicePhone(String customerservicePhone) =>
      _$this._customerservicePhone = customerservicePhone;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _createddate;
  String get createddate => _$this._createddate;
  set createddate(String createddate) => _$this._createddate = createddate;

  String _updateddate;
  String get updateddate => _$this._updateddate;
  set updateddate(String updateddate) => _$this._updateddate = updateddate;

  HelpBuilder();

  HelpBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _wholesalePhone = _$v.wholesalePhone;
      _customerservicePhone = _$v.customerservicePhone;
      _description = _$v.description;
      _createddate = _$v.createddate;
      _updateddate = _$v.updateddate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Help other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Help;
  }

  @override
  void update(void Function(HelpBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Help build() {
    final _$result = _$v ??
        new _$Help._(
            id: id,
            wholesalePhone: wholesalePhone,
            customerservicePhone: customerservicePhone,
            description: description,
            createddate: createddate,
            updateddate: updateddate);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HelpAdapter extends TypeAdapter<Help> {
  @override
  final int typeId = 3;

  @override
  Help read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return (HelpBuilder()
          ..id = fields[0] as String
          ..wholesalePhone = fields[1] as String
          ..customerservicePhone = fields[2] as String
          ..description = fields[3] as String
          ..createddate = fields[4] as String
          ..updateddate = fields[5] as String)
        .build();
  }

  @override
  void write(BinaryWriter writer, Help obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.wholesalePhone)
      ..writeByte(2)
      ..write(obj.customerservicePhone)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.createddate)
      ..writeByte(5)
      ..write(obj.updateddate);
  }
}
