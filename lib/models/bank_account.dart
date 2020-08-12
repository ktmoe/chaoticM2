library bank_account;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'bank_account.g.dart';

abstract class BankAccount implements Built<BankAccount, BankAccountBuilder> {
  BankAccount._();

  factory BankAccount([updates(BankAccountBuilder b)]) = _$BankAccount;

  @BuiltValueField(wireName: 'id')
  String get id;
  @BuiltValueField(wireName: 'bank')
  String get bank;
  @BuiltValueField(wireName: 'account')
  String get account;
  @BuiltValueField(wireName: 'ownername')
  String get ownername;
  @BuiltValueField(wireName: 'logo')
  String get logo;
  @BuiltValueField(wireName: 'createddate')
  String get createddate;
  @BuiltValueField(wireName: 'updateddate')
  String get updateddate;
  String toJson() {
    return json.encode(serializers.serializeWith(BankAccount.serializer, this));
  }

  static BankAccount fromJson(String jsonString) {
    return serializers.deserializeWith(
        BankAccount.serializer, json.decode(jsonString));
  }

  static Serializer<BankAccount> get serializer => _$bankAccountSerializer;
}
