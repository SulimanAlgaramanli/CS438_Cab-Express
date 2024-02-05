import 'package:cab_express/routes/cab_app_routes.dart';
import 'package:cab_express/services/firebase_auth_service/logic.dart';
import 'package:cab_express/utils/states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class LoginControllerLogic extends GetxController {
  static LoginControllerLogic get instance => Get.find();
  final LoginControllerState state = LoginControllerState();
  final authController = FirebaseAuthServiceLogic.instance;

  States get states => authController.authStates;

  void clearAuthStates() {
    authController.authStates = const States();
  }

  void onLoginPressed() async {
    // TODO: implement onLoginPressed
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    state.dispose();
    super.onClose();
  }
}
