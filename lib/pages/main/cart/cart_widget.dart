import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/custom_widgets/order_item_card.dart';
import 'package:m2mobile/pages/main/cart/order/order_widget.dart';
import 'package:m2mobile/pages/main/more/order_list/complete_order/complete_order_widget.dart';
import 'package:m2mobile/stores/store_cart.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/utils/extensions.dart';

class CartWidget extends StatefulWidget {
  final bool isSummary;

  static const route = "/main/cart";

  const CartWidget({Key key, this.isSummary}) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final StoreCart _storeCart = Modular.get<StoreCart>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return WillPopScope(
          onWillPop: _cartBackPressed,
          child: Scaffold(
              appBar: M2AppBar(
                showSearch: false,
                title: widget.isSummary ? "Your Order" : "My Cart",
                deleteOnly: !widget.isSummary,
                onBackPressed: () async {
                  final pop = await _cartBackPressed();
                  if (pop) Modular.to.pop();
                },
                onDeletePressed: widget.isSummary ? null : _cartDeletePressed,
              ),
              body: _storeCart.cartCount == 0
                  ? _buildEmptyBody()
                  : _buildNonEmptyBody()));
    });
  }

  Widget _buildNonEmptyBody() => Stack(
        children: <Widget>[
          _buildOrderList(),
          Align(
              alignment: Alignment.bottomCenter,
              child: BottomSheet(isSummary: widget.isSummary))
        ],
      );

  Widget _buildOrderList() {
    //final cartProductsMap = _storeCart.cartProducts;
    //final cartProducts = cartProductsMap.keys.toList();
    //final cartCounts = cartProductsMap.values.toList();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.marginMedium),
      margin: const EdgeInsets.only(bottom: Dimens.marginLargeX),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _storeCart.showSelect
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(
                        activeColor: Colors.green,
                        value: _storeCart.selectedProductIds.length ==
                            _storeCart.cartProducts.length,
                        onChanged: (val) {
                          _storeCart.selectedProductIds.clear();
                          if (val)
                            _storeCart.selectedProductIds.addAll(_storeCart
                                .cartProducts.values
                                .map((e) => e.productId));
                        }),
                    const Text('Select all',
                        style: TextStyle(
                            color: Color(0xff99000000),
                            fontSize: Dimens.textRegular2_5x))
                  ],
                )
              : Container(height: Dimens.marginLarge),
          Observer(
            builder: (_) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: _storeCart.cartProducts.length,
                      itemBuilder: (context, index) {
                        return _buildOrderRow(
                            _storeCart.cartProducts.values.toList()[index]);
                      }));
            },
          )
        ],
      ),
    );
  }

  Widget _buildOrderRow(Product product) => Container(
        padding: const EdgeInsets.only(bottom: Dimens.marginMedium3),
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.horizontal,
          children: <Widget>[
            AnimatedCrossFade(
                duration: Duration(milliseconds: 400),
                firstChild: Checkbox(
                    activeColor: Colors.green,
                    value: _storeCart.selectedProductIds
                            .contains(product.productId) ??
                        false,
                    onChanged: (val) {
                      val
                          ? _storeCart.selectedProductIds.add(product.productId)
                          : _storeCart.selectedProductIds
                              .remove(product.productId);
                    }),
                secondChild: Container(width: 20),
                crossFadeState: _storeCart.showSelect
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond),
            InkWell(
                onLongPress: () {
                  if (!widget.isSummary) {
                    if (!_storeCart.showSelect) {
                      _storeCart.showSelect = true;
                      _storeCart.selectedProductIds.add(product.productId);
                    }
                  }
                },
                child: OrderItemCard(
                    product: product, isSummary: widget.isSummary))
          ],
        ),
      );

  Widget _buildEmptyBody() => Stack(
        children: <Widget>[
          _buildEmptyCartView(),
          Align(
              alignment: Alignment.bottomCenter,
              child: BottomSheet(isSummary: widget.isSummary))
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

  void _cartDeletePressed() {
    if (_storeCart.showSelect) {
      _storeCart.selectedProductIds.forEach((delete) {
        _storeCart.removeFromCart(_storeCart.cartProductById(delete),
            all: true);
      });
      _storeCart.selectedProductIds.clear();
      if (_storeCart.cartProducts.isEmpty) _storeCart.showSelect = false;
    } else {
      _storeCart.selectedProductIds.clear();
      _storeCart.showSelect = true;
    }
  }

  Future<bool> _cartBackPressed() async {
    if (_storeCart.showSelect) {
      _storeCart.showSelect = false;
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}

class BottomSheet extends StatefulWidget {
  final bool isSummary;

  const BottomSheet({Key key, this.isSummary}) : super(key: key);
  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  final StoreCart _storeCart = Modular.get<StoreCart>();
  @override
  Widget build(BuildContext context) {
    return _storeCart.cartProducts.isEmpty
        ? _buildEmptyCartBottomSheet()
        : _buildNonEmptyCartBottomSheet();
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
          onPressed: () {
            Modular.to.pop();
          },
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
        padding: const EdgeInsets.all(Dimens.marginMedium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Amount",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: Dimens.textRegular2_5x)),
            Text(_storeCart.amount.toDouble().money(),
                textAlign: TextAlign.end,
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
            Text(_storeCart.tax.toDouble().money(),
                textAlign: TextAlign.end,
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
            Text(_storeCart.total.toDouble().money(),
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w800,
                    fontSize: Dimens.textRegular2_5x))
          ],
        ),
      );

  Widget _buildNonEmptyCartBottomSheet() => DraggableScrollableSheet(
        maxChildSize: 0.4,
        initialChildSize: 0.06,
        minChildSize: 0.06,
        builder: (context, scrollController) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: const EdgeInsets.only(
                left: Dimens.marginMedium, right: Dimens.marginMedium),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Divider(thickness: 3),
                  ),
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
                        left: Dimens.marginLargeX, right: Dimens.marginLargeX),
                    color: Theme.of(context).buttonColor,
                    textColor: Colors.white,
                    disabledTextColor: Colors.white,
                    onPressed: () {
                      widget.isSummary
                          ? Modular.to
                              .pushReplacementNamed(CompleteOrderWidget.route)
                          : Modular.to.pushNamed(OrderWidget.route);
                    },
                    child: Text(
                        widget.isSummary ? '‌ငွေလွှဲစလစ်ပို့ရန်' : 'Order'),
                  )
                ],
              ),
            ),
          );
        },
      );

  @override
  void dispose() {
    Modular.get<StoreCart>().emptyTheCart();
    super.dispose();
  }
}
