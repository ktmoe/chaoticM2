import 'package:chopper/chopper.dart';
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

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/api')
abstract class ApiService extends ChopperService {
  static ApiService create([ChopperClient client]) => _$ApiService(client);

  /// product ///

  @Get(path: '/productview/getProductByID')
  Future<Response<Product>> getProductById(@Query('productid') String id);

  @Get(path: '/productview/getLatestProductList')
  Future<Response<ProductResponse>> getLatestProducts(
      {@Query('customerId') String customerId,
      @Query('currentPage') int currentPage,
      @Query('perPage') int perPage = 10});

  @Get(path: '/productview/getDiscountProducts')
  Future<Response<ProductResponse>> getDiscountProducts(
      @Query('customerid') String customerId);

  @Get(path: '/productview/getProductListByCategory')
  Future<Response<ProductResponse>> getProductsByCategory(
    @Query('subCategoryId') String subCategoryId
  );

  /// help ///
  @Get(path: '/helpview')
  Future<Response<HelpResponse>> getHelpInfo();

  /// Favorite ///
  @Get(path: '/customerview/getFavoriteList')
  Future<Response<ProductResponse>> getFavList(@Query('customerid') String id);

  @Post(path: '/favoriteview/addToFavorite')
  Future<Response<FavoriteOperateResponse>> addToFav(
      @Body() String favoriteItem);

  @Delete(path: '/favoriteview/deleteFavorite')
  Future<Response<FavoriteOperateResponse>> deleteFavorite(
      @Body() String favoriteItem);

  @Post(path: '/customerview/Removefavorite')
  Future<Response> removeFromFav(@Query('customerid') String customerId,
      @Query('productid') String productId);

  ///Force Update ///
  @Get(path: '/forceupdateview/forceUpdateAndroid')
  Future<Response<ForceUpdateResponse>> forceUpdateAndroid(
      @Query('versioncode') int versionCode);

  @Get(path: '/forceupdateview/forceUpdateIOS')
  Future<Response<ForceUpdateResponse>> forceUpdateIOS(
      @Query('buildnumber') int buildNumber);

  ///  Company Info ///
  @Get(path: '/companyview')
  Future<Response<CompanyInfoResponse>> getCompanyInfo();

  /// Bank Info ///
  @Get(path: '/bankview/getBankInfoList')
  Future<Response<BankInfoResponse>> getBankInfo();

  ///  Category and SubCategories ///
  @Get(path: '/categoryview')
  Future<Response<M2CategoryResponse>> getCategories();

  @Get(path: '/subcategoryview')
  Future<Response<SubCategoryResponse>> getSubCategories();

  /// User Profile ///
  @Post(path: '/customerview/saveProfile')
  Future<Response<PostProfileResponse>> saveProfile(
      @Query('imageurl') String imageUrl,
      @Query('name') String name,
      @Query('phone') String phone,
      @Query('address') String address,
      @Query('password') String password);

  @Post(path: '/customerview/editProfile')
  Future<Response<PostProfileResponse>> editProfile(
      @Query('id') String id,
      @Query('imageurl') String imageUrl,
      @Query('name') String name,
      @Query('phone') String phone,
      @Query('address') String address);

  @Get(path: '/authview/login')
  Future<Response<LoginResponse>> login(
      @Query('phone') String phone,
      @Query('password') String password,
      @Query('firebase_token') String firebaseToken);

  @Post(path: '/authview/refreshToken')
  Future<Response<RefreshTokenResponse>> refreshToken(
      @Query('customerid') String customerId,
      @Query('firebase_token') String firebaseToken);

  @Get(path: '/customerview/customerProfile')
  Future<Response<PostProfileResponse>> customerProfile(
      @Query('customerid') String customerId);

  /// order ///
  @Get(path: '/orderview/getOrderList')
  Future<Response<OrderListResponse>> getOrderList(
      @Query('customerId') String customerId);
}
