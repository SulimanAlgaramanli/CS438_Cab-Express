import 'package:cab_express/cab_splash_screen.dart';
import 'package:cab_express/controller/dashboard_controller/binding.dart';
import 'package:cab_express/controller/login_controller/binding.dart';
import 'package:cab_express/controller/sign_up_controller/binding.dart';
import 'package:cab_express/ui/auth_screens/cab_login_screen.dart';
import 'package:cab_express/ui/auth_screens/cab_sign_up_screen.dart';
import 'package:cab_express/ui/dashboard_screen/cab_dashboard_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class CabAppRoutes {
  static const cabRoot = '/';
  static const cabLoginScreen = '/cab/login/screen';
  static const cabSignupScreen = '/cab/signup/screen';
  static const cabDashboardScreen = '/cab/dashboard/screen';

  static final routes = <GetPage>[
    GetPage(name: cabRoot, page: () => const CabSplashScreen()),

    GetPage(
      name: cabLoginScreen,
      page: () => const CabLoginScreen(),
      binding: const LoginControllerBinding(),
    ),
    GetPage(
      name: cabSignupScreen,
      page: () => const CabSignUpScreen(),
      binding: const SignupControllerBinding(),
    ),
    GetPage(
      name: cabDashboardScreen,
      page: () => const CabDashboardScreen(),
      binding: const DashboardControllerBinding(),
    ),
    // GetPage(
    //   name: hrmsManageEmployeesScreen,
    //   page: () => const HRMSManageEmployeesScreen(),
    //   binding: const ManageEmployeesControllerBinding(),
    // ),
    // GetPage(
    //   name: hrmsCreateUpdateEmployeeScreen,
    //   page: () => const HRMSCreateUpdateEmployeeScreen(),
    //   binding: const CreateUpdateEmployeesControllerBinding(),
    // )
  ];
}
