import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/pages/main/product_detail/product_detail_widget.dart';
import 'package:m2mobile/stores/store_cart.dart';
import 'package:m2mobile/utils/constants.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:math';

class ProductCard extends StatefulWidget {
  final Product product;
  final bool discountItem;

  static const String heroTag = "Product-image-Hero";

  const ProductCard(
      {Key key, @required this.product, @required this.discountItem})
      : super(key: key);
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Dimens.cardElevation * 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.marginMedium2)),
      margin: const EdgeInsets.all(Dimens.marginMedium),
      child: Container(
        width: min(MediaQuery.of(context).size.width * 0.4, 180),
        height: min(MediaQuery.of(context).size.height * 0.3, 200),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: InkWell(
                  onTap: () {
                    Modular.to.pushNamed(ProductDetailWidget.route,
                        arguments: widget.product);
                  },
                  child: ProductCardHeader(
                      product: widget.product,
                      discountItem: widget.discountItem)),
            ),
            Expanded(
              flex: 1,
              child: ProductCardBottom(product: widget.product),
            )
          ],
        ),
      ),
    );
  }
}

class ProductCardHeader extends StatelessWidget {
  final Product product;
  final bool discountItem;

  const ProductCardHeader({Key key, this.product, this.discountItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Dimens.marginMedium2),
                    topRight: Radius.circular(Dimens.marginMedium2)),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage("lib/res/images/earth.jpg"),
                  image: product.images.toList().isEmpty
                      ? AssetImage("lib/res/images/earth.jpg")
                      : NetworkImage(baseUrl + '/' + product.images[0].url),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.marginMedium,
                        vertical: Dimens.marginSmall),
                    child: Text(
                      product.productName == null ? '' : product.productName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
                discountItem
                    ? _buildSoldCountTag(soldCount: product.soldCount)
                    : Container()
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                discountItem
                    ? '${product.discountPrice.toDouble().money()}'
                    : '${product.price.toDouble().money()}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor),
              ),
            ),
            discountItem
                ? _buildDeletedOldPrice(oldPrice: product.price)
                : Container()
          ],
        ),
        discountItem
            ? Align(
                alignment: Alignment.topRight,
                child: _buildDiscountPercentTag(
                    discount: (product.discountType == "amount")
                        ? "${product.percentAmount.money()}"
                        : "${product.percentAmount} %"))
            : Container()
      ],
    );
  }

  Widget _buildDeletedOldPrice({int oldPrice}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          '$oldPrice MMK',
          style: TextStyle(
              decoration: TextDecoration.lineThrough,
              fontSize: Dimens.textRegular_small),
        ),
      );

  Widget _buildDiscountPercentTag({String discount}) {
    return Material(
      color: const Color(0xFF92C038),
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimens.marginMedium2),
          bottomLeft: Radius.circular(Dimens.marginMedium2)),
      elevation: Dimens.cardElevation,
      child: Container(
        padding: const EdgeInsets.all(Dimens.marginMedium),
        child: Text("$discount off",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: Dimens.textRegular)),
      ),
    );
  }

  Widget _buildSoldCountTag({int soldCount}) => Expanded(
        child: Material(
          color: const Color(0xFF92C038),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.marginSmall),
              bottomLeft: Radius.circular(Dimens.marginSmall)),
          elevation: Dimens.cardElevation,
          child: Container(
            padding: const EdgeInsets.all(Dimens.marginSmall),
            child: Text("$soldCount sold",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
      );
}

class ProductCardBottom extends StatefulWidget {
  final StoreCart _storeCart = Modular.get<StoreCart>();
  final Product product;

  ProductCardBottom({Key key, this.product}) : super(key: key);

  @override
  _ProductCardBottomState createState() => _ProductCardBottomState();
}

class _ProductCardBottomState extends State<ProductCardBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Dimens.marginSmall),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(Dimens.marginMedium2),
              bottomRight: Radius.circular(Dimens.marginMedium2))),
      child: Observer(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Icon(
                M2Icon.favourite,
                size: 16,
                // color: addToFav? Colors.white : const Color(0x8AE9E9E9),
              ),
            ),
            VerticalDivider(
              color: Colors.white,
              indent: Dimens.marginMedium,
              endIndent: Dimens.marginMedium,
            ),
            InkWell(
              onTap: () {
                if (widget._storeCart.cartProducts
                    .containsKey(widget.product)) {
                  "Item removed from cart.".showSnack(context);
                  widget._storeCart.removeFromCart(widget.product);
                } else {
                  "Item added to cart.".showSnack(context);
                  widget._storeCart.addToCart(widget.product);
                }
              },
              child: Icon(
                widget._storeCart.cartProducts.containsKey(widget.product)
                    ? M2Icon.cart_cross
                    : M2Icon.cart_plus,
                color: Colors.white,
                size: 18,
              ),
            )
          ],
        );
      }),
    );
  }
}
