import 'package:flutter/material.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';

class OrderItemCard extends StatefulWidget {
  @override
  _OrderItemCardState createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.82,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Card(
        elevation: Dimens.cardElevation * 2,
        margin: const EdgeInsets.only(right: Dimens.marginMedium),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildOrderProductImage(),
            const SizedBox(width: Dimens.marginMedium),
            _buildOrderProductInfo(),
            const SizedBox(width: Dimens.marginMedium2),
            _buildOrderProductQuantity(),
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
            onTap: () {},
            child: Card(
              elevation: Dimens.cardElevation,
              child: Container(
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
          Text('3'),
          const SizedBox(width: Dimens.marginMedium),
          InkWell(
            onTap: () {},
            child: Card(
              elevation: Dimens.cardElevation,
              child: Container(
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
          Text("Huawei P30 Pro",
              style: TextStyle(
                  fontSize: Dimens.textRegular2x, fontWeight: FontWeight.w600)),
          const SizedBox(height: Dimens.marginMedium2),
          Text("Price: 1,200,000 MMK")
        ],
      );

  Widget _buildOrderProductImage() => ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16), topLeft: Radius.circular(16)),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: double.infinity,
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage("lib/res/images/earth.jpg"),
            image: NetworkImage(""),
          ),
        ),
      );
}
