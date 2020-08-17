import 'package:chopper/chopper.dart';

import 'package:m2mobile/models/responses/cart_list_response.dart';
import 'package:m2mobile/models/responses/bank_info_response.dart';
import 'package:m2mobile/models/responses/favorite_operate_response.dart';
import 'package:m2mobile/models/responses/force_update_response.dart';
import 'package:m2mobile/models/responses/help_response.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/models/responses/login_response.dart';
import 'package:m2mobile/models/responses/post_profile_response.dart';
import 'package:m2mobile/models/responses/product_response.dart';
import 'package:m2mobile/models/responses/order_list_response.dart';
import 'package:m2mobile/models/responses/company_info_response.dart';
import 'package:m2mobile/models/responses/m2_category_response.dart';
import 'package:m2mobile/models/responses/sub_category_response.dart';
import 'package:m2mobile/models/responses/refresh_token_response.dart';
import 'package:m2mobile/models/responses/order_detail_response.dart';
import 'package:m2mobile/models/responses/post_order_response.dart';
import 'package:m2mobile/models/responses/order_payment_response.dart';
import 'package:built_collection/built_collection.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class ApiService extends ChopperService {
  static ApiService create([ChopperClient client]) => _$ApiService(client);

  /// product ///

  @Get(path: 'api/productview/getProductByID')
  Future<Response<Product>> getProductById(@Query('productid') String id);

  @Get(path: 'api/productview/getLatestProductList')
  Future<Response<ProductResponse>> getLatestProducts(
      {@Query('customerId') String customerId,
      @Query('currentPage') int currentPage,
      @Query('perPage') int perPage = 10});

  @Get(path: 'api/productview/getDiscountProducts')
  Future<Response<ProductResponse>> getDiscountProducts(
      @Query('customerid') String customerId);

  @Get(path: 'api/productview/getProductListByCategory')
  Future<Response<ProductResponse>> getProductsByCategory(
      @Query('customerId') String customerId,
      @Query('subCategoryId') String subCategoryId);

  /// help ///
  @Get(path: 'api/helpview')
  Future<Response<HelpResponse>> getHelpInfo();

  /// Favorite ///
  @Get(path: 'api/favoriteview/getFavoriteList')
  Future<Response<ProductResponse>> getFavList(@Query('customerId') String id);

  @Post(path: 'api/favoriteview/addToFavorite')
  Future<Response<FavoriteOperateResponse>> addToFav(
      @Body() String favoriteItem);

  @Delete(path: 'api/favoriteview/deleteFavorite')
  Future<Response<FavoriteOperateResponse>> deleteFavorite(
      @Body() String favoriteItem);

  ///Force Update ///
  @Get(path: 'api/forceupdateview/forceUpdateAndroid')
  Future<Response<ForceUpdateResponse>> forceUpdateAndroid(
      @Query('versioncode') int versionCode);

  @Get(path: 'api/forceupdateview/forceUpdateIOS')
  Future<Response<ForceUpdateResponse>> forceUpdateIOS(
      @Query('buildnumber') int buildNumber);

  ///  Company Info ///
  @Get(path: 'api/companyview')
  Future<Response<CompanyInfoResponse>> getCompanyInfo();

  /// Bank Info ///
  @Get(path: 'api/bankview/getBankInfoList')
  Future<Response<BankInfoResponse>> getBankInfo();

  ///  Category and SubCategories ///
  @Get(path: 'api/categoryview')
  Future<Response<M2CategoryResponse>> getCategories();

  @Get(path: 'api/subcategoryview')
  Future<Response<SubCategoryResponse>> getSubCategories();

  /// User Profile ///
  @Post(path: 'api/customerview/saveProfile')
  Future<Response<PostProfileResponse>> saveProfile(
      @Query('imageurl') String imageUrl,
      @Query('name') String name,
      @Query('phone') String phone,
      @Query('address') String address,
      @Query('password') String password);

  @Post(path: 'api/customerview/editProfile')
  Future<Response<PostProfileResponse>> editProfile(
      @Query('id') String id,
      @Query('imageurl') String imageUrl,
      @Query('name') String name,
      @Query('phone') String phone,
      @Query('address') String address);

  @Get(path: 'api/authview/login')
  Future<Response<LoginResponse>> login(
      @Query('phone') String phone,
      @Query('password') String password,
      @Query('firebase_token') String firebaseToken);

  @Post(path: 'api/authview/refreshToken')
  Future<Response<RefreshTokenResponse>> refreshToken(
      @Query('customerid') String customerId,
      @Query('firebase_token') String firebaseToken);

  @Get(path: 'api/customerview/customerProfile')
  Future<Response<PostProfileResponse>> customerProfile(
      @Query('customerid') String customerId);

  @Post(path: 'api/customerview/operateFavorite')
  Future<Response<FavoriteOperateResponse>> operateFavorite(
      @Query('customerid') String customerId,
      @Query('productid') String productId);

  /// cart  ///

  @Get(path: 'api/cartview/getCartItemList')
  Future<Response<ProductResponse>> getCartList(
    @Query('customerId') String customerId,
  );

  @Post(path: 'api/cartview/addToCart')
  Future<Response<CartListResponse>> addToCart(@Body() String item);

  @Put(path: 'api/cartview/updateCartItem')
  Future<Response<CartListResponse>> updateCart(
      @Query('cartId') String cartId, @Body() String updateCount);

  @Delete(path: 'api/cartview/deleteCartItems')
  Future<Response> deleteCartItems(@Body() String cartIds);

  /// order ///

  @Post(path: 'api/orderview/orderItems')
  Future<Response<PostOrderResponse>> postOrder(
      @Body() String orderCustomerInfo);

  @Get(path: 'api/orderview/getOrderList')
  Future<Response<OrderListResponse>> getOrderList(
      @Query('customerId') String customerId);

  @Get(path: 'api/orderview/getOrderDetailList')
  Future<Response<OrderDetailResponse>> getOrderDetail(
      @Query('orderId') String orderId);

  @Post(path: 'order-payment')
  @Multipart()
  Future<Response<BuiltList<OrderPaymentResponse>>> payOrder(
      @Body() String payOrderPayload);
}
