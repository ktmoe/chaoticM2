import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m2mobile/pages/main/more/about/about_widget.dart';
import 'package:m2mobile/pages/main/search/m2_search_delegate.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/pages/main/cart/cart_widget.dart';
import 'package:m2mobile/pages/main/notification/notification_widget.dart';

class M2AppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool showSearch;
  final String title;
  final bool deleteOnly;
  final Function onBackPressed;

  M2AppBar(
      {@required this.showSearch,
      @required this.title,
      @required this.deleteOnly,
      @required this.onBackPressed});

  @override
  State<StatefulWidget> createState() => M2AppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class M2AppBarState extends State<M2AppBar> {
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(Dimens.marginMedium),
        height: Dimens.appBarHeight,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: _buildCorrectLeading(),
            ),
            const SizedBox(width: Dimens.marginMedium),
            _buildCorrectTitle(),
            (widget.deleteOnly)
                ? Spacer()
                : Expanded(
                    flex: 2,
                    child: IconButton(
                        icon: Icon(
                          M2Icon.noti,
                          size: 20,
                        ),
                        onPressed: () {
                          Modular.to.pushNamed(NotificationWidget.route);
                        }),
                  ),
            Expanded(
                flex: 2,
                child: widget.deleteOnly
                    ? IconButton(
                        icon: Icon(
                          M2Icon.delete,
                          size: 18,
                        ),
                        onPressed: () {})
                    : Badge(
                        animationDuration: const Duration(milliseconds: 50),
                        badgeColor: Theme.of(context).accentColor,
                        badgeContent: Text(
                          '2',
                          style: TextStyle(color: Colors.white),
                        ),
                        // showBadge: (cartItmes == 0) ? false : true,
                        child: IconButton(
                            icon: Icon(
                              M2Icon.cart,
                              size: 20,
                            ),
                            onPressed: () {
                              Modular.to.pushNamed(CartWidget.route);
                            }),
                      )),
          ],
        ),
      ),
    );
  }

  Widget _buildCorrectTitle() => (widget.showSearch)
      ? _buildSearchBar()
      : Expanded(
          flex: 9,
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        );

  Widget _buildSearchBar() => Expanded(
      child: Material(
        elevation: Dimens.cardElevation,
        child: InkWell(
          onTap: () {
            showSearch(context: context, delegate: M2SearchDelegate());
          },
          child: IgnorePointer(
            child: TextFormField(
              focusNode: focusNode,
              readOnly: true,
              controller: null,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Colors.white,
                suffixIcon: Icon(
                  M2Icon.search,
                  size: Dimens.marginMedium3,
                ),
                hintText: 'Search Item',
                hintStyle: TextStyle(fontSize: Dimens.textRegular),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(Dimens.marginMedium),
              ),
            ),
          ),
        ),
      ),
      flex: 10);

  Widget _buildCorrectLeading() => widget.showSearch
      ? InkWell(
          onTap: () {
            Modular.to.pushNamed(AboutWidget.route);
          },
          child: Hero(
            tag: AboutWidget.heroTag,
            child: SvgPicture.asset(
              "lib/res/svgs/m2_logo.svg",
            ),
          ),
        )
      : InkWell(
          onTap: widget.onBackPressed,
          child: Icon(
            Icons.chevron_left,
            color: Theme.of(context).iconTheme.color,
          ),
        );
}

class M2GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final LinearGradient gradient;
  final Function onBackPressed;

  const M2GradientAppBar(
      {Key key,
      @required this.title,
      this.gradient,
      @required this.onBackPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.all(Dimens.marginMedium),
          height: Dimens.appBarHeight,
          decoration: BoxDecoration(gradient: gradient),
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: onBackPressed,
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
              ),
              Container(
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width - 50),
                alignment: Alignment.center,
                child: Text(title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ],
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
