import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2mobile/custom_widgets/one_call_away_widget.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/pages/main/home/home_widget.dart';
import 'package:m2mobile/pages/main/more/more_widget.dart';
import 'package:m2mobile/pages/main/categories/categories_widget.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:mobx/mobx.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainWidget extends StatefulWidget {
  static const route = "/main";

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget>
    with AutomaticKeepAliveClientMixin<MainWidget> {
  final PageController pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  final StoreApp _storeApp = Modular.get<StoreApp>();
  int _selectedIndex = 0;
  List<ReactionDisposer> _disposers = [];

  ReactionDisposer _onConnectivityChanged() => autorun((_) {
        if (!_storeApp.isNetworkOn)
          "You are offline.".makeSnack(_scaffoldState);
      });

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _disposers.addAll([_onConnectivityChanged()]);
  }

  @override
  void dispose() {
    super.dispose();
    _disposers.forEach((element) {
      element();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: context.appLeaveWarning,
      child: Scaffold(
        key: _scaffoldState,
        appBar: M2AppBar(
            showSearch: (_selectedIndex == 2) ? false : true,
            title: "More",
            deleteOnly: false,
            onBackPressed: () async {
              final willPop = await context.appLeaveWarning();
              if (willPop) {
                SystemNavigator.pop();
              }
            }),
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: pages,
        ),
        bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      ),
    );
  }

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (index) {
          pageController.jumpToPage(index);
        },
        currentIndex: selectedIndex,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(M2Icon.home_1, size: 18), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz), title: Text('More'))
        ],
      );

  @override
  bool get wantKeepAlive => true;

  final List<Widget> pages = [HomeWidget(), CategoriesWidget(), MoreWidget()];
}
