// GENERATED CODE - DO NOT MODIFY BY HAND

part of post_order_order_wrapper;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostOrderOrderWrapper> _$postOrderOrderWrapperSerializer =
    new _$PostOrderOrderWrapperSerializer();

class _$PostOrderOrderWrapperSerializer
    implements StructuredSerializer<PostOrderOrderWrapper> {
  @override
  final Iterable<Type> types = const [
    PostOrderOrderWrapper,
    _$PostOrderOrderWrapper
  ];
  @override
  final String wireName = 'PostOrderOrderWrapper';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PostOrderOrderWrapper object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'order',
      serializers.serialize(object.order, specifiedType: const FullType(Order)),
    ];

    return result;
  }

  @override
  PostOrderOrderWrapper deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostOrderOrderWrapperBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'order':
          result.order.replace(serializers.deserialize(value,
              specifiedType: const FullType(Order)) as Order);
          break;
      }
    }

    return result.build();
  }
}

class _$PostOrderOrderWrapper extends PostOrderOrderWrapper {
  @override
  final Order order;

  factory _$PostOrderOrderWrapper(
          [void Function(PostOrderOrderWrapperBuilder) updates]) =>
      (new PostOrderOrderWrapperBuilder()..update(updates)).build();

  _$PostOrderOrderWrapper._({this.order}) : super._() {
    if (order == null) {
      throw new BuiltValueNullFieldError('PostOrderOrderWrapper', 'order');
    }
  }

  @override
  PostOrderOrderWrapper rebuild(
          void Function(PostOrderOrderWrapperBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostOrderOrderWrapperBuilder toBuilder() =>
      new PostOrderOrderWrapperBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostOrderOrderWrapper && order == other.order;
  }

  @override
  int get hashCode {
    return $jf($jc(0, order.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostOrderOrderWrapper')
          ..add('order', order))
        .toString();
  }
}

class PostOrderOrderWrapperBuilder
    implements Builder<PostOrderOrderWrapper, PostOrderOrderWrapperBuilder> {
  _$PostOrderOrderWrapper _$v;

  OrderBuilder _order;
  OrderBuilder get order => _$this._order ??= new OrderBuilder();
  set order(OrderBuilder order) => _$this._order = order;

  PostOrderOrderWrapperBuilder();

  PostOrderOrderWrapperBuilder get _$this {
    if (_$v != null) {
      _order = _$v.order?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostOrderOrderWrapper other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostOrderOrderWrapper;
  }

  @override
  void update(void Function(PostOrderOrderWrapperBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostOrderOrderWrapper build() {
    _$PostOrderOrderWrapper _$result;
    try {
      _$result = _$v ?? new _$PostOrderOrderWrapper._(order: order.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'order';
        order.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PostOrderOrderWrapper', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
