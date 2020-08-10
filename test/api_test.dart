import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:m2mobile/modules/app_module.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  initModules([AppModule()]);
  ApiService _apiService = Modular.get<ApiService>();

  test('LatestProducts', () async {
    await _apiService.getLatestProducts("6bc0cd5e-f193-42f6-bbcd-618e985670f0");
  });

  test('DiscountProducts', () async {
    await _apiService
        .getDiscountProducts("6bc0cd5e-f193-42f6-bbcd-618e985670f0");
  });

  test("FavoriteProducts", () async {
    await _apiService.getFavList("6bc0cd5e-f193-42f6-bbcd-618e985670f0");
  });
}
