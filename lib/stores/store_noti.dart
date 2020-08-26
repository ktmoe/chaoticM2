import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/box_noti.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/models/noti.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/utils/extensions.dart';

part 'store_noti.g.dart';

class StoreNoti = _StoreNoti with _$StoreNoti;

abstract class _StoreNoti with Store {
  @observable
  ObservableList<Noti> notis = ObservableList.of([]);

  @observable
  AppException exception;

  final api = Modular.get<ApiService>();

  BoxNoti _boxNoti;

  _StoreNoti() {
    init();
  }

  Future init() async {
    _boxNoti = await BoxNoti.create();
    _boxNoti.listenable.addListener(updateNotis);
    updateNotis();
  }

  @action
  void updateNotis() {
    notis = ObservableList.of(
        _sortByDate(_boxNoti.listenable.value.values.toList()));
  }

  @action
  Future fetchNotis({bool refresh}) async {
    try {
      final response = await api.getAllNoti();
      if (response.body.message.toLowerCase() == "success" &&
          response.body.error == null) {
        final notis = response.body.noti.toList();
        if (refresh) {
          _boxNoti.deleteAll();
        }
        _boxNoti.saveAll(notis);
      } else {
        notis = ObservableList.of([]);
      }
    } catch (e) {
      exception = AppException(message: e.toString());
    }
  }

  List<Noti> _sortByDate(List<Noti> notis) {
    notis.sort((a, b) =>
        a.date.dateTimeFromString().compareTo(b.date.dateTimeFromString()));
    print("in update " + notis.toString());
    return notis.reversed.toList();
  }

  void save(Noti noti) {
    _boxNoti.save(noti);
  }
}
