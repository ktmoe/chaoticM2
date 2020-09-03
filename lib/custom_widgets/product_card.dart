import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/pages/main/product_detail/product_detail_widget.dart';
import 'package:m2mobile/stores/store_cart.dart';
import 'package:m2mobile/stores/store_home.dart';
import 'package:m2mobile/utils/constants.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final bool discountItem;
  final bool discountByPercent;

  const ProductCard(
      {Key key,
      @required this.product,
      @required this.discountItem,
      this.discountByPercent})
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
        width: 180,
        height: 230,
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
                      discountItem: widget.discountItem,
                      discountByPercent: widget.discountByPercent)),
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
  final bool discountByPercent;

  const ProductCardHeader(
      {Key key, this.product, this.discountItem, this.discountByPercent})
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
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage("lib/res/images/placeholder.png"),
                    image: product.images.toList().isEmpty
                        ? Image.asset("lib/res/images/placeholder.png")
                        : NetworkImage(baseUrl + '/' + product.images[0]),
                  ),
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
                (discountItem && (product.soldCount ?? 0) > 0)
                    ? _buildSoldCountTag(soldCount: product.soldCount)
                    : Container()
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
        discountItem && discountByPercent
            ? Align(
                alignment: Alignment.topRight,
                child: _buildDiscountPercentTag(
                    discount: product.percentAmount.toString()))
            : Container()
      ],
    );
  }

  Widget _buildDeletedOldPrice({int oldPrice}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
        child: Text("$discount % off",
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
  final Product product;

  ProductCardBottom({Key key, this.product}) : super(key: key);

  @override
  _ProductCardBottomState createState() => _ProductCardBottomState();
}

class _ProductCardBottomState extends State<ProductCardBottom> {
  final StoreCart _storeCart = Modular.get<StoreCart>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
          margin: const EdgeInsets.only(top: Dimens.marginSmall),
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(Dimens.marginMedium2),
                  bottomRight: Radius.circular(Dimens.marginMedium2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  icon: Icon(M2Icon.favourite,
                      size: 16,
                      color: (widget.product.favoriteId ?? "").isNotEmpty
                          ? Theme.of(context).iconTheme.color
                          : Colors.white),
                  onPressed: () async {
                    await Modular.get<StoreHome>()
                        .operateFavorite(widget.product);
                  }),
              VerticalDivider(
                color: Colors.white,
                indent: Dimens.marginMedium,
                endIndent: Dimens.marginMedium,
              ),
              IconButton(
                  icon: Icon(
                    _storeCart.cartProducts
                            .containsKey(widget.product.productId)
                        ? M2Icon.cart_cross
                        : M2Icon.cart_plus,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: () async {
                    if (_storeCart.cartProducts
                        .containsKey(widget.product.productId)) {
                      "Item removed from cart.".showSnack(context);
                      _storeCart.removeFromCart(widget.product);
                    } else {
                      "Item added to cart.".showSnack(context);
                      _storeCart.addToCart(widget.product);
                    }
                  }),
            ],
          ));
    });
  }
}
