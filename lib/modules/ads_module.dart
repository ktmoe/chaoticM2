import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/main/ads/ads_detail_widget.dart';
import 'package:m2mobile/models/ads.dart';

class AdsModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (context, args) => AdsDetailWidget(ads: args.data as Ads))
      ];
}
