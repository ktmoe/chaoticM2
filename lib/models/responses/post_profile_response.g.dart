// GENERATED CODE - DO NOT MODIFY BY HAND

part of post_profile_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostProfileResponse> _$postProfileResponseSerializer =
    new _$PostProfileResponseSerializer();

class _$PostProfileResponseSerializer
    implements StructuredSerializer<PostProfileResponse> {
  @override
  final Iterable<Type> types = const [
    PostProfileResponse,
    _$PostProfileResponse
  ];
  @override
  final String wireName = 'PostProfileResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PostProfileResponse object,
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
            specifiedType: const FullType(UserProfile)));
    }
    return result;
  }

  @override
  PostProfileResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostProfileResponseBuilder();

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
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserProfile)) as UserProfile);
          break;
      }
    }

    return result.build();
  }
}

class _$PostProfileResponse extends PostProfileResponse {
  @override
  final String message;
  @override
  final UserProfile data;

  factory _$PostProfileResponse(
          [void Function(PostProfileResponseBuilder) updates]) =>
      (new PostProfileResponseBuilder()..update(updates)).build();

  _$PostProfileResponse._({this.message, this.data}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('PostProfileResponse', 'message');
    }
  }

  @override
  PostProfileResponse rebuild(
          void Function(PostProfileResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostProfileResponseBuilder toBuilder() =>
      new PostProfileResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostProfileResponse &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostProfileResponse')
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class PostProfileResponseBuilder
    implements Builder<PostProfileResponse, PostProfileResponseBuilder> {
  _$PostProfileResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  UserProfileBuilder _data;
  UserProfileBuilder get data => _$this._data ??= new UserProfileBuilder();
  set data(UserProfileBuilder data) => _$this._data = data;

  PostProfileResponseBuilder();

  PostProfileResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostProfileResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostProfileResponse;
  }

  @override
  void update(void Function(PostProfileResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostProfileResponse build() {
    _$PostProfileResponse _$result;
    try {
      _$result = _$v ??
          new _$PostProfileResponse._(message: message, data: _data?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PostProfileResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
