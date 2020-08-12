import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/order_list_card.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/stores/store_order_list.dart';
import 'package:m2mobile/custom_widgets/list_empty_widget.dart';

class OrderListWidget extends StatefulWidget {
  static const route = "/main/more/order_list";

  @override
  _OrderListWidgetState createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey();
  final StoreOrderList _storeOrderList = Modular.get<StoreOrderList>();

  @override
  void initState() {
    _storeOrderList.getOrders();
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
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          await _storeOrderList.getOrders();
        },
        child: Observer(builder: (_) {
          return _storeOrderList.orders.isNotEmpty
              ? ListView.builder(
                  itemCount: _storeOrderList.orders.length,
                  itemBuilder: (_, index) {
                    return OrderListCard(order: _storeOrderList.orders[index]);
                  })
              : ListEmptyWidget(message: 'အော်ဒါမရှိသေးပါ');
        }),
      ),
    );
  }
}
