import 'package:flutter/material.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/res/styles.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/models/order.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/stores/store_order_detail.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OrderDetailWidget extends StatefulWidget {
  static const route = "/main/more/order_list/order_detail";

  final Order order;

  const OrderDetailWidget({Key key, this.order}) : super(key: key);

  @override
  _OrderDetailWidgetState createState() => _OrderDetailWidgetState();
}

class _OrderDetailWidgetState extends State<OrderDetailWidget> {
  final StoreOrderDetail _storeOrderDetail = Modular.get<StoreOrderDetail>();

  // List<OrderDummy> dummyOrders = [
  //   OrderDummy("Huawei P 30", 2, "12,000,000", "24,000,000"),
  //   OrderDummy("Huawei P 30", 2, "12,000,000", "24,000,000"),
  //   OrderDummy("Huawei P 30", 2, "12,000,000", "24,000,000")
  // ];

  @override
  void initState() {
    Future.wait([_storeOrderDetail.getOrderDetail()]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M2AppBar(
          showSearch: false,
          title: "အော်ဒါ",
          deleteOnly: false,
          onBackPressed: () => Modular.to.pop()),
      body: Stack(children: <Widget>[
        ScreenBgCard(),
        Container(
          height: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.marginMedium2),
                  child: Text(
                      widget.order.orderdate.dateTimeFromString().dateAndTime(),
                      style: Styles.m2TextTheme.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: Dimens.textRegular2x)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.marginMedium2),
                  child: Text(
                    widget.order.ordercode,
                    style: Styles.m2TextTheme.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.textRegular2_5x),
                  ),
                ),
                Theme(
                    data: Theme.of(context).copyWith(
                        dividerTheme: DividerThemeData(
                            color: Theme.of(context).accentColor)),
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(Dimens.marginMedium),
                          child: Card(
                            elevation: Dimens.cardElevation * 2,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Dimens.marginMedium),
                              child: Observer(builder: (_) {
                                return Column(
                                  children: <Widget>[
                                    DataTable(
                                      columnSpacing: Dimens.marginMedium2,
                                      dataRowHeight: 70,
                                      columns: [
                                        _buildDataColumn('Name'),
                                        _buildDataColumn('Qty'),
                                        _buildDataColumn('Price'),
                                        _buildDataColumn('Amount')
                                      ],
                                      rows: _storeOrderDetail.orderItems
                                          .map((item) {
                                        return DataRow(cells: [
                                          DataCell(SizedBox(
                                            width: 150,
                                            child: Text('${item.productName}'),
                                          )),
                                          DataCell(Text('${item.quantity}')),
                                          DataCell(Text(
                                              item.price.thousandSeparator())),
                                          DataCell(Text(
                                              (item.quantity * item.price)
                                                  .thousandSeparator())),
                                        ]);
                                      }).toList(),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: Dimens.marginMedium),
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                          'Tax : ${_storeOrderDetail.tax.money()}',
                                          style: Styles.m2TextTheme.copyWith(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: Dimens.marginMedium2),
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'Total : ${_storeOrderDetail.total.money()}',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Dimens.textRegular2_5x),
                                      ),
                                    )
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        )
      ]),
    );
  }

  DataColumn _buildDataColumn(String title) => DataColumn(
      label: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: Dimens.textRegular2x)));
}

// class OrderDummy {
//   String name;
//   int qty;
//   String price;
//   String totalAmount;

//   OrderDummy(this.name, this.qty, this.price, this.totalAmount);
// }
