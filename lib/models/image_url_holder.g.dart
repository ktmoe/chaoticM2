// GENERATED CODE - DO NOT MODIFY BY HAND

part of image_url_holder;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImageUrlHolder> _$imageUrlHolderSerializer =
    new _$ImageUrlHolderSerializer();

class _$ImageUrlHolderSerializer
    implements StructuredSerializer<ImageUrlHolder> {
  @override
  final Iterable<Type> types = const [ImageUrlHolder, _$ImageUrlHolder];
  @override
  final String wireName = 'ImageUrlHolder';

  @override
  Iterable<Object> serialize(Serializers serializers, ImageUrlHolder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ImageUrlHolder deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageUrlHolderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ImageUrlHolder extends ImageUrlHolder {
  @override
  final String url;

  factory _$ImageUrlHolder([void Function(ImageUrlHolderBuilder) updates]) =>
      (new ImageUrlHolderBuilder()..update(updates)).build();

  _$ImageUrlHolder._({this.url}) : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('ImageUrlHolder', 'url');
    }
  }

  @override
  ImageUrlHolder rebuild(void Function(ImageUrlHolderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageUrlHolderBuilder toBuilder() =>
      new ImageUrlHolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageUrlHolder && url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(0, url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImageUrlHolder')..add('url', url))
        .toString();
  }
}

class ImageUrlHolderBuilder
    implements Builder<ImageUrlHolder, ImageUrlHolderBuilder> {
  _$ImageUrlHolder _$v;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  ImageUrlHolderBuilder();

  ImageUrlHolderBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageUrlHolder other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ImageUrlHolder;
  }

  @override
  void update(void Function(ImageUrlHolderBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ImageUrlHolder build() {
    final _$result = _$v ?? new _$ImageUrlHolder._(url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageUrlHolderAdapter extends TypeAdapter<ImageUrlHolder> {
  @override
  final int typeId = 6;

  @override
  ImageUrlHolder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return (ImageUrlHolderBuilder()..url = fields[0] as String).build();
  }

  @override
  void write(BinaryWriter writer, ImageUrlHolder obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.url);
  }
}
