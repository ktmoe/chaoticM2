// GENERATED CODE - DO NOT MODIFY BY HAND

part of favorite_operate_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FavoriteOperateResponse> _$favoriteOperateResponseSerializer =
    new _$FavoriteOperateResponseSerializer();

class _$FavoriteOperateResponseSerializer
    implements StructuredSerializer<FavoriteOperateResponse> {
  @override
  final Iterable<Type> types = const [
    FavoriteOperateResponse,
    _$FavoriteOperateResponse
  ];
  @override
  final String wireName = 'FavoriteOperateResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, FavoriteOperateResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }
    if (object.favoriteId != null) {
      result
        ..add('data')
        ..add(serializers.serialize(object.favoriteId,
            specifiedType:
                const FullType(BuiltList, const [const FullType(FavoriteId)])));
    }
    return result;
  }

  @override
  FavoriteOperateResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FavoriteOperateResponseBuilder();

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
          result.favoriteId.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(FavoriteId)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$FavoriteOperateResponse extends FavoriteOperateResponse {
  @override
  final String message;
  @override
  final BuiltList<FavoriteId> favoriteId;

  factory _$FavoriteOperateResponse(
          [void Function(FavoriteOperateResponseBuilder) updates]) =>
      (new FavoriteOperateResponseBuilder()..update(updates)).build();

  _$FavoriteOperateResponse._({this.message, this.favoriteId}) : super._();

  @override
  FavoriteOperateResponse rebuild(
          void Function(FavoriteOperateResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FavoriteOperateResponseBuilder toBuilder() =>
      new FavoriteOperateResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FavoriteOperateResponse &&
        message == other.message &&
        favoriteId == other.favoriteId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), favoriteId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FavoriteOperateResponse')
          ..add('message', message)
          ..add('favoriteId', favoriteId))
        .toString();
  }
}

class FavoriteOperateResponseBuilder
    implements
        Builder<FavoriteOperateResponse, FavoriteOperateResponseBuilder> {
  _$FavoriteOperateResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ListBuilder<FavoriteId> _favoriteId;
  ListBuilder<FavoriteId> get favoriteId =>
      _$this._favoriteId ??= new ListBuilder<FavoriteId>();
  set favoriteId(ListBuilder<FavoriteId> favoriteId) =>
      _$this._favoriteId = favoriteId;

  FavoriteOperateResponseBuilder();

  FavoriteOperateResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _favoriteId = _$v.favoriteId?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FavoriteOperateResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FavoriteOperateResponse;
  }

  @override
  void update(void Function(FavoriteOperateResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FavoriteOperateResponse build() {
    _$FavoriteOperateResponse _$result;
    try {
      _$result = _$v ??
          new _$FavoriteOperateResponse._(
              message: message, favoriteId: _favoriteId?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'favoriteId';
        _favoriteId?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FavoriteOperateResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
