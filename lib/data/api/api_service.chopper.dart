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
  Future<Response<Product>> getProductById(String id) {
    final $url = '/api/productview/getProductByID';
    final $params = <String, dynamic>{'productid': id};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Product, Product>($request);
  }

  @override
  Future<Response<ProductResponse>> getLatestProducts(
      {String customerId, int currentPage, int perPage = 10}) {
    final $url = '/api/productview/getLatestProductList';
    final $params = <String, dynamic>{
      'customerId': customerId,
      'currentPage': currentPage,
      'perPage': perPage
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ProductResponse, ProductResponse>($request);
  }

  @override
  Future<Response<ProductResponse>> getDiscountProducts(String customerId) {
    final $url = '/api/productview/getDiscountProducts';
    final $params = <String, dynamic>{'customerid': customerId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ProductResponse, ProductResponse>($request);
  }

  @override
  Future<Response<ProductResponse>> getProductsByCategory(
      String subCategoryId) {
    final $url = '/api/productview/getProductListByCategory';
    final $params = <String, dynamic>{'subCategoryId': subCategoryId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ProductResponse, ProductResponse>($request);
  }

  @override
  Future<Response<HelpResponse>> getHelpInfo() {
    final $url = '/api/helpview';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<HelpResponse, HelpResponse>($request);
  }

  @override
  Future<Response<ProductResponse>> getFavList(String id) {
    final $url = '/api/customerview/getFavoriteList';
    final $params = <String, dynamic>{'customerid': id};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ProductResponse, ProductResponse>($request);
  }

  @override
  Future<Response<FavoriteOperateResponse>> addToFav(String favoriteItem) {
    final $url = '/api/favoriteview/addToFavorite';
    final $body = favoriteItem;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<FavoriteOperateResponse, FavoriteOperateResponse>($request);
  }

  @override
  Future<Response<FavoriteOperateResponse>> deleteFavorite(
      String favoriteItem) {
    final $url = '/api/favoriteview/deleteFavorite';
    final $body = favoriteItem;
    final $request = Request('DELETE', $url, client.baseUrl, body: $body);
    return client
        .send<FavoriteOperateResponse, FavoriteOperateResponse>($request);
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

  @override
  Future<Response<CompanyInfoResponse>> getCompanyInfo() {
    final $url = '/api/companyview';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<CompanyInfoResponse, CompanyInfoResponse>($request);
  }

  @override
  Future<Response<BankInfoResponse>> getBankInfo() {
    final $url = '/api/bankview/getBankInfoList';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BankInfoResponse, BankInfoResponse>($request);
  }

  @override
  Future<Response<M2CategoryResponse>> getCategories() {
    final $url = '/api/categoryview';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<M2CategoryResponse, M2CategoryResponse>($request);
  }

  @override
  Future<Response<SubCategoryResponse>> getSubCategories() {
    final $url = '/api/subcategoryview';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<SubCategoryResponse, SubCategoryResponse>($request);
  }

  @override
  Future<Response<PostProfileResponse>> saveProfile(String imageUrl,
      String name, String phone, String address, String password) {
    final $url = '/api/customerview/saveProfile';
    final $params = <String, dynamic>{
      'imageurl': imageUrl,
      'name': name,
      'phone': phone,
      'address': address,
      'password': password
    };
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<PostProfileResponse, PostProfileResponse>($request);
  }

  @override
  Future<Response<PostProfileResponse>> editProfile(
      String id, String imageUrl, String name, String phone, String address) {
    final $url = '/api/customerview/editProfile';
    final $params = <String, dynamic>{
      'id': id,
      'imageurl': imageUrl,
      'name': name,
      'phone': phone,
      'address': address
    };
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<PostProfileResponse, PostProfileResponse>($request);
  }

  @override
  Future<Response<LoginResponse>> login(
      String phone, String password, String firebaseToken) {
    final $url = '/api/authview/login';
    final $params = <String, dynamic>{
      'phone': phone,
      'password': password,
      'firebase_token': firebaseToken
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<RefreshTokenResponse>> refreshToken(
      String customerId, String firebaseToken) {
    final $url = '/api/authview/refreshToken';
    final $params = <String, dynamic>{
      'customerid': customerId,
      'firebase_token': firebaseToken
    };
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<RefreshTokenResponse, RefreshTokenResponse>($request);
  }

  @override
  Future<Response<PostProfileResponse>> customerProfile(String customerId) {
    final $url = '/api/customerview/customerProfile';
    final $params = <String, dynamic>{'customerid': customerId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PostProfileResponse, PostProfileResponse>($request);
  }

  @override
  Future<Response<OrderListResponse>> getOrderList(String customerId) {
    final $url = '/api/orderview/getOrderList';
    final $params = <String, dynamic>{'customerId': customerId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<OrderListResponse, OrderListResponse>($request);
  }
}
