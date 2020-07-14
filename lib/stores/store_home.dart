

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/box_products.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/models/responses/product.dart';
import 'package:mobx/mobx.dart';

part 'store_home.g.dart';

class StoreHome = _StoreHome with _$StoreHome;

abstract class _StoreHome with Store{

  final ApiService api = Modular.get<ApiService>();

  @observable
  List<Product> products = [];

  BoxProduct boxProduct;

  _StoreHome(){
    init();
  }

  @action
  Future init() async{
    boxProduct = await BoxProduct.create();
    updateProducts();
    boxProduct.listenable.addListener(updateProducts);
  }

  @action
  void updateProducts(){
    products = boxProduct.listenable.value.values;
  }

  @action
  Future getProductList({bool refresh = false}) async{
     try{
       final productResponse = await api.getProducts();
       final products = productResponse.body.product.toList();
       if(refresh) boxProduct.deleteAll();
       boxProduct.saveAll(products);
     }catch(e){
        print("err when fetching product list => ${e.toString()}");
     }
  }

}