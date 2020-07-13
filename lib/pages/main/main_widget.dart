import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/pages/main/home/home_widget.dart';
import 'package:m2mobile/pages/main/more/more_widget.dart';
import 'package:m2mobile/pages/main/categories/categories_widget.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/stores/authenticate_store.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';

class MainWidget extends StatefulWidget {
  static const route = "/login/authenticate/main";

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget>
    with AutomaticKeepAliveClientMixin<MainWidget>, WidgetsBindingObserver {
  final _authenticateStore = Modular.get<AuthenticateStore>();

  int _selectedIndex = 0;

  final PageController pageController = PageController();

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _authenticateStore.init();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: M2AppBar(
            showSearch: (_selectedIndex == 2) ? false : true,
            title: "More",
            deleteOnly: false),
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
        // unselectedItemColor: Theme.of(context).primaryColor.withOpacity(0.5),
        // unselectedIconTheme: const IconThemeData(color: Color(0xFFFF720F)),
        // selectedIconTheme: const IconThemeData(color: Colors.white),
        // selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                M2Icon.home_1,
              ),
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz,
              ),
              title: Text('More'))
        ],
      );

  @override
  bool get wantKeepAlive => true;

  final List<Widget> pages = [HomeWidget(), CategoriesWidget(), MoreWidget()];

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.marginMedium2))),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SvgPicture.asset(
                  "lib/res/svgs/m2_logo.svg",
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                const Text(
                  'You are leaving! Are you sure?',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: Dimens.marginMedium2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      elevation: Dimens.cardElevation,
                      onPressed: () => Navigator.of(context).pop(false),
                      padding: const EdgeInsets.only(
                          left: Dimens.marginMedium2,
                          right: Dimens.marginMedium2),
                      color: Colors.white,
                      textColor: Color(0xFFF47208),
                      child: const Text("No"),
                    ),
                    RaisedButton(
                      elevation: Dimens.cardElevation,
                      onPressed: () => Navigator.of(context).pop(true),
                      padding: const EdgeInsets.only(
                          left: Dimens.marginMedium2,
                          right: Dimens.marginMedium2),
                      color: Color(0xFFF47208),
                      textColor: Colors.white,
                      child: const Text("Yes"),
                    )
                  ],
                )
              ],
            ),
          ),
        ) ??
        Future.value(false);
  }
}
