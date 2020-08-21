import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/product_card.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/stores/store_product_list.dart';
import 'package:m2mobile/custom_widgets/list_empty_widget.dart';
import 'package:mobx/mobx.dart';

class ProductNameArgs {
  final String subcategoryId;
  final String subcategoryName;

  ProductNameArgs(this.subcategoryName, this.subcategoryId);
}

class ProductListWidget extends StatefulWidget {
  static const route = "/main/categories/product_list";

  final ProductNameArgs productName;

  const ProductListWidget({Key key, this.productName}) : super(key: key);

  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorState = GlobalKey();
  final StoreProductList _storeProductList = Modular.get<StoreProductList>();
  final List<ReactionDisposer> _disposers = [];

  ReactionDisposer _onInitDone() =>
      reaction((_) => _storeProductList.initDone, (init) async {
        await _storeProductList.getProductsByCategory(
            widget.productName.subcategoryId, true);
      });

  @override
  void initState() {
    _disposers.addAll([_onInitDone()]);
    _storeProductList.init();
    super.initState();
  }

  @override
  void dispose() {
    _disposers.forEach((element) {
      element();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M2AppBar(
        showSearch: false,
        title: widget.productName.subcategoryName,
        deleteOnly: false,
        onBackPressed: () => Modular.to.pop(),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels ==
              notification.metrics.maxScrollExtent) {
            Future.wait([
              _storeProductList.getProductsByCategory(
                  widget.productName.subcategoryId, false)
            ]);
          }
          return true;
        },
        child: RefreshIndicator(
          key: _refreshIndicatorState,
          onRefresh: () async {
            await _storeProductList.getProductsByCategory(
                widget.productName.subcategoryId, true);
          },
          child: Stack(
            children: <Widget>[
              ScreenBgCard(),
              SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Observer(builder: (_) {
                      return _storeProductList.products.isNotEmpty
                          ? GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 120 / 170,
                              padding:
                                  const EdgeInsets.all(Dimens.marginMedium),
                              shrinkWrap: true,
                              children: List.generate(
                                  _storeProductList.products.length, (index) {
                                return ProductCard(
                                    product: _storeProductList.products[index],
                                    discountItem: _storeProductList
                                            .products[index].discountPrice !=
                                        0,
                                    discountByPercent: _storeProductList
                                            .products[index].discountType !=
                                        "amount");
                              }),
                            )
                          : ListEmptyWidget(message: 'ပစ္စည်းများ မရှိသေးပါ');
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
