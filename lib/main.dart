import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:m2mobile/models/bank_account.dart';
import 'package:m2mobile/models/image_url_holder.dart';
import 'package:m2mobile/models/order.dart';
import 'package:m2mobile/models/user_profile.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/models/company_info.dart';
import 'package:m2mobile/modules/app_module.dart';
import 'package:m2mobile/models/m2_category.dart';
import 'package:m2mobile/models/sub_category.dart';
import 'package:m2mobile/models/help.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  await Hive.initFlutter();
  _registerAdapters();
  _setupLogging();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ModularApp(
    module: AppModule(),
  ));
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print("${rec.level.name}: ${rec.time}: ${rec.message}");
  });
}

void _registerAdapters() {
  Hive.registerAdapter<UserProfile>(UserProfileAdapter()); //HiveType 0
  Hive.registerAdapter<Product>(ProductAdapter()); //HiveType 1
  Hive.registerAdapter<CompanyInfo>(CompanyInfoAdapter()); //HiveType 2
  Hive.registerAdapter<M2Category>(M2CategoryAdapter()); //HiveType 3
  Hive.registerAdapter<SubCategory>(SubCategoryAdapter()); //HiveType 4
  Hive.registerAdapter<Help>(HelpAdapter()); //HiveType 5
  Hive.registerAdapter<ImageUrlHolder>(ImageUrlHolderAdapter()); //HiveType 6
  Hive.registerAdapter<Order>(OrderAdapter()); //HiveType 7
  Hive.registerAdapter<BankAccount>(BankAccountAdapter()); //HiveType 6
}
