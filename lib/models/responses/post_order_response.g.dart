// GENERATED CODE - DO NOT MODIFY BY HAND

part of post_order_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostOrderResponse> _$postOrderResponseSerializer =
    new _$PostOrderResponseSerializer();

class _$PostOrderResponseSerializer
    implements StructuredSerializer<PostOrderResponse> {
  @override
  final Iterable<Type> types = const [PostOrderResponse, _$PostOrderResponse];
  @override
  final String wireName = 'PostOrderResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, PostOrderResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.wrapper,
          specifiedType: const FullType(PostOrderOrderWrapper)),
    ];

    return result;
  }

  @override
  PostOrderResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostOrderResponseBuilder();

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
          result.wrapper.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PostOrderOrderWrapper))
              as PostOrderOrderWrapper);
          break;
      }
    }

    return result.build();
  }
}

class _$PostOrderResponse extends PostOrderResponse {
  @override
  final String message;
  @override
  final PostOrderOrderWrapper wrapper;

  factory _$PostOrderResponse(
          [void Function(PostOrderResponseBuilder) updates]) =>
      (new PostOrderResponseBuilder()..update(updates)).build();

  _$PostOrderResponse._({this.message, this.wrapper}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('PostOrderResponse', 'message');
    }
    if (wrapper == null) {
      throw new BuiltValueNullFieldError('PostOrderResponse', 'wrapper');
    }
  }

  @override
  PostOrderResponse rebuild(void Function(PostOrderResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostOrderResponseBuilder toBuilder() =>
      new PostOrderResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostOrderResponse &&
        message == other.message &&
        wrapper == other.wrapper;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), wrapper.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostOrderResponse')
          ..add('message', message)
          ..add('wrapper', wrapper))
        .toString();
  }
}

class PostOrderResponseBuilder
    implements Builder<PostOrderResponse, PostOrderResponseBuilder> {
  _$PostOrderResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  PostOrderOrderWrapperBuilder _wrapper;
  PostOrderOrderWrapperBuilder get wrapper =>
      _$this._wrapper ??= new PostOrderOrderWrapperBuilder();
  set wrapper(PostOrderOrderWrapperBuilder wrapper) =>
      _$this._wrapper = wrapper;

  PostOrderResponseBuilder();

  PostOrderResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _wrapper = _$v.wrapper?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostOrderResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostOrderResponse;
  }

  @override
  void update(void Function(PostOrderResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostOrderResponse build() {
    _$PostOrderResponse _$result;
    try {
      _$result = _$v ??
          new _$PostOrderResponse._(message: message, wrapper: wrapper.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'wrapper';
        wrapper.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PostOrderResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
