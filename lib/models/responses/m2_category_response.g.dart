// GENERATED CODE - DO NOT MODIFY BY HAND

part of m2_category_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<M2CategoryResponse> _$m2CategoryResponseSerializer =
    new _$M2CategoryResponseSerializer();

class _$M2CategoryResponseSerializer
    implements StructuredSerializer<M2CategoryResponse> {
  @override
  final Iterable<Type> types = const [M2CategoryResponse, _$M2CategoryResponse];
  @override
  final String wireName = 'M2CategoryResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, M2CategoryResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.m2Category,
          specifiedType:
              const FullType(BuiltList, const [const FullType(M2Category)])),
    ];

    return result;
  }

  @override
  M2CategoryResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new M2CategoryResponseBuilder();

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
          result.m2Category.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(M2Category)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$M2CategoryResponse extends M2CategoryResponse {
  @override
  final String message;
  @override
  final BuiltList<M2Category> m2Category;

  factory _$M2CategoryResponse(
          [void Function(M2CategoryResponseBuilder) updates]) =>
      (new M2CategoryResponseBuilder()..update(updates)).build();

  _$M2CategoryResponse._({this.message, this.m2Category}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('M2CategoryResponse', 'message');
    }
    if (m2Category == null) {
      throw new BuiltValueNullFieldError('M2CategoryResponse', 'm2Category');
    }
  }

  @override
  M2CategoryResponse rebuild(
          void Function(M2CategoryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  M2CategoryResponseBuilder toBuilder() =>
      new M2CategoryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is M2CategoryResponse &&
        message == other.message &&
        m2Category == other.m2Category;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), m2Category.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('M2CategoryResponse')
          ..add('message', message)
          ..add('m2Category', m2Category))
        .toString();
  }
}

class M2CategoryResponseBuilder
    implements Builder<M2CategoryResponse, M2CategoryResponseBuilder> {
  _$M2CategoryResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ListBuilder<M2Category> _m2Category;
  ListBuilder<M2Category> get m2Category =>
      _$this._m2Category ??= new ListBuilder<M2Category>();
  set m2Category(ListBuilder<M2Category> m2Category) =>
      _$this._m2Category = m2Category;

  M2CategoryResponseBuilder();

  M2CategoryResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _m2Category = _$v.m2Category?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(M2CategoryResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$M2CategoryResponse;
  }

  @override
  void update(void Function(M2CategoryResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$M2CategoryResponse build() {
    _$M2CategoryResponse _$result;
    try {
      _$result = _$v ??
          new _$M2CategoryResponse._(
              message: message, m2Category: m2Category.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'm2Category';
        m2Category.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'M2CategoryResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
