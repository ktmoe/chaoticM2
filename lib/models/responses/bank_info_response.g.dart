// GENERATED CODE - DO NOT MODIFY BY HAND

part of bank_info_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BankInfoResponse> _$bankInfoResponseSerializer =
    new _$BankInfoResponseSerializer();

class _$BankInfoResponseSerializer
    implements StructuredSerializer<BankInfoResponse> {
  @override
  final Iterable<Type> types = const [BankInfoResponse, _$BankInfoResponse];
  @override
  final String wireName = 'BankInfoResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, BankInfoResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.bankAccount,
          specifiedType:
              const FullType(BuiltList, const [const FullType(BankAccount)])),
    ];

    return result;
  }

  @override
  BankInfoResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BankInfoResponseBuilder();

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
          result.bankAccount.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(BankAccount)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$BankInfoResponse extends BankInfoResponse {
  @override
  final String message;
  @override
  final BuiltList<BankAccount> bankAccount;

  factory _$BankInfoResponse(
          [void Function(BankInfoResponseBuilder) updates]) =>
      (new BankInfoResponseBuilder()..update(updates)).build();

  _$BankInfoResponse._({this.message, this.bankAccount}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('BankInfoResponse', 'message');
    }
    if (bankAccount == null) {
      throw new BuiltValueNullFieldError('BankInfoResponse', 'bankAccount');
    }
  }

  @override
  BankInfoResponse rebuild(void Function(BankInfoResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BankInfoResponseBuilder toBuilder() =>
      new BankInfoResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BankInfoResponse &&
        message == other.message &&
        bankAccount == other.bankAccount;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), bankAccount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BankInfoResponse')
          ..add('message', message)
          ..add('bankAccount', bankAccount))
        .toString();
  }
}

class BankInfoResponseBuilder
    implements Builder<BankInfoResponse, BankInfoResponseBuilder> {
  _$BankInfoResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ListBuilder<BankAccount> _bankAccount;
  ListBuilder<BankAccount> get bankAccount =>
      _$this._bankAccount ??= new ListBuilder<BankAccount>();
  set bankAccount(ListBuilder<BankAccount> bankAccount) =>
      _$this._bankAccount = bankAccount;

  BankInfoResponseBuilder();

  BankInfoResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _bankAccount = _$v.bankAccount?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BankInfoResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BankInfoResponse;
  }

  @override
  void update(void Function(BankInfoResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BankInfoResponse build() {
    _$BankInfoResponse _$result;
    try {
      _$result = _$v ??
          new _$BankInfoResponse._(
              message: message, bankAccount: bankAccount.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'bankAccount';
        bankAccount.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BankInfoResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
