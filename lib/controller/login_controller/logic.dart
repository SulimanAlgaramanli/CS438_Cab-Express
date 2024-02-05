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
    if (state.formKey.currentState?.validate() != true) {
      return;
    }
    await authController.loginWithEmailAndPassword(state.authForm);
    final states = authController.authStates;
    if (states.isSuccess) {
      Get.dialog(
        AlertDialog(
          title: const Text('Signup'),
          content: Text(states.messages ?? ''),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.offAllNamed(CabAppRoutes.cabDashboardScreen);
                },
                child: const Text('OK')),
          ],
        ),
      );
    } else if (states.isError) {
      Get.dialog(
        AlertDialog(
          icon: CircleAvatar(
              child: Icon(
            Icons.cancel_outlined,
            size: Get.height / 20,
            color: Colors.redAccent,
          )),
          title: const Text('Login Failed'),
          content: Text(states.messages ?? ''),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('OK')),
          ],
        ),
      );
    }
    clearAuthStates();
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
