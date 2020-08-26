import 'package:flutter/material.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/models/product.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/stores/store_cart.dart';
import 'package:m2mobile/utils/constants.dart';

class OrderItemCard extends StatefulWidget {
  final Product product;
  final bool isSummary;

  const OrderItemCard({Key key, @required this.product, this.isSummary})
      : super(key: key);

  @override
  _OrderItemCardState createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  final StoreCart _storeCart = Modular.get<StoreCart>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: _storeCart.showSelect
            ? MediaQuery.of(context).size.width -
                (Dimens.marginLargeX * 2) +
                Dimens.marginMedium2
            : MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Card(
            elevation: Dimens.cardElevation * 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(flex: 3, child: _buildOrderProductImage()),
                  const SizedBox(width: Dimens.marginMedium),
                  Expanded(flex: 3, child: _buildOrderProductInfo()),
                  const SizedBox(width: Dimens.marginMedium),
                  Expanded(flex: 1, child: _buildOrderProductQuantity()),
                  const SizedBox(width: Dimens.marginSmall)
                ])));
  }

  Widget _buildOrderProductImage() => ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16), topLeft: Radius.circular(16)),
        child: Container(
          height: double.infinity,
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage("lib/res/images/placeholder.png"),
            image: widget.product.images.isNotEmpty
                ? NetworkImage(baseUrl + '/' + widget.product.images[0] ?? "")
                : Image.asset("lib/res/images/placeholder.png"),
          ),
        ),
      );

  Widget _buildOrderProductInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.product.productName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: Dimens.textRegular2x, fontWeight: FontWeight.w600)),
        const SizedBox(height: Dimens.marginMedium2),
        Text(widget.product.discountPrice == 0
            ? "Price: ${widget.product.price.toDouble().money()}"
            : "Price: ${widget.product.discountPrice.toDouble().money()}")
      ],
    );
  }

  Widget _buildOrderProductQuantity() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildIncreamentBtn(),
          const SizedBox(height: Dimens.marginMedium),
          Text('${widget.product.quantity}',
              style: TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: Dimens.marginMedium),
          _buildDecrementBtn()
        ],
      );

  Widget _buildIncreamentBtn() {
    return widget.isSummary
        ? Container()
        : InkWell(
            onTap: () {
              _storeCart.addToCart(widget.product);
            },
            child: Card(
                elevation: Dimens.cardElevation,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimens.marginSmall),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: Icon(M2Icon.plus, color: Colors.green))));
  }

  Widget _buildDecrementBtn() {
    return widget.isSummary
        ? Container()
        : InkWell(
            onTap: () {
              _storeCart.removeFromCart(widget.product);
            },
            child: Card(
                elevation: Dimens.cardElevation,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimens.marginSmall),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: Icon(M2Icon.minus, color: Colors.red))));
  }
}
