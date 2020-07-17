import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/custom_widgets/expansion_tile.dart';
import 'package:m2mobile/pages/main/categories/product_list/product_list_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      key: _refreshIndicatorState,
      onRefresh: () async {},
      child: Container(
        margin: const EdgeInsets.all(Dimens.marginMedium),
        child: ListView(
          children: _buildCategoriesList(),
        ),
      ),
    );
  }

  List<Card> _buildCategoriesList() {
    return List<Card>.generate(
      _categories.length,
      (index) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.cardCornerRadius),
        ),
        elevation: Dimens.cardElevation,
        child: M2ExpansionTile(
            onExpansionChanged: (val) {},
            key: PageStorageKey(index.toString()), //to fix error
            leading: Icon(_icons[_categories[index]], color: Color(0x99000000)),
            title: Text(
              _categories[index],
              style: const TextStyle(
                  color: Color(0x99000000), fontWeight: FontWeight.bold),
            ),
            children: _buildSubCategoriesList(_categories[index])),
      ),
    );
  }

  List<Widget> _buildSubCategoriesList(String categoryName) {
    return _subCategoriesMap[categoryName]
        .map((item) => ListTile(
            onTap: () {
              Modular.to.pushNamed(ProductListWidget.route,
                  arguments: ProductNameArgs(item));
            },
            leading: Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            title: Text(
              item,
              style: const TextStyle(color: const Color(0x99000000)),
            )))
        .toList();
  }

  @override
  bool get wantKeepAlive => true;

  final _categories = ["Mobile Phone", "Tablet", "Laptop"];
  final _subCategoriesMap = {
    "Mobile Phone": ["Apple", "Samsung", "Xiaomi", "Huawei", "Vivo"],
    "Tablet": ["Apple", "Samsung", "Xiaomi", "Huawei", "Vivo"],
    "Laptop": [
      "Apple",
      "Huawei",
      "Lenovo",
      "HP",
      "DELL",
      "Xiaomi",
      "Samsung",
      "MSI"
    ]
  };
  final _icons = {
    "Mobile Phone": M2Icon.phone,
    "Tablet": M2Icon.tablet,
    "Laptop": M2Icon.laptop
  };
}
