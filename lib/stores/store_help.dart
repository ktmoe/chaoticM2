import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/box_help_info.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/models/help.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/exceptions/app_exception.dart';

part 'store_help.g.dart';

class StoreHelp = _StoreHelp with _$StoreHelp;

abstract class _StoreHelp with Store {
  final ApiService api = Modular.get<ApiService>();

  BoxHelp _boxHelp;

  @observable
  ObservableList<String> phones = ObservableList.of([]);

  @observable
  AppException exception;

  @action
  void updateInfo() {
    final helpInfo = _boxHelp.listenable.value.values;
    if (helpInfo.isNotEmpty) {
      phones =
          ObservableList.of(helpInfo.first.customerservicePhone.split(','));
    }
  }

  @action
  Future init() async {
    _boxHelp = await BoxHelp.create();
    updateInfo();
    _boxHelp.listenable.addListener(updateInfo);
    await getHelpInfo(refresh: true);
  }

  Future getHelpInfo({bool refresh = false}) async {
    try {
      final helpResponse = await api.getHelpInfo();
      final Help helpInfo = helpResponse.body.help;
      _boxHelp.save(helpInfo);
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }
}
