// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ApiService extends ApiService {
  _$ApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response<ProductResponse>> getProducts() {
    final $url = '/api/productview/getProductList';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<ProductResponse, ProductResponse>($request);
  }

  @override
  Future<Response<Product>> getProductById(String id) {
    final $url = '/api/productview/getProductByID';
    final $params = <String, dynamic>{'productid': id};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Product, Product>($request);
  }

  @override
  Future<Response<HelpResponse>> getHelpInfo() {
    final $url = '/api/getHelpview/help';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<HelpResponse, HelpResponse>($request);
  }
}
