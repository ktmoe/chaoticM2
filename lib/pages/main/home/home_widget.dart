import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/models/responses/product.dart';
import 'package:m2mobile/pages/main/product_detail/product_detail_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/styles.dart';
import 'package:m2mobile/custom_widgets/product_card.dart';
import 'package:m2mobile/stores/store_home.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m2mobile/utils/extensions.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with AutomaticKeepAliveClientMixin<HomeWidget> {
  List<String> _images = ["", ""];

  final StoreHome _storeHome = Modular.get<StoreHome>();
  final List<ReactionDisposer> _disposer = [];
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorState = GlobalKey();

  ReactionDisposer _onException() {
    return reaction<AppException>((_) => _storeHome.exception, (exception) {
      exception.message.showSnackBar(context);
    });
  }

  @override
  void initState() {
    super.initState();
    _disposer.addAll([_onException()]);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (context) {
        return RefreshIndicator(
            key: _refreshIndicatorState,
            onRefresh: () async {
              await _storeHome.getProductList();
            },
            child: SingleChildScrollView(
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
                  _buildLastestItemGrid(),
                ],
              ),
            ));
      },
    );
  }

  Widget _buildDiscountItemList() => ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.4),
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          padding: const EdgeInsets.all(Dimens.marginMedium),
          childAspectRatio: ((MediaQuery.of(context).size.width * 0.68) / 170),
          children: List.generate(5, (index) {
            return ProductCard(product: Product(), discountItem: true);
          }),
        ),
      );

  Widget _buildLastestItemGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      padding: const EdgeInsets.all(Dimens.marginMedium),
      childAspectRatio: (120 / 170),
      children: List.generate(_storeHome.products.length, (index) {
        return ProductCard(
            product: _storeHome.products[index], discountItem: false);
      }),
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
                  Modular.to.pushNamed(ProductDetailWidget.route,
                      arguments: ["name", "id"]);
                },
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage("lib/res/images/earth.jpg"),
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
