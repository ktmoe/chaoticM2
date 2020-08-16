import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'update_item.g.dart';

abstract class UpdateItem implements Built<UpdateItem, UpdateItemBuilder> {
  UpdateItem._();

  factory UpdateItem([updates(UpdateItemBuilder b)]) = _$UpdateItem;

  @BuiltValueField(wireName: 'quantity')
  int get quantity;
  String toJson() {
    return json.encode(serializers.serializeWith(UpdateItem.serializer, this));
  }

  static UpdateItem fromJson(String jsonString) {
    return serializers.deserializeWith(
        UpdateItem.serializer, json.decode(jsonString));
  }

  static Serializer<UpdateItem> get serializer => _$updateItemSerializer;
}
