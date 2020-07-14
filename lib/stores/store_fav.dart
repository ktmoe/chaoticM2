import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/box_fav_products.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/models/responses/product.dart';
import 'package:m2mobile/stores/authenticate_store.dart';
import 'package:mobx/mobx.dart';

part 'store_fav.g.dart';

class StoreFav = _StoreFav with _$StoreFav;

abstract class _StoreFav with Store{

  final ApiService apiService = Modular.get<ApiService>();

  final AuthenticateStore authenticateStore = Modular.get<AuthenticateStore>();

  BoxFav _boxFav;

  @observable
  List<Product> favs = [];

  _StoreFav(){
    init();
  }

  @action
  void updateFavs(){
    favs = _boxFav.listenable.value.values.toList();
  }

  @action
  Future init() async{
    _boxFav = await BoxFav.create();
    updateFavs();
    _boxFav.listenable.addListener(updateFavs);
  }

  @action
  Future fetchFavList({bool refresh = false}) async{
    try{
      final favResponse = await apiService.getFavList(authenticateStore.userId);
      final favItems = favResponse.body.product.toList();
      if(refresh) _boxFav.delete();
      _boxFav.addAll(favItems);
    }catch(e){
      print("err in fav list fetch => ${e.toString()}");
    }
  }

}