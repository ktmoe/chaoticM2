// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductResponse> _$productResponseSerializer =
    new _$ProductResponseSerializer();

class _$ProductResponseSerializer
    implements StructuredSerializer<ProductResponse> {
  @override
  final Iterable<Type> types = const [ProductResponse, _$ProductResponse];
  @override
  final String wireName = 'ProductResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, ProductResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.product,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Product)])),
    ];
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }
    if (object.lastPage != null) {
      result
        ..add('lastPage')
        ..add(serializers.serialize(object.lastPage,
            specifiedType: const FullType(int)));
    }
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(ErrorMessage)));
    }
    return result;
  }

  @override
  ProductResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductResponseBuilder();

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
          result.product.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Product)]))
              as BuiltList<Object>);
          break;
        case 'lastPage':
          result.lastPage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'error':
          result.error.replace(serializers.deserialize(value,
              specifiedType: const FullType(ErrorMessage)) as ErrorMessage);
          break;
      }
    }

    return result.build();
  }
}

class _$ProductResponse extends ProductResponse {
  @override
  final String message;
  @override
  final BuiltList<Product> product;
  @override
  final int lastPage;
  @override
  final ErrorMessage error;

  factory _$ProductResponse([void Function(ProductResponseBuilder) updates]) =>
      (new ProductResponseBuilder()..update(updates)).build();

  _$ProductResponse._({this.message, this.product, this.lastPage, this.error})
      : super._() {
    if (product == null) {
      throw new BuiltValueNullFieldError('ProductResponse', 'product');
    }
  }

  @override
  ProductResponse rebuild(void Function(ProductResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductResponseBuilder toBuilder() =>
      new ProductResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductResponse &&
        message == other.message &&
        product == other.product &&
        lastPage == other.lastPage &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, message.hashCode), product.hashCode), lastPage.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductResponse')
          ..add('message', message)
          ..add('product', product)
          ..add('lastPage', lastPage)
          ..add('error', error))
        .toString();
  }
}

class ProductResponseBuilder
    implements Builder<ProductResponse, ProductResponseBuilder> {
  _$ProductResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ListBuilder<Product> _product;
  ListBuilder<Product> get product =>
      _$this._product ??= new ListBuilder<Product>();
  set product(ListBuilder<Product> product) => _$this._product = product;

  int _lastPage;
  int get lastPage => _$this._lastPage;
  set lastPage(int lastPage) => _$this._lastPage = lastPage;

  ErrorMessageBuilder _error;
  ErrorMessageBuilder get error => _$this._error ??= new ErrorMessageBuilder();
  set error(ErrorMessageBuilder error) => _$this._error = error;

  ProductResponseBuilder();

  ProductResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _product = _$v.product?.toBuilder();
      _lastPage = _$v.lastPage;
      _error = _$v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProductResponse;
  }

  @override
  void update(void Function(ProductResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductResponse build() {
    _$ProductResponse _$result;
    try {
      _$result = _$v ??
          new _$ProductResponse._(
              message: message,
              product: product.build(),
              lastPage: lastPage,
              error: _error?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'product';
        product.build();

        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProductResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
