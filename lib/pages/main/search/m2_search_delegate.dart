import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/list_empty_widget.dart';
import 'package:m2mobile/custom_widgets/product_card.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/stores/store_search.dart';

class M2SearchDelegate extends SearchDelegate {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorState = GlobalKey();
  final StoreSearch _storeSearch = Modular.get<StoreSearch>();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(scaffoldBackgroundColor: Colors.white);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear, color: Colors.white),
          onPressed: () {
            query = '';
            FocusScope.of(context).requestFocus(FocusNode());
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.chevron_left),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      return _buildSearchResultBody();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? Container()
        : Container(
            padding: const EdgeInsets.all(Dimens.marginMedium2),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Text(
              "See All results for $query",
              style: TextStyle(color: Theme.of(context).accentColor),
            ));
  }

  Widget _buildSearchResultBody() {
    if (query.isNotEmpty) {
      Future.wait([_storeSearch.search(query)]);
    }
    return RefreshIndicator(
      key: _refreshIndicatorState,
      onRefresh: () async {
        await _storeSearch.search(query);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Observer(builder: (_) {
              return _storeSearch.results.isNotEmpty
                  ? GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 120 / 170,
                      padding: const EdgeInsets.all(Dimens.marginMedium),
                      shrinkWrap: true,
                      children:
                          List.generate(_storeSearch.results.length, (index) {
                        return ProductCard(
                            product: _storeSearch.results[index],
                            discountItem:
                                _storeSearch.results[index].discountPrice != 0);
                      }),
                    )
                  : ListEmptyWidget(message: 'ပစ္စည်းများ မရှိသေးပါ');
            })
          ],
        ),
      ),
    );
  }
}
