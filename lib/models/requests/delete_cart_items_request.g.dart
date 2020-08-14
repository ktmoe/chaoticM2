// GENERATED CODE - DO NOT MODIFY BY HAND

part of delete_cart_list_request;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DeleteCartListRequest> _$deleteCartListRequestSerializer =
    new _$DeleteCartListRequestSerializer();

class _$DeleteCartListRequestSerializer
    implements StructuredSerializer<DeleteCartListRequest> {
  @override
  final Iterable<Type> types = const [
    DeleteCartListRequest,
    _$DeleteCartListRequest
  ];
  @override
  final String wireName = 'DeleteCartListRequest';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DeleteCartListRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'cartIdList',
      serializers.serialize(object.cartIdList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  DeleteCartListRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeleteCartListRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'cartIdList':
          result.cartIdList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$DeleteCartListRequest extends DeleteCartListRequest {
  @override
  final BuiltList<String> cartIdList;

  factory _$DeleteCartListRequest(
          [void Function(DeleteCartListRequestBuilder) updates]) =>
      (new DeleteCartListRequestBuilder()..update(updates)).build();

  _$DeleteCartListRequest._({this.cartIdList}) : super._() {
    if (cartIdList == null) {
      throw new BuiltValueNullFieldError('DeleteCartListRequest', 'cartIdList');
    }
  }

  @override
  DeleteCartListRequest rebuild(
          void Function(DeleteCartListRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteCartListRequestBuilder toBuilder() =>
      new DeleteCartListRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteCartListRequest && cartIdList == other.cartIdList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, cartIdList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeleteCartListRequest')
          ..add('cartIdList', cartIdList))
        .toString();
  }
}

class DeleteCartListRequestBuilder
    implements Builder<DeleteCartListRequest, DeleteCartListRequestBuilder> {
  _$DeleteCartListRequest _$v;

  ListBuilder<String> _cartIdList;
  ListBuilder<String> get cartIdList =>
      _$this._cartIdList ??= new ListBuilder<String>();
  set cartIdList(ListBuilder<String> cartIdList) =>
      _$this._cartIdList = cartIdList;

  DeleteCartListRequestBuilder();

  DeleteCartListRequestBuilder get _$this {
    if (_$v != null) {
      _cartIdList = _$v.cartIdList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteCartListRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DeleteCartListRequest;
  }

  @override
  void update(void Function(DeleteCartListRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeleteCartListRequest build() {
    _$DeleteCartListRequest _$result;
    try {
      _$result =
          _$v ?? new _$DeleteCartListRequest._(cartIdList: cartIdList.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'cartIdList';
        cartIdList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DeleteCartListRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
