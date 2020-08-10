import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/product_card.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/exceptions/app_exception.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/stores/store_fav.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:m2mobile/custom_widgets/list_empty_widget.dart';
import 'package:mobx/mobx.dart';

class FavouriteWidget extends StatefulWidget {
  static const route = "/main/more/favourite";
  @override
  _FavouriteWidgetState createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorState = GlobalKey();

  final StoreFav _storeFav = Modular.get<StoreFav>();

  final List<ReactionDisposer> _disposers = [];

  ReactionDisposer _onException() {
    return reaction<AppException>((_) => _storeFav.exception, (exception) {
      exception.message.showSnack(context);
    });
  }

  @override
  void initState() {
    _storeFav.init();
    _disposers.addAll([_onException()]);
    _storeFav.fetchFavList();
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
          title: "Favourite List",
          deleteOnly: false,
          onBackPressed: () => Modular.to.pop()),
      body: Stack(
        children: <Widget>[
          ScreenBgCard(),
          RefreshIndicator(
              key: _refreshIndicatorState,
              onRefresh: () async {
                _storeFav.fetchFavList();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Observer(builder: (_) {
                  return _storeFav.favs.isNotEmpty
                      ? GridView.count(
                          crossAxisCount: 2,
                          padding: const EdgeInsets.all(Dimens.marginMedium),
                          shrinkWrap: true,
                          childAspectRatio: (120 / 170),
                          children:
                              List.generate(_storeFav.favs.length, (index) {
                            var product = _storeFav.favs[index];
                            return ProductCard(
                                product: product,
                                discountItem: product.discountPrice != null);
                          }),
                        )
                      : ListEmptyWidget(
                          message: 'သင်ကြိုက်နှစ်သက်သော ပစ္စည်းများ မရှိသေးပါ');
                }),
              ))
        ],
      ),
    );
  }
}
