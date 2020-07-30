import 'package:chopper/chopper.dart';
import 'package:m2mobile/models/responses/force_update_response.dart';
import 'package:m2mobile/models/responses/help_response.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/models/responses/login_response.dart';
import 'package:m2mobile/models/responses/post_profile_response.dart';
import 'package:m2mobile/models/responses/product_response.dart';
import 'package:m2mobile/models/responses/company_info_response.dart';
import 'package:m2mobile/models/responses/m2_category_response.dart';
import 'package:m2mobile/models/responses/sub_category_response.dart';
import 'package:m2mobile/utils/constants.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/api')
abstract class ApiService extends ChopperService {
  static ApiService create([ChopperClient client]) => _$ApiService(client);

  /// product ///

  @Get(path: '/productview/getProductList')
  Future<Response<ProductResponse>> getProducts();

  @Get(path: '/productview/getProductByID')
  Future<Response<Product>> getProductById(@Query('productid') String id);

  @Get(path: '/productview/getLatestProducts')
  Future<Response<ProductResponse>> getLatestProducts();

  @Get(path: '/productview/getDiscountProducts')
  Future<Response<ProductResponse>> getDiscountProducts();

  /// help ///
  @Get(path: '/helpview')
  Future<Response<HelpResponse>> getHelpInfo();

  /// Favorite ///
  @Get(path: '/customerview/favoriteList')
  Future<Response<ProductResponse>> getFavList(@Query('customerid') String id);

  @Post(path: '/customerview/favorite')
  Future<Response> addToFav(@Query('customerid') String customerId,
      @Query('productid') String productId);

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
      {@Query('phone') String phone,
      @Query('password') String password,
      @Query('firebase_token') String firebaseToken = dummyFirebaseToken});

  @Get(path: '/customerview/customerProfile')
  Future<Response<PostProfileResponse>> customerProfile(
      @Query('customerid') String customerId);
}
