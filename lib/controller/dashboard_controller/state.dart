import 'package:cab_express/home_screens/cab_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardControllerState {

  final _navScreenIndex = 0.obs;

  int get navScreenIndex => _navScreenIndex.toInt();

  set navScreenIndex(int value) => _navScreenIndex.value = value;

  final screens = const <Widget>[
    CabHomeScreen(),
  ];

  int get screensLength => screens.length;

  DashboardControllerState() {
    ///Initialize variables
  }
}
