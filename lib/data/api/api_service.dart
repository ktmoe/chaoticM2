import 'package:chopper/chopper.dart';
import 'package:m2mobile/models/responses/product_response.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/api')
abstract class ApiService extends ChopperService{
  static ApiService create([ChopperClient client]) => _$ApiService(client);

  @Get(path: '/productview/getProductList')
  Future<Response<ProductResponse>> getProducts();

}