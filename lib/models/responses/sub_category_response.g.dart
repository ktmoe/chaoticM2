// GENERATED CODE - DO NOT MODIFY BY HAND

part of sub_categories_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubCategoryResponse> _$subCategoryResponseSerializer =
    new _$SubCategoryResponseSerializer();

class _$SubCategoryResponseSerializer
    implements StructuredSerializer<SubCategoryResponse> {
  @override
  final Iterable<Type> types = const [
    SubCategoryResponse,
    _$SubCategoryResponse
  ];
  @override
  final String wireName = 'SubCategoryResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SubCategoryResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.subCategory,
          specifiedType:
              const FullType(BuiltList, const [const FullType(SubCategory)])),
    ];

    return result;
  }

  @override
  SubCategoryResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubCategoryResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'data':
          result.subCategory.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SubCategory)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$SubCategoryResponse extends SubCategoryResponse {
  @override
  final String message;
  @override
  final BuiltList<SubCategory> subCategory;

  factory _$SubCategoryResponse(
          [void Function(SubCategoryResponseBuilder) updates]) =>
      (new SubCategoryResponseBuilder()..update(updates)).build();

  _$SubCategoryResponse._({this.message, this.subCategory}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('SubCategoryResponse', 'message');
    }
    if (subCategory == null) {
      throw new BuiltValueNullFieldError('SubCategoryResponse', 'subCategory');
    }
  }

  @override
  SubCategoryResponse rebuild(
          void Function(SubCategoryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubCategoryResponseBuilder toBuilder() =>
      new SubCategoryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubCategoryResponse &&
        message == other.message &&
        subCategory == other.subCategory;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), subCategory.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubCategoryResponse')
          ..add('message', message)
          ..add('subCategory', subCategory))
        .toString();
  }
}

class SubCategoryResponseBuilder
    implements Builder<SubCategoryResponse, SubCategoryResponseBuilder> {
  _$SubCategoryResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ListBuilder<SubCategory> _subCategory;
  ListBuilder<SubCategory> get subCategory =>
      _$this._subCategory ??= new ListBuilder<SubCategory>();
  set subCategory(ListBuilder<SubCategory> subCategory) =>
      _$this._subCategory = subCategory;

  SubCategoryResponseBuilder();

  SubCategoryResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _subCategory = _$v.subCategory?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubCategoryResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SubCategoryResponse;
  }

  @override
  void update(void Function(SubCategoryResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SubCategoryResponse build() {
    _$SubCategoryResponse _$result;
    try {
      _$result = _$v ??
          new _$SubCategoryResponse._(
              message: message, subCategory: subCategory.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'subCategory';
        subCategory.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SubCategoryResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
