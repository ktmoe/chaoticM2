import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/custom_widgets/product_card.dart';
import 'package:m2mobile/stores/store_home.dart';
import 'package:mobx/mobx.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with AutomaticKeepAliveClientMixin<HomeWidget> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorState = GlobalKey();

  final StoreHome storeHome = Modular.get<StoreHome>();

  @override
  void initState() {
    _refreshIndicatorState.currentState.show();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: const EdgeInsets.all(Dimens.marginMedium),
      child: RefreshIndicator(
        key: _refreshIndicatorState,
        onRefresh: () async{
          await storeHome.getProductList(refresh: true);
          //return _refreshIndicatorState.currentState.show();
        },
        child: Expanded(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(
                        left: Dimens.marginMedium2,
                        right: Dimens.marginMedium2),
                    child: Text('Discount Items')),
                Observer(
                  builder: (_) {
                    final products = storeHome.products;
                    print("products => ${products.length}");
                    return GridView.count(
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
                  );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
