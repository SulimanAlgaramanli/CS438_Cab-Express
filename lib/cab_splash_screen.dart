import 'package:cab_express/routes/cab_app_routes.dart';
import 'package:cab_express/services/firebase_auth_service/logic.dart';
import 'package:cab_express/services/local_storage_service.dart';
import 'package:cab_express/utils/user_type.enum.dart';
import 'package:cab_express/widgets/cab_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CabSplashScreen extends StatefulWidget {
  const CabSplashScreen({super.key});

  @override
  State<CabSplashScreen> createState() => _CabSplashScreenState();
}

class _CabSplashScreenState extends State<CabSplashScreen> {
  void goToPath() async {
    await Future.delayed(const Duration(seconds: 2));
    await FirebaseAuthServiceLogic.instance.checkCurrentUserLoggedIn();
    final authStates = FirebaseAuthServiceLogic.instance.authStates;
    if (authStates.isSuccess) {
      final userType = LocalStorageService.instance.userType;
      switch (userType) {
        case UserType.customer:
          Get.offAndToNamed(CabAppRoutes.cabCustomerDashboardScreen);
        case UserType.driver:
          Get.offAndToNamed(CabAppRoutes.cabCustomerDashboardScreen);
      }
    } else {
      Get.toNamed(CabAppRoutes.cabLoginScreen);
    }
  }

  @override
  void initState() {
    super.initState();
    goToPath();
  }

  @override
  Widget build(BuildContext context) {
    final iconSize = MediaQuery.sizeOf(context).width / 4;
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Get.toNamed(CabAppRoutes.cabLoginScreen);
          },
          child: CabLogo(
            iconSize: iconSize * 1.3,
            borderRadiusValue: (iconSize * 1.3) / 2,
          ),
        ),
      ),
    );
  }
}
