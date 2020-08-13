import 'package:flutter/material.dart';
import 'package:m2mobile/models/cart_item.dart';
import 'package:m2mobile/models/requests/update_cart_request.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/stores/cart_store.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/models/product.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/stores/store_cart.dart';
import 'package:m2mobile/utils/constants.dart';

class OrderItemCard extends StatefulWidget {
  final Product product;
  final int count;

  const OrderItemCard({Key key, @required this.product, @required this.count})
      : super(key: key);

  @override
  _OrderItemCardState createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  final StoreCart _storeCart = Modular.get<StoreCart>();
  final CartStore _cartStore = Modular.get<CartStore>();

  int qty = 0;

  @override
  void initState() {
    qty = widget.count;
    print("item card jsonstring => ${widget.product.toJson()}");
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
          ],
        ),
      ),
    );
  }

  Widget _buildOrderProductQuantity() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: (){
              setState(() {
                  qty+=1;
              });
              Future.delayed(const Duration(milliseconds: 1500),() async{
                print("qty before api request => ${qty}");
                print("json string of product => ${widget.product.toJson()}");
                print("cart id before api request => ${widget.product.cartId}");
                final updateItem = UpdateCartRequest((b)=>b..updateItem.quantity = qty);
                _cartStore.updateCartItemQty(widget.product.cartId,updateItem.toJson());
                _cartStore.fetchCartItems(refresh: true);
              });
            },
            child: Card(
              elevation: Dimens.cardElevation,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: Dimens.marginSmall),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Icon(M2Icon.plus, color: Colors.green),
              ),
            ),
          ),
          const SizedBox(width: Dimens.marginMedium),
          Text("$qty"),
          const SizedBox(width: Dimens.marginMedium),
          InkWell(
            onTap: () {
              setState(() {
                qty--;
                qty = (qty<0)? 0 : qty;
              });
              Future.delayed(const Duration(milliseconds: 1500),() async{
                final updateItem = UpdateCartRequest((b)=>b..updateItem.quantity = qty);
                print("cart id => ${widget.product.cartId}");
                print("qty before api request => ${qty}");
                print("cart id before api request => ${widget.product.cartId}");
                 _cartStore.updateCartItemQty(widget.product.cartId,updateItem.toJson());
                 _cartStore.fetchCartItems(refresh: true);
              });
             // _storeCart.removeFromCart(widget.product);
            },
            child: Card(
              elevation: Dimens.cardElevation,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: Dimens.marginSmall),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Icon(M2Icon.minus, color: Colors.red),
              ),
            ),
          ),
        ],
      );

  Widget _buildOrderProductInfo() => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.product.productName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: Dimens.textRegular2x, fontWeight: FontWeight.w600)),
          const SizedBox(height: Dimens.marginMedium2),
          Text("Price: ${widget.product.price.toDouble().money()}")
        ],
      );

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
                : AssetImage("lib/res/images/placeholder.png"),
          ),
        ),
      );
}
