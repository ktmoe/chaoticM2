// GENERATED CODE - DO NOT MODIFY BY HAND

part of company_info_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CompanyInfoResponse> _$companyInfoResponseSerializer =
    new _$CompanyInfoResponseSerializer();

class _$CompanyInfoResponseSerializer
    implements StructuredSerializer<CompanyInfoResponse> {
  @override
  final Iterable<Type> types = const [
    CompanyInfoResponse,
    _$CompanyInfoResponse
  ];
  @override
  final String wireName = 'CompanyInfoResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CompanyInfoResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.companyInfo,
          specifiedType: const FullType(CompanyInfo)),
    ];

    return result;
  }

  @override
  CompanyInfoResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompanyInfoResponseBuilder();

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
          result.companyInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(CompanyInfo)) as CompanyInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$CompanyInfoResponse extends CompanyInfoResponse {
  @override
  final String message;
  @override
  final CompanyInfo companyInfo;

  factory _$CompanyInfoResponse(
          [void Function(CompanyInfoResponseBuilder) updates]) =>
      (new CompanyInfoResponseBuilder()..update(updates)).build();

  _$CompanyInfoResponse._({this.message, this.companyInfo}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('CompanyInfoResponse', 'message');
    }
    if (companyInfo == null) {
      throw new BuiltValueNullFieldError('CompanyInfoResponse', 'companyInfo');
    }
  }

  @override
  CompanyInfoResponse rebuild(
          void Function(CompanyInfoResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompanyInfoResponseBuilder toBuilder() =>
      new CompanyInfoResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompanyInfoResponse &&
        message == other.message &&
        companyInfo == other.companyInfo;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), companyInfo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CompanyInfoResponse')
          ..add('message', message)
          ..add('companyInfo', companyInfo))
        .toString();
  }
}

class CompanyInfoResponseBuilder
    implements Builder<CompanyInfoResponse, CompanyInfoResponseBuilder> {
  _$CompanyInfoResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  CompanyInfoBuilder _companyInfo;
  CompanyInfoBuilder get companyInfo =>
      _$this._companyInfo ??= new CompanyInfoBuilder();
  set companyInfo(CompanyInfoBuilder companyInfo) =>
      _$this._companyInfo = companyInfo;

  CompanyInfoResponseBuilder();

  CompanyInfoResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _companyInfo = _$v.companyInfo?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompanyInfoResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CompanyInfoResponse;
  }

  @override
  void update(void Function(CompanyInfoResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CompanyInfoResponse build() {
    _$CompanyInfoResponse _$result;
    try {
      _$result = _$v ??
          new _$CompanyInfoResponse._(
              message: message, companyInfo: companyInfo.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'companyInfo';
        companyInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CompanyInfoResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
