// GENERATED CODE - DO NOT MODIFY BY HAND

part of m2_category;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<M2Category> _$m2CategorySerializer = new _$M2CategorySerializer();

class _$M2CategorySerializer implements StructuredSerializer<M2Category> {
  @override
  final Iterable<Type> types = const [M2Category, _$M2Category];
  @override
  final String wireName = 'M2Category';

  @override
  Iterable<Object> serialize(Serializers serializers, M2Category object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'category',
      serializers.serialize(object.category,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  M2Category deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new M2CategoryBuilder();

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
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$M2Category extends M2Category {
  @override
  final String id;
  @override
  final String category;

  factory _$M2Category([void Function(M2CategoryBuilder) updates]) =>
      (new M2CategoryBuilder()..update(updates)).build();

  _$M2Category._({this.id, this.category}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('M2Category', 'id');
    }
    if (category == null) {
      throw new BuiltValueNullFieldError('M2Category', 'category');
    }
  }

  @override
  M2Category rebuild(void Function(M2CategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  M2CategoryBuilder toBuilder() => new M2CategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is M2Category && id == other.id && category == other.category;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), category.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('M2Category')
          ..add('id', id)
          ..add('category', category))
        .toString();
  }
}

class M2CategoryBuilder implements Builder<M2Category, M2CategoryBuilder> {
  _$M2Category _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  M2CategoryBuilder();

  M2CategoryBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _category = _$v.category;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(M2Category other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$M2Category;
  }

  @override
  void update(void Function(M2CategoryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$M2Category build() {
    final _$result = _$v ?? new _$M2Category._(id: id, category: category);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class M2CategoryAdapter extends TypeAdapter<M2Category> {
  @override
  final int typeId = 3;

  @override
  M2Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return (M2CategoryBuilder()
          ..id = fields[0] as String
          ..category = fields[1] as String)
        .build();
  }

  @override
  void write(BinaryWriter writer, M2Category obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category);
  }
}
