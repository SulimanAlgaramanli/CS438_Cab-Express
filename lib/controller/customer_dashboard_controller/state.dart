import 'package:cab_express/ui/customer_screens/home_screens/cab_customer_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerDashboardControllerState {
  final _navScreenIndex = 0.obs;

  int get navScreenIndex => _navScreenIndex.toInt();

  set navScreenIndex(int value) => _navScreenIndex.value = value;

  final screens = const <Widget>[
    CabCustomerHomeScreen(),
  ];

  int get screensLength => screens.length;

  CustomerDashboardControllerState() {
    ///Initialize variables
  }
}
