import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/box_help_info.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/models/responses/help.dart';
import 'package:mobx/mobx.dart';

part 'store_help.g.dart';

class StoreHelp = _StoreHelp with _$StoreHelp;

abstract class _StoreHelp with Store{

  final ApiService api = Modular.get<ApiService>();

  BoxHelp boxHelp;

  @observable
  Help helpInfo;

  _StoreHelp(){
    init();
  }

  @action
  void updateInfo(){
    helpInfo = boxHelp.listenable.value.get(BoxHelp.infoKey);
  }

  @action
  Future init() async{
    boxHelp = await BoxHelp.create();
    updateInfo();
    boxHelp.listenable.addListener(updateInfo);
  }


  void getHelpInfo({bool refresh = false}) async{
    try{
      final helpResponse = await api.getHelpInfo();
      final helpInfo = helpResponse.body.help;
      boxHelp.save(helpInfo);
    }catch(e){
      print("err when getting help data => ${e.toString()}");
    }
  }

}