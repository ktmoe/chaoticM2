// GENERATED CODE - DO NOT MODIFY BY HAND

part of company_info;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CompanyInfo> _$companyInfoSerializer = new _$CompanyInfoSerializer();

class _$CompanyInfoSerializer implements StructuredSerializer<CompanyInfo> {
  @override
  final Iterable<Type> types = const [CompanyInfo, _$CompanyInfo];
  @override
  final String wireName = 'CompanyInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, CompanyInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'imageurl',
      serializers.serialize(object.imageurl,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'tax',
      serializers.serialize(object.tax, specifiedType: const FullType(int)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'fburl',
      serializers.serialize(object.fburl,
          specifiedType: const FullType(String)),
      'mapurl',
      serializers.serialize(object.mapurl,
          specifiedType: const FullType(String)),
      'messagerurl',
      serializers.serialize(object.messagerurl,
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
  CompanyInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompanyInfoBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tax':
          result.tax = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fburl':
          result.fburl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mapurl':
          result.mapurl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'messagerurl':
          result.messagerurl = serializers.deserialize(value,
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

class _$CompanyInfo extends CompanyInfo {
  @override
  final String id;
  @override
  final String imageurl;
  @override
  final String description;
  @override
  final String phone;
  @override
  final int tax;
  @override
  final String address;
  @override
  final String fburl;
  @override
  final String mapurl;
  @override
  final String messagerurl;
  @override
  final String createddate;
  @override
  final String updateddate;

  factory _$CompanyInfo([void Function(CompanyInfoBuilder) updates]) =>
      (new CompanyInfoBuilder()..update(updates)).build();

  _$CompanyInfo._(
      {this.id,
      this.imageurl,
      this.description,
      this.phone,
      this.tax,
      this.address,
      this.fburl,
      this.mapurl,
      this.messagerurl,
      this.createddate,
      this.updateddate})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('CompanyInfo', 'id');
    }
    if (imageurl == null) {
      throw new BuiltValueNullFieldError('CompanyInfo', 'imageurl');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('CompanyInfo', 'description');
    }
    if (phone == null) {
      throw new BuiltValueNullFieldError('CompanyInfo', 'phone');
    }
    if (tax == null) {
      throw new BuiltValueNullFieldError('CompanyInfo', 'tax');
    }
    if (address == null) {
      throw new BuiltValueNullFieldError('CompanyInfo', 'address');
    }
    if (fburl == null) {
      throw new BuiltValueNullFieldError('CompanyInfo', 'fburl');
    }
    if (mapurl == null) {
      throw new BuiltValueNullFieldError('CompanyInfo', 'mapurl');
    }
    if (messagerurl == null) {
      throw new BuiltValueNullFieldError('CompanyInfo', 'messagerurl');
    }
    if (createddate == null) {
      throw new BuiltValueNullFieldError('CompanyInfo', 'createddate');
    }
    if (updateddate == null) {
      throw new BuiltValueNullFieldError('CompanyInfo', 'updateddate');
    }
  }

  @override
  CompanyInfo rebuild(void Function(CompanyInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompanyInfoBuilder toBuilder() => new CompanyInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompanyInfo &&
        id == other.id &&
        imageurl == other.imageurl &&
        description == other.description &&
        phone == other.phone &&
        tax == other.tax &&
        address == other.address &&
        fburl == other.fburl &&
        mapurl == other.mapurl &&
        messagerurl == other.messagerurl &&
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
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, id.hashCode),
                                            imageurl.hashCode),
                                        description.hashCode),
                                    phone.hashCode),
                                tax.hashCode),
                            address.hashCode),
                        fburl.hashCode),
                    mapurl.hashCode),
                messagerurl.hashCode),
            createddate.hashCode),
        updateddate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CompanyInfo')
          ..add('id', id)
          ..add('imageurl', imageurl)
          ..add('description', description)
          ..add('phone', phone)
          ..add('tax', tax)
          ..add('address', address)
          ..add('fburl', fburl)
          ..add('mapurl', mapurl)
          ..add('messagerurl', messagerurl)
          ..add('createddate', createddate)
          ..add('updateddate', updateddate))
        .toString();
  }
}

class CompanyInfoBuilder implements Builder<CompanyInfo, CompanyInfoBuilder> {
  _$CompanyInfo _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _imageurl;
  String get imageurl => _$this._imageurl;
  set imageurl(String imageurl) => _$this._imageurl = imageurl;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  int _tax;
  int get tax => _$this._tax;
  set tax(int tax) => _$this._tax = tax;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _fburl;
  String get fburl => _$this._fburl;
  set fburl(String fburl) => _$this._fburl = fburl;

  String _mapurl;
  String get mapurl => _$this._mapurl;
  set mapurl(String mapurl) => _$this._mapurl = mapurl;

  String _messagerurl;
  String get messagerurl => _$this._messagerurl;
  set messagerurl(String messagerurl) => _$this._messagerurl = messagerurl;

  String _createddate;
  String get createddate => _$this._createddate;
  set createddate(String createddate) => _$this._createddate = createddate;

  String _updateddate;
  String get updateddate => _$this._updateddate;
  set updateddate(String updateddate) => _$this._updateddate = updateddate;

  CompanyInfoBuilder();

  CompanyInfoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _imageurl = _$v.imageurl;
      _description = _$v.description;
      _phone = _$v.phone;
      _tax = _$v.tax;
      _address = _$v.address;
      _fburl = _$v.fburl;
      _mapurl = _$v.mapurl;
      _messagerurl = _$v.messagerurl;
      _createddate = _$v.createddate;
      _updateddate = _$v.updateddate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompanyInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CompanyInfo;
  }

  @override
  void update(void Function(CompanyInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CompanyInfo build() {
    final _$result = _$v ??
        new _$CompanyInfo._(
            id: id,
            imageurl: imageurl,
            description: description,
            phone: phone,
            tax: tax,
            address: address,
            fburl: fburl,
            mapurl: mapurl,
            messagerurl: messagerurl,
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

class CompanyInfoAdapter extends TypeAdapter<CompanyInfo> {
  @override
  final int typeId = 2;

  @override
  CompanyInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return (CompanyInfoBuilder()
          ..id = fields[0] as String
          ..imageurl = fields[1] as String
          ..description = fields[2] as String
          ..phone = fields[3] as String
          ..tax = fields[4] as int
          ..address = fields[5] as String
          ..fburl = fields[6] as String
          ..mapurl = fields[7] as String
          ..messagerurl = fields[8] as String
          ..createddate = fields[9] as String
          ..updateddate = fields[10] as String)
        .build();
  }

  @override
  void write(BinaryWriter writer, CompanyInfo obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageurl)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.tax)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.fburl)
      ..writeByte(7)
      ..write(obj.mapurl)
      ..writeByte(8)
      ..write(obj.messagerurl)
      ..writeByte(9)
      ..write(obj.createddate)
      ..writeByte(10)
      ..write(obj.updateddate);
  }
}
