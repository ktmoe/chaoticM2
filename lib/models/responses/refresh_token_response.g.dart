// GENERATED CODE - DO NOT MODIFY BY HAND

part of refresh_token_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RefreshTokenResponse> _$refreshTokenResponseSerializer =
    new _$RefreshTokenResponseSerializer();

class _$RefreshTokenResponseSerializer
    implements StructuredSerializer<RefreshTokenResponse> {
  @override
  final Iterable<Type> types = const [
    RefreshTokenResponse,
    _$RefreshTokenResponse
  ];
  @override
  final String wireName = 'RefreshTokenResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, RefreshTokenResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];
    if (object.data != null) {
      result
        ..add('data')
        ..add(serializers.serialize(object.data,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RefreshTokenResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RefreshTokenResponseBuilder();

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
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RefreshTokenResponse extends RefreshTokenResponse {
  @override
  final String message;
  @override
  final String data;

  factory _$RefreshTokenResponse(
          [void Function(RefreshTokenResponseBuilder) updates]) =>
      (new RefreshTokenResponseBuilder()..update(updates)).build();

  _$RefreshTokenResponse._({this.message, this.data}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('RefreshTokenResponse', 'message');
    }
  }

  @override
  RefreshTokenResponse rebuild(
          void Function(RefreshTokenResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefreshTokenResponseBuilder toBuilder() =>
      new RefreshTokenResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefreshTokenResponse &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RefreshTokenResponse')
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class RefreshTokenResponseBuilder
    implements Builder<RefreshTokenResponse, RefreshTokenResponseBuilder> {
  _$RefreshTokenResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _data;
  String get data => _$this._data;
  set data(String data) => _$this._data = data;

  RefreshTokenResponseBuilder();

  RefreshTokenResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _data = _$v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RefreshTokenResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RefreshTokenResponse;
  }

  @override
  void update(void Function(RefreshTokenResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RefreshTokenResponse build() {
    final _$result =
        _$v ?? new _$RefreshTokenResponse._(message: message, data: data);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
