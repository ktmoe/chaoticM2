import 'package:flutter/material.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/product_card.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/res/dimens.dart';

class ProductNameArgs {
  final String productName;

  ProductNameArgs(this.productName);
}

class ProductListWidget extends StatefulWidget {
  static const route = "/login/authenticate/main/categories/product_list";

  final ProductNameArgs productName;

  const ProductListWidget({Key key, this.productName}) : super(key: key);

  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M2AppBar(
          showSearch: false,
          title: widget.productName.productName,
          deleteOnly: false),
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
                    GridView.count(
                      primary: false,
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(Dimens.marginMedium),
                      shrinkWrap: true,
                      childAspectRatio: (120 / 170),
                      children: List.generate(17, (index) {
                        return ProductCard(
                          id: index.toString(),
                        );
                      }),
                    ),
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
