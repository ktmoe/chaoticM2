import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/models/responses/product.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/pages/main/product_detail/product_detail_widget.dart';

class ProductCard extends StatefulWidget {

  static const String heroTag = "Product-image-Hero";

  final Product product;

  final String id;

  const ProductCard({Key key,this.product,this.id}) : super(key: key);
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
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: () {
                Modular.to.pushNamed(ProductDetailWidget.route,
                    arguments: ["iPhone SE", widget.id]);
              },
              child: ProductCardHeader(id: widget.id,product: widget.product,),
            ),
          ),
          Expanded(
            flex: 1,
            child: ProductCardBottom(),
          )
        ],
      ),
    );
  }
}

class ProductCardHeader extends StatelessWidget {
  final String id;
  final Product product;

  const ProductCardHeader({Key key, this.id,this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Dimens.marginMedium2),
                  topRight: Radius.circular(Dimens.marginMedium2)),
              child: Hero(
                tag: ProductCard.heroTag + id,
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage("lib/res/images/earth.jpg"),
                  image: NetworkImage(
                      "https://pyxis.nymag.com/v1/imgs/57d/5f1/4e4dae00f150e36a22a13ffa956d4301d8-07-timothee-chalamet.rvertical.w600.jpg"),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.marginMedium, vertical: Dimens.marginSmall),
            child: Text(
              '${product.productname}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                "${product.price} MMK",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCardBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(Dimens.marginMedium2),
              bottomRight: Radius.circular(Dimens.marginMedium2))),
      child: Row(
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
            indent: 12,
            endIndent: 12,
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              M2Icon.cart_plus,
              color: Colors.white,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
