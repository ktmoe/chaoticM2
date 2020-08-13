import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/product_card.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/stores/store_product_list.dart';
import 'package:m2mobile/custom_widgets/list_empty_widget.dart';

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

  @override
  void initState() {
    _storeProductList.getProductsByCategory(
        widget.productName.subcategoryId, true);
    super.initState();
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
      body: Stack(
        children: <Widget>[
          ScreenBgCard(),
          RefreshIndicator(
            key: _refreshIndicatorState,
            onRefresh: () async {},
            child: Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
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
                                        0);
                              }),
                            )
                          : ListEmptyWidget(message: 'ပစ္စည်းများ မရှိသေးပါ');
                    }),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
