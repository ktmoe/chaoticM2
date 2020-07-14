import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:m2mobile/data/dummy/vos/user_profile.dart';
import 'package:m2mobile/models/responses/product.dart';
import 'package:m2mobile/modules/app_module.dart';

Future<void> main() async {
  await Hive.initFlutter();
  _registerAdapters();
  _setupLogging();
  runApp(ModularApp(
    module: AppModule(),
  ));
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

void _registerAdapters() {
  Hive.registerAdapter<UserProfile>(UserProfileAdapter());
  Hive.registerAdapter<Product>(ProductAdapter());
}
