library file_upload_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:m2mobile/models/serializers.dart';

part 'file_upload_response.g.dart';

abstract class FileUploadResponse
    implements Built<FileUploadResponse, FileUploadResponseBuilder> {
  FileUploadResponse._();

  factory FileUploadResponse([updates(FileUploadResponseBuilder b)]) =
      _$FileUploadResponse;

  @BuiltValueField(wireName: 'message')
  String get message;
  @BuiltValueField(wireName: 'link')
  String get data;
  String toJson() {
    return json
        .encode(serializers.serializeWith(FileUploadResponse.serializer, this));
  }

  static FileUploadResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        FileUploadResponse.serializer, json.decode(jsonString));
  }

  static Serializer<FileUploadResponse> get serializer =>
      _$fileUploadResponseSerializer;
}
