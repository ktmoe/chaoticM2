import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:m2mobile/modules/app_module.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/models/payloads/favorite_item_payload.dart';
import 'package:m2mobile/models/payloads/favorite_item.dart';

void main() {
  initModules([AppModule()]);

  // TestWidgetsFlutterBinding.ensureInitialized();
  ApiService _apiService = Modular.get<ApiService>();

  test('LoginTest', () async {
    await _apiService.login("09961637594", "berryberry", "");
  });

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

  test("AddToFavorite", () async {
    final favoriteItem = FavoriteItem((b) {
      b.customerid = "6bc0cd5e-f193-42f6-bbcd-618e985670f0";
      b.productid = "25b96788-0fb9-4083-a715-99981a04de67";
    });
    final payload = FavoriteItemPayload((builder) {
      builder.favoriteItem = favoriteItem.toBuilder();
    });
    await _apiService.addToFav(payload.toJson());
  });
}
