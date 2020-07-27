import 'package:flutter/material.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/product_card.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavouriteWidget extends StatefulWidget {
  static const route = "/main/more/favourite";
  @override
  _FavouriteWidgetState createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M2AppBar(
          showSearch: false,
          title: "Favourite List",
          deleteOnly: false,
          onBackPressed: () => Modular.to.pop()),
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
                            product: Product(), discountItem: false);
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
