// GENERATED CODE - DO NOT MODIFY BY HAND

part of bank_account;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BankAccount> _$bankAccountSerializer = new _$BankAccountSerializer();

class _$BankAccountSerializer implements StructuredSerializer<BankAccount> {
  @override
  final Iterable<Type> types = const [BankAccount, _$BankAccount];
  @override
  final String wireName = 'BankAccount';

  @override
  Iterable<Object> serialize(Serializers serializers, BankAccount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'bank',
      serializers.serialize(object.bank, specifiedType: const FullType(String)),
      'account',
      serializers.serialize(object.account,
          specifiedType: const FullType(String)),
      'ownername',
      serializers.serialize(object.ownername,
          specifiedType: const FullType(String)),
      'logo',
      serializers.serialize(object.logo, specifiedType: const FullType(String)),
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
  BankAccount deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BankAccountBuilder();

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
        case 'bank':
          result.bank = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'account':
          result.account = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ownername':
          result.ownername = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value,
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

class _$BankAccount extends BankAccount {
  @override
  final String id;
  @override
  final String bank;
  @override
  final String account;
  @override
  final String ownername;
  @override
  final String logo;
  @override
  final String createddate;
  @override
  final String updateddate;

  factory _$BankAccount([void Function(BankAccountBuilder) updates]) =>
      (new BankAccountBuilder()..update(updates)).build();

  _$BankAccount._(
      {this.id,
      this.bank,
      this.account,
      this.ownername,
      this.logo,
      this.createddate,
      this.updateddate})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('BankAccount', 'id');
    }
    if (bank == null) {
      throw new BuiltValueNullFieldError('BankAccount', 'bank');
    }
    if (account == null) {
      throw new BuiltValueNullFieldError('BankAccount', 'account');
    }
    if (ownername == null) {
      throw new BuiltValueNullFieldError('BankAccount', 'ownername');
    }
    if (logo == null) {
      throw new BuiltValueNullFieldError('BankAccount', 'logo');
    }
    if (createddate == null) {
      throw new BuiltValueNullFieldError('BankAccount', 'createddate');
    }
    if (updateddate == null) {
      throw new BuiltValueNullFieldError('BankAccount', 'updateddate');
    }
  }

  @override
  BankAccount rebuild(void Function(BankAccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BankAccountBuilder toBuilder() => new BankAccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BankAccount &&
        id == other.id &&
        bank == other.bank &&
        account == other.account &&
        ownername == other.ownername &&
        logo == other.logo &&
        createddate == other.createddate &&
        updateddate == other.updateddate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), bank.hashCode),
                        account.hashCode),
                    ownername.hashCode),
                logo.hashCode),
            createddate.hashCode),
        updateddate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BankAccount')
          ..add('id', id)
          ..add('bank', bank)
          ..add('account', account)
          ..add('ownername', ownername)
          ..add('logo', logo)
          ..add('createddate', createddate)
          ..add('updateddate', updateddate))
        .toString();
  }
}

class BankAccountBuilder implements Builder<BankAccount, BankAccountBuilder> {
  _$BankAccount _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _bank;
  String get bank => _$this._bank;
  set bank(String bank) => _$this._bank = bank;

  String _account;
  String get account => _$this._account;
  set account(String account) => _$this._account = account;

  String _ownername;
  String get ownername => _$this._ownername;
  set ownername(String ownername) => _$this._ownername = ownername;

  String _logo;
  String get logo => _$this._logo;
  set logo(String logo) => _$this._logo = logo;

  String _createddate;
  String get createddate => _$this._createddate;
  set createddate(String createddate) => _$this._createddate = createddate;

  String _updateddate;
  String get updateddate => _$this._updateddate;
  set updateddate(String updateddate) => _$this._updateddate = updateddate;

  BankAccountBuilder();

  BankAccountBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _bank = _$v.bank;
      _account = _$v.account;
      _ownername = _$v.ownername;
      _logo = _$v.logo;
      _createddate = _$v.createddate;
      _updateddate = _$v.updateddate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BankAccount other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BankAccount;
  }

  @override
  void update(void Function(BankAccountBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BankAccount build() {
    final _$result = _$v ??
        new _$BankAccount._(
            id: id,
            bank: bank,
            account: account,
            ownername: ownername,
            logo: logo,
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

class BankAccountAdapter extends TypeAdapter<BankAccount> {
  @override
  final int typeId = 8;

  @override
  BankAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return (BankAccountBuilder()
          ..id = fields[0] as String
          ..bank = fields[1] as String
          ..account = fields[2] as String
          ..ownername = fields[3] as String
          ..logo = fields[4] as String
          ..createddate = fields[5] as String
          ..updateddate = fields[6] as String)
        .build();
  }

  @override
  void write(BinaryWriter writer, BankAccount obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.bank)
      ..writeByte(2)
      ..write(obj.account)
      ..writeByte(3)
      ..write(obj.ownername)
      ..writeByte(4)
      ..write(obj.logo)
      ..writeByte(5)
      ..write(obj.createddate)
      ..writeByte(6)
      ..write(obj.updateddate);
  }
}
