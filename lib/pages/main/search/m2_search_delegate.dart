import 'package:flutter/material.dart';
import 'package:m2mobile/custom_widgets/product_card.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/res/dimens.dart';

class M2SearchDelegate extends SearchDelegate {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorState = GlobalKey();

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

  Widget _buildSearchResultBody() => RefreshIndicator(
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
                    return ProductCard(product: Product(), discountItem: false);
                  }),
                ),
              ],
            ),
          ),
        ),
      );
}
