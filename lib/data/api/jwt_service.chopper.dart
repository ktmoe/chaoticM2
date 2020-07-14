// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$JwtService extends JwtService {
  _$JwtService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = JwtService;

  @override
  Future<Response<dynamic>> getToken() {
    final $url = '/jwt/token';
    final $headers = {
      'authorization':
          'Basic RXAzVGVSZlRKWWxlV0NVMW5HZW9lTDhyWmVUUnRvRTE4OGo5VVJLS016UTpMckVuQ0QzOFBGRGVlT0l1'
    };
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
