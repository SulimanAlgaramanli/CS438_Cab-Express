import 'package:get/get.dart';

import 'logic.dart';

class LoginControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginControllerLogic());
  }

  const LoginControllerBinding();
}
