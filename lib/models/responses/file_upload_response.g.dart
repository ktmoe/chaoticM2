// GENERATED CODE - DO NOT MODIFY BY HAND

part of file_upload_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FileUploadResponse> _$fileUploadResponseSerializer =
    new _$FileUploadResponseSerializer();

class _$FileUploadResponseSerializer
    implements StructuredSerializer<FileUploadResponse> {
  @override
  final Iterable<Type> types = const [FileUploadResponse, _$FileUploadResponse];
  @override
  final String wireName = 'FileUploadResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, FileUploadResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.data, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  FileUploadResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FileUploadResponseBuilder();

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
        case 'link':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$FileUploadResponse extends FileUploadResponse {
  @override
  final String message;
  @override
  final String data;

  factory _$FileUploadResponse(
          [void Function(FileUploadResponseBuilder) updates]) =>
      (new FileUploadResponseBuilder()..update(updates)).build();

  _$FileUploadResponse._({this.message, this.data}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('FileUploadResponse', 'message');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('FileUploadResponse', 'data');
    }
  }

  @override
  FileUploadResponse rebuild(
          void Function(FileUploadResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FileUploadResponseBuilder toBuilder() =>
      new FileUploadResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FileUploadResponse &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FileUploadResponse')
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class FileUploadResponseBuilder
    implements Builder<FileUploadResponse, FileUploadResponseBuilder> {
  _$FileUploadResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _data;
  String get data => _$this._data;
  set data(String data) => _$this._data = data;

  FileUploadResponseBuilder();

  FileUploadResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _data = _$v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FileUploadResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FileUploadResponse;
  }

  @override
  void update(void Function(FileUploadResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FileUploadResponse build() {
    final _$result =
        _$v ?? new _$FileUploadResponse._(message: message, data: data);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
