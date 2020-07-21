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

  @override
  Future<Response<ProductResponse>> getFavList(String id) {
    final $url = '/api/customerview/favoriteList';
    final $params = <String, dynamic>{'customerid': id};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ProductResponse, ProductResponse>($request);
  }

  @override
  Future<Response<dynamic>> addToFav(String customerId, String productId) {
    final $url = '/api/customerview/favorite';
    final $params = <String, dynamic>{
      'customerid': customerId,
      'productid': productId
    };
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> removeFromFav(String customerId, String productId) {
    final $url = '/api/customerview/Removefavorite';
    final $params = <String, dynamic>{
      'customerid': customerId,
      'productid': productId
    };
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ForceUpdateResponse>> forceUpdateAndroid(int versionCode) {
    final $url = '/api/forceupdateview/forceUpdateAndroid';
    final $params = <String, dynamic>{'versioncode': versionCode};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ForceUpdateResponse, ForceUpdateResponse>($request);
  }

  @override
  Future<Response<ForceUpdateResponse>> forceUpdateIOS(int buildNumber) {
    final $url = '/api/forceupdateview/forceUpdateIOS';
    final $params = <String, dynamic>{'buildnumber': buildNumber};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ForceUpdateResponse, ForceUpdateResponse>($request);
  }
}
