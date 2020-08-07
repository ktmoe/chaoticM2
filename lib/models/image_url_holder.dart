library image_url_holder;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';
import 'package:m2mobile/models/serializers.dart';

part 'image_url_holder.g.dart';

@HiveType(typeId: 6)
abstract class ImageUrlHolder
    implements Built<ImageUrlHolder, ImageUrlHolderBuilder> {
  ImageUrlHolder._();

  factory ImageUrlHolder([updates(ImageUrlHolderBuilder b)]) = _$ImageUrlHolder;

  @HiveField(0)
  @BuiltValueField(wireName: 'url')
  String get url;
  String toJson() {
    return json
        .encode(serializers.serializeWith(ImageUrlHolder.serializer, this));
  }

  static ImageUrlHolder fromJson(String jsonString) {
    return serializers.deserializeWith(
        ImageUrlHolder.serializer, json.decode(jsonString));
  }

  static Serializer<ImageUrlHolder> get serializer =>
      _$imageUrlHolderSerializer;
}
