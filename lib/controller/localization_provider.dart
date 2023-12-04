import 'dart:io';

import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  int totalPages = 0;
  int currentPage = 0;
  List allOrdersContent = [];

  void getOrderStatus({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 0;
      allOrdersContent.clear();
    } else {
      currentPage++;
    }
    try {
      ///TODO : API CAll here
    } on SocketException catch (e) {
      print('Catch exception in getOrderStatus --> ${e.message}');
    }
  }
}
