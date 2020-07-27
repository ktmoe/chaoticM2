import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/models/m2_category.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/custom_widgets/expansion_tile.dart';
import 'package:m2mobile/pages/main/categories/product_list/product_list_widget.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget>
    with
        AutomaticKeepAliveClientMixin<CategoriesWidget>,
        SingleTickerProviderStateMixin {
  int currentIndex = 0;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorState =
      GlobalKey<RefreshIndicatorState>();
  final StoreApp _storeApp = Modular.get<StoreApp>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      key: _refreshIndicatorState,
      onRefresh: () async {},
      child: Container(
        margin: const EdgeInsets.all(Dimens.marginMedium),
        child: Observer(builder: (_) {
          var categories = _storeApp.categoryList;
          var subCategoriesMap = _storeApp.subCategoryMap;
          debugPrint('Categories ${categories.length}');
          debugPrint('SubCategories ${subCategoriesMap.length}');
          return ListView(
            children: _buildCategoriesList(),
          );
        }),
      ),
    );
  }

  List<Card> _buildCategoriesList() {
    return List<Card>.generate(
      _storeApp.categoryList.length,
      (index) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.cardCornerRadius),
        ),
        elevation: Dimens.cardElevation,
        child: M2ExpansionTile(
            onExpansionChanged: (val) {},
            key: PageStorageKey(index.toString()), //to fix error
            leading: Icon(_icons[_storeApp.categoryList[index].category],
                color: Color(0x99000000)),
            title: Text(
              _storeApp.categoryList[index].category,
              style: const TextStyle(
                  color: Color(0x99000000), fontWeight: FontWeight.bold),
            ),
            children: _buildSubCategoriesList(_storeApp.categoryList[index])),
      ),
    );
  }

  List<Widget> _buildSubCategoriesList(M2Category category) {
    return _storeApp.subCategoryMap[category]
        .map((item) => ListTile(
            onTap: () {
              Modular.to.pushNamed(ProductListWidget.route,
                  arguments: ProductNameArgs(item.subCategory));
            },
            leading: Icon(Icons.arrow_right, color: Colors.grey),
            title: Text(
              item.subCategory,
              style: const TextStyle(color: const Color(0x99000000)),
            )))
        .toList();
  }

  @override
  bool get wantKeepAlive => true;

  final _icons = {
    "Mobile Phone": M2Icon.phone,
    "Tablet": M2Icon.tablet,
    "Laptop": M2Icon.laptop
  };
}
