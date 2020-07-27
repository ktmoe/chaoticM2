// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'force_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ForceUpdate> _$forceUpdateSerializer = new _$ForceUpdateSerializer();

class _$ForceUpdateSerializer implements StructuredSerializer<ForceUpdate> {
  @override
  final Iterable<Type> types = const [ForceUpdate, _$ForceUpdate];
  @override
  final String wireName = 'ForceUpdate';

  @override
  Iterable<Object> serialize(Serializers serializers, ForceUpdate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'forceUpdate',
      serializers.serialize(object.forceUpdate,
          specifiedType: const FullType(bool)),
    ];
    if (object.versionCode != null) {
      result
        ..add('VersionCode')
        ..add(serializers.serialize(object.versionCode,
            specifiedType: const FullType(int)));
    }
    if (object.buildNumber != null) {
      result
        ..add('BuildNumber')
        ..add(serializers.serialize(object.buildNumber,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ForceUpdate deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ForceUpdateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'VersionCode':
          result.versionCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'forceUpdate':
          result.forceUpdate = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'BuildNumber':
          result.buildNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ForceUpdate extends ForceUpdate {
  @override
  final int versionCode;
  @override
  final bool forceUpdate;
  @override
  final int buildNumber;

  factory _$ForceUpdate([void Function(ForceUpdateBuilder) updates]) =>
      (new ForceUpdateBuilder()..update(updates)).build();

  _$ForceUpdate._({this.versionCode, this.forceUpdate, this.buildNumber})
      : super._() {
    if (forceUpdate == null) {
      throw new BuiltValueNullFieldError('ForceUpdate', 'forceUpdate');
    }
  }

  @override
  ForceUpdate rebuild(void Function(ForceUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForceUpdateBuilder toBuilder() => new ForceUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForceUpdate &&
        versionCode == other.versionCode &&
        forceUpdate == other.forceUpdate &&
        buildNumber == other.buildNumber;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, versionCode.hashCode), forceUpdate.hashCode),
        buildNumber.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ForceUpdate')
          ..add('versionCode', versionCode)
          ..add('forceUpdate', forceUpdate)
          ..add('buildNumber', buildNumber))
        .toString();
  }
}

class ForceUpdateBuilder implements Builder<ForceUpdate, ForceUpdateBuilder> {
  _$ForceUpdate _$v;

  int _versionCode;
  int get versionCode => _$this._versionCode;
  set versionCode(int versionCode) => _$this._versionCode = versionCode;

  bool _forceUpdate;
  bool get forceUpdate => _$this._forceUpdate;
  set forceUpdate(bool forceUpdate) => _$this._forceUpdate = forceUpdate;

  int _buildNumber;
  int get buildNumber => _$this._buildNumber;
  set buildNumber(int buildNumber) => _$this._buildNumber = buildNumber;

  ForceUpdateBuilder();

  ForceUpdateBuilder get _$this {
    if (_$v != null) {
      _versionCode = _$v.versionCode;
      _forceUpdate = _$v.forceUpdate;
      _buildNumber = _$v.buildNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForceUpdate other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ForceUpdate;
  }

  @override
  void update(void Function(ForceUpdateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ForceUpdate build() {
    final _$result = _$v ??
        new _$ForceUpdate._(
            versionCode: versionCode,
            forceUpdate: forceUpdate,
            buildNumber: buildNumber);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
