// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'force_update_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ForceUpdateResponse> _$forceUpdateResponseSerializer =
    new _$ForceUpdateResponseSerializer();

class _$ForceUpdateResponseSerializer
    implements StructuredSerializer<ForceUpdateResponse> {
  @override
  final Iterable<Type> types = const [
    ForceUpdateResponse,
    _$ForceUpdateResponse
  ];
  @override
  final String wireName = 'ForceUpdateResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ForceUpdateResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.forceUpdate,
          specifiedType: const FullType(ForceUpdate)),
    ];

    return result;
  }

  @override
  ForceUpdateResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ForceUpdateResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.forceUpdate.replace(serializers.deserialize(value,
              specifiedType: const FullType(ForceUpdate)) as ForceUpdate);
          break;
      }
    }

    return result.build();
  }
}

class _$ForceUpdateResponse extends ForceUpdateResponse {
  @override
  final ForceUpdate forceUpdate;

  factory _$ForceUpdateResponse(
          [void Function(ForceUpdateResponseBuilder) updates]) =>
      (new ForceUpdateResponseBuilder()..update(updates)).build();

  _$ForceUpdateResponse._({this.forceUpdate}) : super._() {
    if (forceUpdate == null) {
      throw new BuiltValueNullFieldError('ForceUpdateResponse', 'forceUpdate');
    }
  }

  @override
  ForceUpdateResponse rebuild(
          void Function(ForceUpdateResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForceUpdateResponseBuilder toBuilder() =>
      new ForceUpdateResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForceUpdateResponse && forceUpdate == other.forceUpdate;
  }

  @override
  int get hashCode {
    return $jf($jc(0, forceUpdate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ForceUpdateResponse')
          ..add('forceUpdate', forceUpdate))
        .toString();
  }
}

class ForceUpdateResponseBuilder
    implements Builder<ForceUpdateResponse, ForceUpdateResponseBuilder> {
  _$ForceUpdateResponse _$v;

  ForceUpdateBuilder _forceUpdate;
  ForceUpdateBuilder get forceUpdate =>
      _$this._forceUpdate ??= new ForceUpdateBuilder();
  set forceUpdate(ForceUpdateBuilder forceUpdate) =>
      _$this._forceUpdate = forceUpdate;

  ForceUpdateResponseBuilder();

  ForceUpdateResponseBuilder get _$this {
    if (_$v != null) {
      _forceUpdate = _$v.forceUpdate?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForceUpdateResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ForceUpdateResponse;
  }

  @override
  void update(void Function(ForceUpdateResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ForceUpdateResponse build() {
    _$ForceUpdateResponse _$result;
    try {
      _$result =
          _$v ?? new _$ForceUpdateResponse._(forceUpdate: forceUpdate.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'forceUpdate';
        forceUpdate.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ForceUpdateResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
