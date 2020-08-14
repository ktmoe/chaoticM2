// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_order_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PayOrderService extends PayOrderService {
  _$PayOrderService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PayOrderService;

  @override
  Future<Response<List<Map<String, dynamic>>>> payOrder(String slipPayload) {
    final $url = '/order-payment';
    final $headers = {'Content-Type': 'multipart/formdata'};
    final $body = slipPayload;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client
        .send<List<Map<String, dynamic>>, Map<String, dynamic>>($request);
  }
}
