import 'package:flutter/material.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/order_list_card.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderListWidget extends StatefulWidget {
  static const route = "/main/more/order_list";

  @override
  _OrderListWidgetState createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey();

  final fakeList = ["Complete", "Pending", "Pending", "Complete", "Complete"];

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
        onRefresh: () async {},
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (_, index) {
              return OrderListCard(tag: fakeList[index]);
            }),
      ),
    );
  }
}
