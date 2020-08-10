// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_profile;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserProfile> _$userProfileSerializer = new _$UserProfileSerializer();

class _$UserProfileSerializer implements StructuredSerializer<UserProfile> {
  @override
  final Iterable<Type> types = const [UserProfile, _$UserProfile];
  @override
  final String wireName = 'UserProfile';

  @override
  Iterable<Object> serialize(Serializers serializers, UserProfile object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.imageurl != null) {
      result
        ..add('imageurl')
        ..add(serializers.serialize(object.imageurl,
            specifiedType: const FullType(String)));
    }
    if (object.password != null) {
      result
        ..add('password')
        ..add(serializers.serialize(object.password,
            specifiedType: const FullType(String)));
    }
    if (object.createddate != null) {
      result
        ..add('createddate')
        ..add(serializers.serialize(object.createddate,
            specifiedType: const FullType(String)));
    }
    if (object.updateddate != null) {
      result
        ..add('updateddate')
        ..add(serializers.serialize(object.updateddate,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserProfile deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserProfileBuilder();

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
        case 'imageurl':
          result.imageurl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
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
        case 'password':
          result.password = serializers.deserialize(value,
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

class _$UserProfile extends UserProfile {
  @override
  final String id;
  @override
  final String imageurl;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String address;
  @override
  final String password;
  @override
  final String createddate;
  @override
  final String updateddate;

  factory _$UserProfile([void Function(UserProfileBuilder) updates]) =>
      (new UserProfileBuilder()..update(updates)).build();

  _$UserProfile._(
      {this.id,
      this.imageurl,
      this.name,
      this.phone,
      this.address,
      this.password,
      this.createddate,
      this.updateddate})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'name');
    }
    if (phone == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'phone');
    }
    if (address == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'address');
    }
  }

  @override
  UserProfile rebuild(void Function(UserProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserProfileBuilder toBuilder() => new UserProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProfile &&
        id == other.id &&
        imageurl == other.imageurl &&
        name == other.name &&
        phone == other.phone &&
        address == other.address &&
        password == other.password &&
        createddate == other.createddate &&
        updateddate == other.updateddate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), imageurl.hashCode),
                            name.hashCode),
                        phone.hashCode),
                    address.hashCode),
                password.hashCode),
            createddate.hashCode),
        updateddate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserProfile')
          ..add('id', id)
          ..add('imageurl', imageurl)
          ..add('name', name)
          ..add('phone', phone)
          ..add('address', address)
          ..add('password', password)
          ..add('createddate', createddate)
          ..add('updateddate', updateddate))
        .toString();
  }
}

class UserProfileBuilder implements Builder<UserProfile, UserProfileBuilder> {
  _$UserProfile _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _imageurl;
  String get imageurl => _$this._imageurl;
  set imageurl(String imageurl) => _$this._imageurl = imageurl;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _createddate;
  String get createddate => _$this._createddate;
  set createddate(String createddate) => _$this._createddate = createddate;

  String _updateddate;
  String get updateddate => _$this._updateddate;
  set updateddate(String updateddate) => _$this._updateddate = updateddate;

  UserProfileBuilder();

  UserProfileBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _imageurl = _$v.imageurl;
      _name = _$v.name;
      _phone = _$v.phone;
      _address = _$v.address;
      _password = _$v.password;
      _createddate = _$v.createddate;
      _updateddate = _$v.updateddate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserProfile other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserProfile;
  }

  @override
  void update(void Function(UserProfileBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserProfile build() {
    final _$result = _$v ??
        new _$UserProfile._(
            id: id,
            imageurl: imageurl,
            name: name,
            phone: phone,
            address: address,
            password: password,
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

class UserProfileAdapter extends TypeAdapter<UserProfile> {
  @override
  final int typeId = 0;

  @override
  UserProfile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return (UserProfileBuilder()
          ..id = fields[0] as String
          ..imageurl = fields[1] as String
          ..name = fields[2] as String
          ..phone = fields[3] as String
          ..address = fields[4] as String
          ..password = fields[5] as String
          ..createddate = fields[6] as String
          ..updateddate = fields[7] as String)
        .build();
  }

  @override
  void write(BinaryWriter writer, UserProfile obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageurl)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.password)
      ..writeByte(6)
      ..write(obj.createddate)
      ..writeByte(7)
      ..write(obj.updateddate);
  }
}
