// GENERATED CODE - DO NOT MODIFY BY HAND

part of sub_category;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubCategory> _$subCategorySerializer = new _$SubCategorySerializer();

class _$SubCategorySerializer implements StructuredSerializer<SubCategory> {
  @override
  final Iterable<Type> types = const [SubCategory, _$SubCategory];
  @override
  final String wireName = 'SubCategory';

  @override
  Iterable<Object> serialize(Serializers serializers, SubCategory object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'categoryid',
      serializers.serialize(object.categoryId,
          specifiedType: const FullType(String)),
      'category',
      serializers.serialize(object.category,
          specifiedType: const FullType(String)),
      'sub_category',
      serializers.serialize(object.subCategory,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SubCategory deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubCategoryBuilder();

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
        case 'categoryid':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sub_category':
          result.subCategory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SubCategory extends SubCategory {
  @override
  final String id;
  @override
  final String categoryId;
  @override
  final String category;
  @override
  final String subCategory;

  factory _$SubCategory([void Function(SubCategoryBuilder) updates]) =>
      (new SubCategoryBuilder()..update(updates)).build();

  _$SubCategory._({this.id, this.categoryId, this.category, this.subCategory})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('SubCategory', 'id');
    }
    if (categoryId == null) {
      throw new BuiltValueNullFieldError('SubCategory', 'categoryId');
    }
    if (category == null) {
      throw new BuiltValueNullFieldError('SubCategory', 'category');
    }
    if (subCategory == null) {
      throw new BuiltValueNullFieldError('SubCategory', 'subCategory');
    }
  }

  @override
  SubCategory rebuild(void Function(SubCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubCategoryBuilder toBuilder() => new SubCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubCategory &&
        id == other.id &&
        categoryId == other.categoryId &&
        category == other.category &&
        subCategory == other.subCategory;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), categoryId.hashCode), category.hashCode),
        subCategory.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubCategory')
          ..add('id', id)
          ..add('categoryId', categoryId)
          ..add('category', category)
          ..add('subCategory', subCategory))
        .toString();
  }
}

class SubCategoryBuilder implements Builder<SubCategory, SubCategoryBuilder> {
  _$SubCategory _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _categoryId;
  String get categoryId => _$this._categoryId;
  set categoryId(String categoryId) => _$this._categoryId = categoryId;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  String _subCategory;
  String get subCategory => _$this._subCategory;
  set subCategory(String subCategory) => _$this._subCategory = subCategory;

  SubCategoryBuilder();

  SubCategoryBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _categoryId = _$v.categoryId;
      _category = _$v.category;
      _subCategory = _$v.subCategory;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubCategory other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SubCategory;
  }

  @override
  void update(void Function(SubCategoryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SubCategory build() {
    final _$result = _$v ??
        new _$SubCategory._(
            id: id,
            categoryId: categoryId,
            category: category,
            subCategory: subCategory);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubCategoryAdapter extends TypeAdapter<SubCategory> {
  @override
  final int typeId = 4;

  @override
  SubCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return (SubCategoryBuilder()
          ..id = fields[0] as String
          ..categoryId = fields[1] as String
          ..category = fields[2] as String
          ..subCategory = fields[3] as String)
        .build();
  }

  @override
  void write(BinaryWriter writer, SubCategory obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.categoryId)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.subCategory);
  }
}
