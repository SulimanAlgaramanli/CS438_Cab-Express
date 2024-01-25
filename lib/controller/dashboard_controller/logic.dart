import 'package:cab_express/utils/states.dart';
import 'package:get/get.dart';

import 'state.dart';

class DashboardControllerLogic extends GetxController {
  static DashboardControllerLogic get instance => Get.find();
  final DashboardControllerState state = DashboardControllerState();
  final _states = const States().obs;

  States get profileStates => _states.value;

  set profileStates(States value) => _states.value = value;

  Future<void> getProfileUser() async {}

  void changeNavIndex(int value) {
    if (value >= 0 && value < state.screensLength) {
      state.navScreenIndex = value;
    }
  }

  @override
  void onInit() {
    print('DashboardControllerLogic.onInit');
    getProfileUser();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
