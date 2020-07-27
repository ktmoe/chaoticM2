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
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'imageurl',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
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
          result.image = serializers.deserialize(value,
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
      }
    }

    return result.build();
  }
}

class _$UserProfile extends UserProfile {
  @override
  final String id;
  @override
  final String image;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String address;

  factory _$UserProfile([void Function(UserProfileBuilder) updates]) =>
      (new UserProfileBuilder()..update(updates)).build();

  _$UserProfile._({this.id, this.image, this.name, this.phone, this.address})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'id');
    }
    if (image == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'image');
    }
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
        image == other.image &&
        name == other.name &&
        phone == other.phone &&
        address == other.address;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), image.hashCode), name.hashCode),
            phone.hashCode),
        address.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserProfile')
          ..add('id', id)
          ..add('image', image)
          ..add('name', name)
          ..add('phone', phone)
          ..add('address', address))
        .toString();
  }
}

class UserProfileBuilder implements Builder<UserProfile, UserProfileBuilder> {
  _$UserProfile _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  UserProfileBuilder();

  UserProfileBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _image = _$v.image;
      _name = _$v.name;
      _phone = _$v.phone;
      _address = _$v.address;
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
            id: id, image: image, name: name, phone: phone, address: address);
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
          ..image = fields[1] as String
          ..name = fields[2] as String
          ..phone = fields[3] as String
          ..address = fields[4] as String)
        .build();
  }

  @override
  void write(BinaryWriter writer, UserProfile obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.address);
  }
}
