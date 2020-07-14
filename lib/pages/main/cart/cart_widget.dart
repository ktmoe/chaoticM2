import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/custom_widgets/order_item_card.dart';
import 'package:m2mobile/pages/main/cart/order/order_widget.dart';

class CartWidget extends StatefulWidget {
  static const route = "/login/authenticate/main/cart";

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: M2AppBar(
          showSearch: false,
          title: "My Cart",
          deleteOnly: true,
          onBackPressed: () => Modular.to.pop(),
        ),
        body: _buildNonEmptyBody());
  }

  Widget _buildNonEmptyBody() => Stack(
        children: <Widget>[
          _buildOrderList(),
          Align(alignment: Alignment.bottomCenter, child: BottomSheet())
        ],
      );

  Widget _buildOrderList() => Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.marginMedium),
        margin: const EdgeInsets.only(bottom: Dimens.marginLargeX),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Checkbox(
                    activeColor: Colors.green,
                    value: true,
                    onChanged: (val) {}),
                const Text('Select all',
                    style: TextStyle(
                        color: Color(0xff99000000),
                        fontSize: Dimens.textRegular2_5x))
              ],
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return _buildOrderRow();
                    }))
          ],
        ),
      );

  Widget _buildOrderRow() => Container(
        padding: const EdgeInsets.only(bottom: Dimens.marginMedium3),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Checkbox(
                activeColor: Colors.green, value: true, onChanged: (val) {}),
            OrderItemCard()
          ],
        ),
      );

  Widget _buildEmptyBody() => Stack(
        children: <Widget>[
          _buildEmptyCartView(),
          Align(alignment: Alignment.bottomCenter, child: BottomSheet())
        ],
      );

  Widget _buildEmptyCartView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            M2Icon.empty_cart,
            size: 150,
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          Text('There are no items in the cart',
              style: TextStyle(
                  fontSize: Dimens.textRegular2x,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.headline1.color)),
        ],
      ),
    );
  }
}

class BottomSheet extends StatefulWidget {
  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return _buildNonEmptyCartBottomSheet();
  }

  Widget _buildEmptyCartBottomSheet() => Container(
        alignment: Alignment.centerRight,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(Dimens.marginMedium),
        height: 60,
        color: Colors.white,
        child: RaisedButton(
          elevation: Dimens.marginMedium2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          disabledColor: Colors.white,
          onPressed: () {},
          color: Colors.white,
          textColor: Theme.of(context).accentColor,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    'SHOPPING',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  )),
              Icon(Icons.chevron_right)
            ],
          ),
        ),
      );

  Widget _buildAmountText() => Container(
        padding: const EdgeInsets.all(Dimens.marginSmall),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Amount",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: Dimens.textRegular2_5x)),
            Text("18,000,000 MMK",
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w800,
                    fontSize: Dimens.textRegular2_5x))
          ],
        ),
      );

  Widget _buildTaxText() => Container(
        padding: const EdgeInsets.all(Dimens.marginMedium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Tax",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: Dimens.textRegular2_5x)),
            Text("9,000 MMK",
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w800,
                    fontSize: Dimens.textRegular2_5x))
          ],
        ),
      );

  Widget _buildTotalText() => Container(
        padding: const EdgeInsets.all(Dimens.marginMedium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Total",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: Dimens.textRegular2_5x)),
            Text("18,009,000 MMK",
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w800,
                    fontSize: Dimens.textRegular2_5x))
          ],
        ),
      );

  Widget _buildNonEmptyCartBottomSheet() => DraggableScrollableSheet(
        maxChildSize: 0.3,
        initialChildSize: 0.06,
        minChildSize: 0.06,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      top: Dimens.marginMedium3,
                      left: Dimens.marginMedium,
                      right: Dimens.marginMedium),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _buildAmountText(),
                        _buildTaxText(),
                        const Divider(
                            height: 2,
                            indent: Dimens.marginLarge,
                            endIndent: Dimens.marginLarge),
                        _buildTotalText(),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.only(
                              left: Dimens.marginLargeX,
                              right: Dimens.marginLargeX),
                          color: Theme.of(context).buttonColor,
                          textColor: Colors.white,
                          disabledTextColor: Colors.white,
                          onPressed: () {
                            Modular.to.pushNamed(OrderWidget.route);
                          },
                          child: const Text("Order"),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Divider(thickness: 2),
                )
              ],
            ),
          );
        },
      );
}
