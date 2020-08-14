library bank_account;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';
import 'package:m2mobile/models/serializers.dart';

part 'bank_account.g.dart';

@HiveType(typeId: 8)
abstract class BankAccount implements Built<BankAccount, BankAccountBuilder> {
  BankAccount._();

  factory BankAccount([updates(BankAccountBuilder b)]) = _$BankAccount;

  @HiveField(0)
  @BuiltValueField(wireName: 'id')
  String get id;
  @HiveField(1)
  @BuiltValueField(wireName: 'bank')
  String get bank;
  @HiveField(2)
  @BuiltValueField(wireName: 'account')
  String get account;
  @HiveField(3)
  @BuiltValueField(wireName: 'ownername')
  String get ownername;
  @HiveField(4)
  @BuiltValueField(wireName: 'logo')
  String get logo;
  @HiveField(5)
  @BuiltValueField(wireName: 'createddate')
  String get createddate;
  @HiveField(6)
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
