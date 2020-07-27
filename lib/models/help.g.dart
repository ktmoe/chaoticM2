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
      'customerservice_phone',
      serializers.serialize(object.customerservicePhone,
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
        case 'customerservice_phone':
          result.customerservicePhone = serializers.deserialize(value,
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
  final String customerservicePhone;

  factory _$Help([void Function(HelpBuilder) updates]) =>
      (new HelpBuilder()..update(updates)).build();

  _$Help._({this.id, this.customerservicePhone}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Help', 'id');
    }
    if (customerservicePhone == null) {
      throw new BuiltValueNullFieldError('Help', 'customerservicePhone');
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
        customerservicePhone == other.customerservicePhone;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), customerservicePhone.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Help')
          ..add('id', id)
          ..add('customerservicePhone', customerservicePhone))
        .toString();
  }
}

class HelpBuilder implements Builder<Help, HelpBuilder> {
  _$Help _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _customerservicePhone;
  String get customerservicePhone => _$this._customerservicePhone;
  set customerservicePhone(String customerservicePhone) =>
      _$this._customerservicePhone = customerservicePhone;

  HelpBuilder();

  HelpBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _customerservicePhone = _$v.customerservicePhone;
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
    final _$result =
        _$v ?? new _$Help._(id: id, customerservicePhone: customerservicePhone);
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
  final int typeId = 5;

  @override
  Help read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return (HelpBuilder()
          ..id = fields[0] as String
          ..customerservicePhone = fields[1] as String)
        .build();
  }

  @override
  void write(BinaryWriter writer, Help obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.customerservicePhone);
  }
}
