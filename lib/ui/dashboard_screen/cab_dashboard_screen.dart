import 'package:cab_express/controller/dashboard_controller/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CabDashboardScreen extends StatefulWidget {
  const CabDashboardScreen({super.key});

  @override
  State<CabDashboardScreen> createState() => _CabDashboardScreenState();
}

class _CabDashboardScreenState extends State<CabDashboardScreen> {
  final logic = DashboardControllerLogic.instance;
  final state = DashboardControllerLogic.instance.state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => state.screens[state.navScreenIndex]),
      bottomNavigationBar: Obx(() {
        return NavigationBar(
          selectedIndex: state.navScreenIndex,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: logic.changeNavIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.apps_rounded),
              label: 'Apps',
            )
          ],
        );
      }),
    );
  }
}
