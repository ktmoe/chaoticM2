// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HelpResponse> _$helpResponseSerializer =
    new _$HelpResponseSerializer();

class _$HelpResponseSerializer implements StructuredSerializer<HelpResponse> {
  @override
  final Iterable<Type> types = const [HelpResponse, _$HelpResponse];
  @override
  final String wireName = 'HelpResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, HelpResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.help, specifiedType: const FullType(Help)),
    ];

    return result;
  }

  @override
  HelpResponse deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HelpResponseBuilder();

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
          result.help.replace(serializers.deserialize(value,
              specifiedType: const FullType(Help)) as Help);
          break;
      }
    }

    return result.build();
  }
}

class _$HelpResponse extends HelpResponse {
  @override
  final String message;
  @override
  final Help help;

  factory _$HelpResponse([void Function(HelpResponseBuilder) updates]) =>
      (new HelpResponseBuilder()..update(updates)).build();

  _$HelpResponse._({this.message, this.help}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('HelpResponse', 'message');
    }
    if (help == null) {
      throw new BuiltValueNullFieldError('HelpResponse', 'help');
    }
  }

  @override
  HelpResponse rebuild(void Function(HelpResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HelpResponseBuilder toBuilder() => new HelpResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HelpResponse &&
        message == other.message &&
        help == other.help;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), help.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HelpResponse')
          ..add('message', message)
          ..add('help', help))
        .toString();
  }
}

class HelpResponseBuilder
    implements Builder<HelpResponse, HelpResponseBuilder> {
  _$HelpResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  HelpBuilder _help;
  HelpBuilder get help => _$this._help ??= new HelpBuilder();
  set help(HelpBuilder help) => _$this._help = help;

  HelpResponseBuilder();

  HelpResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _help = _$v.help?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HelpResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HelpResponse;
  }

  @override
  void update(void Function(HelpResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HelpResponse build() {
    _$HelpResponse _$result;
    try {
      _$result =
          _$v ?? new _$HelpResponse._(message: message, help: help.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'help';
        help.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HelpResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
