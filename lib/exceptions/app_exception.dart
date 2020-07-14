import 'package:flutter/material.dart';

class AppException<T> implements Exception {
  final String message;
  final T data;

  AppException({@required this.message, this.data});

  @override
  String toString() {
    return "$message";
  }
}
