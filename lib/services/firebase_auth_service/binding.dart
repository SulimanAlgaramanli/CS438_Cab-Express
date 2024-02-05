import 'package:get/get.dart';

import 'logic.dart';

class FirebaseAuthServiceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseAuthServiceLogic());
  }

  const FirebaseAuthServiceBinding();
}
