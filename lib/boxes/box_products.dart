import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:m2mobile/models/responses/product.dart';

class BoxProduct implements Disposable{

  Box<Product> _box;

 static var key = "productBox";

  static BoxProduct _instance;

  BoxProduct._(this._box);

  //static BoxProduct get instance => _instance;

  static Future<BoxProduct> create() async{
    return _instance ??= BoxProduct._(await Hive.openBox(key));
  }

  ValueListenable<Box<Product>> get listenable => _box.listenable();

  @override
  void dispose() {
    _box.close();
  }

  void saveAll(List<Product> products){
    for(final p in products){
      save(p);
    }
  }

  List<Product> getAllProducts(){
    List<Product> products = [];
    _box.keys.forEach((key){
      products.add(_box.get(key));
    });
    return products;
  }

  void save(Product product){
    _box.put(product.id,product);
  }

  void deleteAll() => _box.deleteAll(_box.keys);

}