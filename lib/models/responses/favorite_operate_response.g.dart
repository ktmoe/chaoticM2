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
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

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
      }
    }

    return result.build();
  }
}

class _$FavoriteOperateResponse extends FavoriteOperateResponse {
  @override
  final String message;

  factory _$FavoriteOperateResponse(
          [void Function(FavoriteOperateResponseBuilder) updates]) =>
      (new FavoriteOperateResponseBuilder()..update(updates)).build();

  _$FavoriteOperateResponse._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('FavoriteOperateResponse', 'message');
    }
  }

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
    return other is FavoriteOperateResponse && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FavoriteOperateResponse')
          ..add('message', message))
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

  FavoriteOperateResponseBuilder();

  FavoriteOperateResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
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
    final _$result = _$v ?? new _$FavoriteOperateResponse._(message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
