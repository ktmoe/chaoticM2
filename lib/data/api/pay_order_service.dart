import 'package:chopper/chopper.dart';

part 'pay_order_service.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class PayOrderService extends ChopperService {
  static PayOrderService create([ChopperClient client]) =>
      _$PayOrderService(client);

  @Post(path: 'order-payment', headers: {"Content-Type": "multipart/formdata"})
  @Multipart()
  Future<Response<List<Map<String, dynamic>>>> payOrder(
      @Body() String slipPayload);
}
