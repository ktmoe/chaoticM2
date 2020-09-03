import 'dart:io';
import 'dart:core';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:m2mobile/utils/constants.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:m2mobile/models/order_item.dart';
import 'package:m2mobile/models/product.dart';

extension StringX on String {
  bool isJsonFormat() {
    try {
      var _ = json.decode(this) as Map;
      return true;
    } catch (e) {
      return false;
    }
  }

  void makeSnack(GlobalKey<ScaffoldState> state) {
    state.currentState.showSnackBar(this.snackBar());
  }

  void showSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(this.snackBar());
  }

  SnackBar snackBar() =>
      SnackBar(content: Text(this), duration: Duration(seconds: 3));

  String createImageUrl() => "$baseUrl/$this";

  DateTime dateTimeFromString() => DateTime.parse(this);

  String dottedListFromString() => "\u2022${this.replaceAll("\n", "\n\u2022")}";
}

extension DateTimeX on DateTime {
  String dateAndTime() {
    DateFormat dateFormat = DateFormat("d MMM yyyy / HH:mm a");
    return dateFormat.format(this);
  }
}

extension NumX on num {
  String thousandSeparator() {
    final format = NumberFormat("#,###");
    return format.format(this);
  }

  String money() {
    return this.thousandSeparator() + " MMK";
  }
}

extension RequestX on Request {
  bool get shouldBeJSONContentType =>
      !headers.containsKey(HttpHeaders.contentTypeHeader) &&
      body != null &&
      (body as String).isJsonFormat();
}

extension OrderItemX on OrderItem {
  Product get productFromOrderItem => Product((b) {
        b.productId = productid;
        b.productName = productName;
        b.price = price;
        b.images = images.toBuilder();
        b.quantity = quantity;
        b.discountPrice = 0;
      });
}
