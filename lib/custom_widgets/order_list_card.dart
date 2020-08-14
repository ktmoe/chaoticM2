import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/models/order.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/styles.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:m2mobile/pages/main/more/order_list/order_detail/order_detail_widget.dart';
import 'package:m2mobile/pages/main/more/order_list/complete_order/complete_order_widget.dart';
import 'package:m2mobile/stores/store_home.dart';

class OrderListCard extends StatefulWidget {
  final Order order;

  const OrderListCard({Key key, this.order}) : super(key: key);
  @override
  _OrderListCardState createState() => _OrderListCardState();
}

class _OrderListCardState extends State<OrderListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Dimens.marginMedium),
      child: Card(
        elevation: Dimens.cardElevation * 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.marginMedium2)),
        child: InkWell(
          onTap: () {
            Modular.get<StoreHome>().selectedOrderId = widget.order.id;
            widget.order.status == "Complete"
                ? Modular.to.pushNamed(OrderDetailWidget.route)
                : Modular.to.pushNamed(CompleteOrderWidget.route);
          },
          child: Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    left: Dimens.marginMedium2,
                    right: Dimens.marginMedium2,
                    top: Dimens.marginLargeX,
                    bottom: Dimens.marginMedium2),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            widget.order.orderdate
                                .dateTimeFromString()
                                .dateAndTime(),
                            style: Styles.m2TextTheme.copyWith(
                                fontSize: Dimens.textRegular2x,
                                fontWeight: FontWeight.w500)),
                        Text('${widget.order.totalItem} Items',
                            style: Styles.m2TextTheme.copyWith(
                                fontSize: Dimens.textRegular2x,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.order.ordercode,
                            style: Styles.m2TextTheme.copyWith(
                                fontSize: Dimens.textRegular2_5x,
                                fontWeight: FontWeight.w600)),
                        Text(widget.order.totalPrice.money(),
                            style: Styles.m2TextTheme.copyWith(
                                fontSize: Dimens.textRegular2_5x,
                                fontWeight: FontWeight.w600))
                      ],
                    )
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: _correctTag(widget.order.status))
            ],
          ),
        ),
      ),
    );
  }

  Widget _correctTag(String status) {
    switch (status) {
      case 'Complete':
        return _buildCompleteTag();
      case 'Cancled':
        return _buildCancledTag();
      case 'Pending':
        return _buildPendingTag();
      default:
        return _buildPendingTag();
    }
  }

  Widget _buildCancledTag() => Material(
        color: const Color(0xFFF07848),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimens.marginMedium2),
            bottomLeft: Radius.circular(Dimens.marginMedium2)),
        elevation: Dimens.cardElevation,
        child: Container(
            padding: const EdgeInsets.all(Dimens.marginMedium),
            child: const Text("Cancled",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w800))),
      );

  Widget _buildPendingTag() => Material(
        color: const Color(0xFFE8B12F),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimens.marginMedium2),
            bottomLeft: Radius.circular(Dimens.marginMedium2)),
        elevation: Dimens.cardElevation,
        child: Container(
            padding: const EdgeInsets.all(Dimens.marginMedium),
            child: const Text("Pending",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w800))),
      );

  Widget _buildCompleteTag() => Material(
        color: const Color(0xFF92C038),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimens.marginMedium2),
            bottomLeft: Radius.circular(Dimens.marginMedium2)),
        elevation: Dimens.cardElevation,
        child: Container(
          padding: const EdgeInsets.all(Dimens.marginMedium),
          child: const Text("Complete",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
        ),
      );
}
