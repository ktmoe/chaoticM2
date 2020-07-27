import 'package:chopper/chopper.dart';
import 'package:m2mobile/models/responses/force_update_response.dart';
import 'package:m2mobile/models/responses/help_response.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/models/responses/product_response.dart';
import 'package:m2mobile/models/responses/company_info_response.dart';
import 'package:m2mobile/models/responses/m2_category_response.dart';
import 'package:m2mobile/models/responses/sub_category_response.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/api')
abstract class ApiService extends ChopperService {
  static ApiService create([ChopperClient client]) => _$ApiService(client);

  /// product ///

  @Get(path: '/productview/getProductList')
  Future<Response<ProductResponse>> getProducts();

  @Get(path: '/productview/getProductByID')
  Future<Response<Product>> getProductById(@Query('productid') String id);

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

  /*
   * Force Update
   */
  @Get(path: '/forceupdateview/forceUpdateAndroid')
  Future<Response<ForceUpdateResponse>> forceUpdateAndroid(
      @Query('versioncode') int versionCode);

  @Get(path: '/forceupdateview/forceUpdateIOS')
  Future<Response<ForceUpdateResponse>> forceUpdateIOS(
      @Query('buildnumber') int buildNumber);

  /*
    Company Info
   */
  @Get(path: '/companyview')
  Future<Response<CompanyInfoResponse>> getCompanyInfo();

  /*
    Category and SubCategories
   */
  @Get(path: '/categoryview')
  Future<Response<M2CategoryResponse>> getCategories();

  @Get(path: '/subcategoryview')
  Future<Response<SubCategoryResponse>> getSubCategories();
}
