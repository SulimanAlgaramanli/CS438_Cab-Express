import 'package:get/get.dart';

import 'logic.dart';

class SignupControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignupControllerLogic());
  }

  const SignupControllerBinding();
}
