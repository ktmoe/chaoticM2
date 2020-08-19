import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/fcm_service/fcm_service.dart';
import 'package:m2mobile/fcm_service/notification_service.dart';
import 'package:m2mobile/pages/main/ads/ads_detail_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/styles.dart';
import 'package:m2mobile/custom_widgets/product_card.dart';
import 'package:m2mobile/stores/store_home.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:m2mobile/stores/store_cart.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m2mobile/utils/extensions.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with AutomaticKeepAliveClientMixin<HomeWidget> {
  // List<String> _images = [
  //   "$baseUrl/upload/product/akrales_181019_3014_0770-(1).jpg",
  //   "$baseUrl/upload/product/akrales_181019_3014_0770-(1).jpg"
  // ];
  final StoreApp _storeApp = Modular.get<StoreApp>();
  final StoreHome _storeHome = Modular.get<StoreHome>();
  final StoreCart _storeCart = Modular.get<StoreCart>();
  final List<ReactionDisposer> _disposer = [];
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorState = GlobalKey();

  ReactionDisposer _onException() {
    return reaction<AppException>((_) => _storeHome.exception, (exception) {
      print("exception => $exception");
      exception.message.showSnack(context);
    });
  }

  StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    _disposer.addAll([_onException()]);
    Future.wait([_storeHome.init(), _storeCart.init(), _setUpMessagingAndNotificationService()]);
  }

  @override
  void dispose() {
    super.dispose();
    _disposer.forEach((element) {
      element();
    });
  }

  Future _setUpMessagingAndNotificationService() async {
    print("firebase setup get called");
    if (!FcmService().hasListener) {
      print("service has listeners");
      _streamSubscription = FcmService().onMessageReceived
          .listen((message) async {
        print("Homepage message : ${message['data']}");
        await NotificationService().show(message);
      },onError: (err){
         print("err in stream is => $err");
      });
    }
    else {
      print("already got listeners");
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
        key: _refreshIndicatorState,
        onRefresh: () async {
          await _storeHome.getDiscountProducts(refresh: true);
          await _storeHome.getLatestProducts(true);
          await _storeApp.getAds();
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels ==
                notification.metrics.maxScrollExtent) {
              Future.wait([_storeHome.getLatestProducts(false)]);
            }
            return true;
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildProductImagesSlider(),
                Container(
                    margin: const EdgeInsets.only(
                        left: Dimens.marginMedium2,
                        right: Dimens.marginMedium2),
                    child: Text('Discount Items',
                        style: Styles.m2TextTheme
                            .copyWith(fontWeight: FontWeight.bold))),
                _buildDiscountItemList(),
                Container(
                    margin: const EdgeInsets.only(
                        left: Dimens.marginMedium2,
                        right: Dimens.marginMedium2),
                    child: Text('Latest Items',
                        style: Styles.m2TextTheme
                            .copyWith(fontWeight: FontWeight.bold))),
                _buildLatestItemGrid(),
              ],
            ),
          ),
        ));
  }

  Widget _buildDiscountItemList() {
    return Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.4),
        margin: const EdgeInsets.only(left: Dimens.marginMedium),
        child: Observer(
          builder: (_) {
            final discountItems = _storeHome.discountProducts;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: discountItems.length,
                itemBuilder: (_, index) {
                  return ProductCard(
                      discountItem: discountItems[index].discountPrice != 0,
                      product: discountItems[index]);
                });
          },
        ));
  }

  Widget _buildLatestItemGrid() {
    return Observer(builder: (_) {
      return GridView.builder(
          shrinkWrap: true,
          addAutomaticKeepAlives: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(Dimens.marginMedium),
          itemCount: _storeHome.products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 2,
              crossAxisSpacing: 3,
              crossAxisCount: 2,
              childAspectRatio: (120 / 170)),
          itemBuilder: (context, index) => ProductCard(
              product: _storeHome.products[index],
              discountItem: _storeHome.products[index].discountPrice != 0));
    });
  }

  Widget _buildProductImagesSlider() => Container(
        margin: const EdgeInsets.all(Dimens.marginMedium2),
        height: MediaQuery.of(context).size.height * 0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.marginMedium2),
          child: Observer(builder: (_) {
            return Swiper(
              itemCount: _storeApp.adsList.length,
              indicatorLayout: PageIndicatorLayout.SCALE,
              autoplay: true,
              autoplayDelay: 2000,
              pagination: SwiperPagination(builder: SwiperPagination.dots),
              control: SwiperControl(iconNext: null, iconPrevious: null),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Modular.to.pushNamed(AdsDetailWidget.route,
                        arguments: _storeApp.adsList[index]);
                  },
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage("lib/res/images/placeholder.png"),
                    image: NetworkImage(
                        _storeApp.adsList[index].imageurl.createImageUrl()),
                  ),
                );
              },
            );
          }),
        ),
      );

  @override
  bool get wantKeepAlive => true;
}
