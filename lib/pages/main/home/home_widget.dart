import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/custom_widgets/one_call_away_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/styles.dart';
import 'package:m2mobile/custom_widgets/product_card.dart';
import 'package:m2mobile/stores/store_home.dart';
import 'package:m2mobile/utils/constants.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:logger/logger.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with AutomaticKeepAliveClientMixin<HomeWidget> {
  List<String> _images = [
    "$baseUrl/upload/product/akrales_181019_3014_0770-(1).jpg",
    "$baseUrl/upload/product/akrales_181019_3014_0770-(1).jpg"
  ];

  final StoreApp _storeApp = Modular.get<StoreApp>();
  final StoreHome _storeHome = Modular.get<StoreHome>();
  final List<ReactionDisposer> _disposer = [];
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorState = GlobalKey();

  ReactionDisposer _onConnectivityChanged() =>
      when((_) => _storeApp.isNetworkOn, () async {
        await _storeHome.getLatestProducts(refresh: true);
      });

  ReactionDisposer _onException() {
    return reaction<AppException>((_) => _storeHome.exception, (exception) {
      Modular.get<Logger>().e(exception.message);
      exception.message.showSnack(context);
    });
  }

  @override
  void initState() {
    super.initState();
    _disposer.addAll([_onConnectivityChanged(), _onException()]);
  }

  @override
  void dispose() {
    super.dispose();
    _disposer.forEach((element) {
      element();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
        key: _refreshIndicatorState,
        onRefresh: () async {
          Future.wait([
            _storeHome.getDiscountProducts(refresh: true),
            _storeHome.getLatestProducts(refresh: true)
          ]);
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildProductImagesSlider(),
              Container(
                  margin: const EdgeInsets.only(
                      left: Dimens.marginMedium2, right: Dimens.marginMedium2),
                  child: Text('Discount Items',
                      style: Styles.m2TextTheme
                          .copyWith(fontWeight: FontWeight.bold))),
              _buildDiscountItemList(),
              Container(
                  margin: const EdgeInsets.only(
                      left: Dimens.marginMedium2, right: Dimens.marginMedium2),
                  child: Text('Latest Items',
                      style: Styles.m2TextTheme
                          .copyWith(fontWeight: FontWeight.bold))),
              _buildLatestItemGrid(),
            ],
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
    return Observer(
      builder: (_) {
        final latestProducts = _storeHome.products;
        return GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          padding: const EdgeInsets.all(Dimens.marginMedium),
          childAspectRatio: (120 / 170),
          children: List.generate(_storeHome.products.length, (index) {
            return ProductCard(
                product: latestProducts[index],
                discountItem: latestProducts[index].discountPrice != 0);
          }),
        );
      },
    );
  }

  Widget _buildProductImagesSlider() => Container(
        margin: const EdgeInsets.all(Dimens.marginMedium2),
        height: MediaQuery.of(context).size.height * 0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.marginMedium2),
          child: Swiper(
            itemCount: _images.length,
            indicatorLayout: PageIndicatorLayout.SCALE,
            autoplay: true,
            autoplayDelay: 2000,
            pagination: SwiperPagination(builder: SwiperPagination.dots),
            control: SwiperControl(iconNext: null, iconPrevious: null),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.standardWarningDialog(dialogType: "Coming Soon");
                },
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage("lib/res/images/placeholder.png"),
                  image: NetworkImage(_images[index]),
                ),
              );
            },
          ),
        ),
      );

  @override
  bool get wantKeepAlive => true;
}
