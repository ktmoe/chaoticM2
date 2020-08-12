// GENERATED CODE - DO NOT MODIFY BY HAND

part of delete_favorite_item_payload;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DeleteFavoriteItemPayload> _$deleteFavoriteItemPayloadSerializer =
    new _$DeleteFavoriteItemPayloadSerializer();

class _$DeleteFavoriteItemPayloadSerializer
    implements StructuredSerializer<DeleteFavoriteItemPayload> {
  @override
  final Iterable<Type> types = const [
    DeleteFavoriteItemPayload,
    _$DeleteFavoriteItemPayload
  ];
  @override
  final String wireName = 'DeleteFavoriteItemPayload';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DeleteFavoriteItemPayload object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'favoriteId',
      serializers.serialize(object.favoriteId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DeleteFavoriteItemPayload deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeleteFavoriteItemPayloadBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'favoriteId':
          result.favoriteId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DeleteFavoriteItemPayload extends DeleteFavoriteItemPayload {
  @override
  final String favoriteId;

  factory _$DeleteFavoriteItemPayload(
          [void Function(DeleteFavoriteItemPayloadBuilder) updates]) =>
      (new DeleteFavoriteItemPayloadBuilder()..update(updates)).build();

  _$DeleteFavoriteItemPayload._({this.favoriteId}) : super._() {
    if (favoriteId == null) {
      throw new BuiltValueNullFieldError(
          'DeleteFavoriteItemPayload', 'favoriteId');
    }
  }

  @override
  DeleteFavoriteItemPayload rebuild(
          void Function(DeleteFavoriteItemPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteFavoriteItemPayloadBuilder toBuilder() =>
      new DeleteFavoriteItemPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteFavoriteItemPayload && favoriteId == other.favoriteId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, favoriteId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeleteFavoriteItemPayload')
          ..add('favoriteId', favoriteId))
        .toString();
  }
}

class DeleteFavoriteItemPayloadBuilder
    implements
        Builder<DeleteFavoriteItemPayload, DeleteFavoriteItemPayloadBuilder> {
  _$DeleteFavoriteItemPayload _$v;

  String _favoriteId;
  String get favoriteId => _$this._favoriteId;
  set favoriteId(String favoriteId) => _$this._favoriteId = favoriteId;

  DeleteFavoriteItemPayloadBuilder();

  DeleteFavoriteItemPayloadBuilder get _$this {
    if (_$v != null) {
      _favoriteId = _$v.favoriteId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteFavoriteItemPayload other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DeleteFavoriteItemPayload;
  }

  @override
  void update(void Function(DeleteFavoriteItemPayloadBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeleteFavoriteItemPayload build() {
    final _$result =
        _$v ?? new _$DeleteFavoriteItemPayload._(favoriteId: favoriteId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
