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
    _storeFav.fetchFavList(true);
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
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels ==
              notification.metrics.maxScrollExtent) {
            Future.wait([_storeFav.fetchFavList(false)]);
          }
          return true;
        },
        child: RefreshIndicator(
          key: _refreshIndicatorState,
          onRefresh: () async {
            await _storeFav.fetchFavList(true);
          },
          child: Stack(
            children: <Widget>[
              ScreenBgCard(),
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Observer(builder: (_) {
                  return _storeFav.favs.isNotEmpty
                      ? GridView.builder(
                          shrinkWrap: true,
                          addAutomaticKeepAlives: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(Dimens.marginMedium),
                          itemCount: _storeFav.favs.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 2,
                                  crossAxisSpacing: 3,
                                  crossAxisCount: 2,
                                  childAspectRatio: (120 / 170)),
                          itemBuilder: (context, index) => ProductCard(
                              product: _storeFav.favs[index],
                              discountItem:
                                  _storeFav.favs[index].discountPrice != 0,
                              discountByPercent:
                                  _storeFav.favs[index].discountType !=
                                      'amount'))
                      : ListEmptyWidget(
                          message: 'သင်ကြိုက်နှစ်သက်သော ပစ္စည်းများ မရှိသေးပါ');
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
