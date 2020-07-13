import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class MainStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {}
